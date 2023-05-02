//
//  WishListViewRow.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import SwiftUI

struct WishListViewRow: View {
    @State var isToggleOn: Bool = false
    @State private var isOn = false
    
    var body: some View {
        HStack() {
            Image(systemName: "sun.max")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .padding(.horizontal, 10)
            Text("This is Simple Sample")
            Spacer()
            Toggle(isOn: $isOn) {
            }
            .toggleStyle(WishCheckBox())
        }
        .font(.system(size: 18, weight: .medium, design: .serif))
        .padding(8)
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
        WishListViewRow()
    }
}
