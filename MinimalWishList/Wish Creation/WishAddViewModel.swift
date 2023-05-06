//
//  WishAddViewModel.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/05/04.
//
//
//import Foundation
//
//final class WishAddViewModel: ObservableObject {
//    
//    
//    @Published var isPresented: Bool
//    @Published var newWishText: String
//    @Published private var addWishFocused: Bool
//    
//    
//    func addWish(text: String) {
//        let newWish = Wish(text: text, date: Date(), isDone: false)
//        self.list.append(newWish)
//    }
//}
