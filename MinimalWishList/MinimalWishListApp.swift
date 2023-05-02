//
//  MinimalWishListApp.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import SwiftUI

@main
struct MinimalWishListApp: App {
    var body: some Scene {
        WindowGroup {
            WishListView(vm: WishListViewModel(storage: WishListStorage())).onAppear {
                for family: String in UIFont.familyNames {
                                print(family)
                                for names : String in UIFont.fontNames(forFamilyName: family){
                                    print("=== \(names)")
                                }
                            }
            }
        }
    }
}
