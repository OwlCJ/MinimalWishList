//
//  WishListViewRow.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import SwiftUI

struct WishListRow: View {
    @Binding var wish: Wish
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "sun.max")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .padding(.horizontal, 10)
            Text(wish.text).strikethrough(wish.isDone)
            Spacer()
            Toggle(isOn: $wish.isDone) {
            }
            .toggleStyle(WishCheckBox())
            .padding(.trailing, 20)
        }
        .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
        .frame(height: 40)
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

struct WishListRow_Previews: PreviewProvider {
    static var previews: some View {
        WishListRow(wish: .constant(Wish.list[0]))
    }
}
