//
//  WishListViewRow.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import SwiftUI

struct WishListViewRow: View {
    @State private var isOn = false
    
    var wish: Wish
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "sun.max")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .padding(.horizontal, 10)
            Text("\(wish.text)")
            Spacer()
            Toggle(isOn: $isOn) {
            }
            .toggleStyle(WishCheckBox())
            .padding(.trailing, 20)
        }
        .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
        .frame(height: 40)
        .padding(.top, 10)
    }
}

struct WishCheckBox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark" : "circle" )
                    .foregroundColor(.primary)
            }
        }
    }
}

struct WishListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        WishListViewRow(wish: Wish.list[0])
    }
}
