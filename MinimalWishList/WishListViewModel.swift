//
//  WishListViewModel.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/05/02.
//

import Foundation
import Combine

final class WishListViewModel: ObservableObject {
    let storage: WishListStorage
    
    @Published var list: [Wish] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: WishListStorage) {
        self.storage = storage
        bind()
    }
    
    func addWish(text: String) {
        let newWish = Wish(text: text, date: Date(), isDone: false)
        self.list.append(newWish)
    }
    
    func deleteWish(at offsets: IndexSet) {
        self.list.remove(atOffsets: offsets)
    }
    
    private func bind() {
        $list.sink { items in
            self.persist(items: items)
        }.store(in: &subscriptions)
    }
    
    func persist(items: [Wish]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
