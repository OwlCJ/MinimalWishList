//
//  WishAddView.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/05/03.
//

import SwiftUI

struct WishAddView: View {
    @StateObject var vm: WishListViewModel
    @FocusState private var addWishFocused: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("What's your Wish?")
                .font(.custom("NewYork-SemiBoldItalic", size: 30))
            Rectangle()
                .foregroundColor(.primary)
                .frame(height: 1)
                .padding(.bottom, 20)
            HStack {
                Text(">")
                TextField("Write your Wish Here", text: $vm.newWishText)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
                    .focused($addWishFocused)
                    .onSubmit {
                        vm.addWish()
                        vm.isPresented = false
                    }
            }
            Spacer()
            WishDatePickerView(vm: vm)
            WishIconPickerView(vm: vm)
        }
        .padding()
        .onAppear {
            addWishFocused = true
        }
        .onDisappear() {
            vm.newWishText = ""
            vm.newWishImage = .etc
        }
    }
}

struct WishAddView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishAddView(vm: vm)
    }
}
