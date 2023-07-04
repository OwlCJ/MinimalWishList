
import SwiftUI

struct WishEditView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var wish: Wish
    @StateObject var vm: WishListViewModel
    @FocusState private var wishFocused: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Title")
                .font(.custom("NewYork-SemiBold", size: 22))
                Spacer()
            }
            HStack {
                Text(">")
                    .padding(5)
                TextField("Write down your wish Here : )", text: $vm.newWish.title)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
                    .focused($wishFocused)
                    .onSubmit {
                        vm.editWish()
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            Spacer()
            HStack {
                Text("Description")
                .font(.custom("NewYork-SemiBold", size: 20))
                Spacer()
            }
            HStack {
                VStack {
                    Text(">")
                        .padding(.vertical, 5)
                        .padding(.leading, 4)
                    Spacer()
                }
                TextEditor(text: $vm.newWish.description)
                    .lineSpacing(5)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
            }
            Spacer()
            WishDatePickerView(vm: vm)
            WishIconPickerView(vm: vm)
        }
        .navigationTitle("Edit Wish")
        .toolbar {
            ToolbarItem {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    vm.editWish()
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                .foregroundStyle(.primary)
            }
        }
        .padding()
        .onAppear {
            wishFocused = true
            vm.newWish = wish
        }
        .onDisappear {
            vm.resetNewWish()
        }
    }
}

struct WishEditView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishEditView(wish: .constant(Wish.list[0]) ,vm: vm)
    }
}
