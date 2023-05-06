//
//  WishIconPickerView.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/05/04.
//

import SwiftUI

struct WishIconPickerView: View {
    @StateObject var vm: WishListViewModel
    
    let icons: [WishImage] = WishImage.allCases
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 20) {
            ForEach(icons[0..<6], id: \.self) { icon in
                Button {
                    vm.newWishImage = icon
                } label: {
                    Image(systemName: icon.imageName)
                }
                .foregroundColor( vm.newWishImage == icon ? .primary : .secondary)
            }
            ForEach(icons[6...], id: \.self) { icon in
                Button {
                    vm.newWishImage = icon
                } label: {
                    Image(systemName: icon.imageName)
                }
                .foregroundColor( vm.newWishImage == icon ? .primary : .secondary)
            }
        }
        .font(.system(size: 25))
    }
}

struct WishIconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WishListViewModel(storage: WishListStorage())
        WishIconPickerView(vm: vm)
    }
}