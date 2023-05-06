//
//  WishListViewModel.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/05/02.
//

import Foundation
import Combine
import LocalAuthentication

final class WishListViewModel: ObservableObject {
    let storage: WishListStorage
    
    @Published var list: [Wish] = []
    @Published var newWishText: String = ""
    @Published var newWishImage: WishImage = .etc
    @Published var newWishEndDate: Date = Date()
    @Published var isPresented: Bool = false
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: WishListStorage) {
        self.storage = storage
        bind()
    }
    
    func addWish() {
        guard !newWishText.isEmpty else { return }
        let newWish = Wish(image: newWishImage, text: newWishText, startDate: Date(), endDate: newWishEndDate, isDone: false)
        self.list.append(newWish)
    }
    
    //For Editing
    func deleteWish(at offsets: IndexSet) {
        self.list.remove(atOffsets: offsets)
    }
    
    func moveWish(from source: IndexSet, to destination: Int) {
        self.list.move(fromOffsets: source, toOffset: destination)
    }
    
    private func bind() {
        $list.sink { items in
            self.persist(items: items)
        }.store(in: &subscriptions)
    }
    
    //Data Store & Load
    func persist(items: [Wish]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
