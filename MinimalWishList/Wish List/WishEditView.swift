
import SwiftUI

struct WishEditView: View {
    @Binding var wish: Wish
    @Binding var isEditPresented: Bool
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
                        vm.editWish(wish: wish)
                        isEditPresented = false
                    }
            }
            Spacer()
            WishDatePickerView(vm: vm)
            WishIconPickerView(vm: vm)
        }
        .padding()
        .onAppear {
            wishFocused = true
            vm.newWishImage = wish.image
            vm.newWishText = wish.text
            vm.newWishEndDate = wish.endDate
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
        WishEditView(wish: .constant(Wish.list[0]),isEditPresented: .constant(true) ,vm: vm)
    }
}
