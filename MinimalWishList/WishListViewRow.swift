//
//  WishListViewRow.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import SwiftUI

struct WishListViewRow: View {
    
    @State var isToggleOn: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "sun.max")
            Text("This is Sample Text")
        }
        .font(.system(size: 22, weight: .medium, design: .serif))
    }
}

struct WishListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        WishListViewRow()
    }
}
