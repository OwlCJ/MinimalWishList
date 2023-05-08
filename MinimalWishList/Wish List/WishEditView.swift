
import SwiftUI

struct WishEditView: View {
    @StateObject var vm: WishListViewModel
    @FocusState private var wishFocused: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Edit your Wish?")
                .font(.custom("NewYork-SemiBoldItalic", size: 30))
            Rectangle()
                .foregroundColor(.primary)
                .frame(height: 1)
                .padding(.bottom, 20)
            HStack {
                Text(">")
                TextField("Write your Wish Here", text: $vm.newWishText)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
                    .focused($wishFocused)
                    .onSubmit {
                        vm.editWish()
                        vm.isEditPresented = false
                    }
            }
            Spacer()
            WishDatePickerView(vm: vm)
            WishIconPickerView(vm: vm)
        }
        .padding()
        .onAppear {
            wishFocused = true
        }
        .onDisappear() {
            vm.newWishText = ""
            vm.newWishImage = .etc
        }
    }
}

struct WishEditView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishEditView(vm: vm)
    }
}
