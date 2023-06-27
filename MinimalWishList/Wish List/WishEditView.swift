
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
                .font(.custom("NewYork-SemiBold", size: 25))
                Spacer()
            }
            
            HStack {
                Text(">>")
                    .padding(5)
                TextField("Title", text: $vm.newWish.title)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
                    .focused($wishFocused)
                    .onSubmit {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding(.bottom, 30)
            HStack {
                Text("Description")
                .font(.custom("NewYork-SemiBold", size: 22))
                Spacer()
            }
            HStack {
                VStack {
                    Text(">")
                        .padding(5)
                    Spacer()
                }
                TextEditor(text: $vm.newWish.description)
                    .lineSpacing(10)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
            }
            Spacer()
            WishDatePickerView(vm: vm)
            WishIconPickerView(vm: vm)
        }
        .navigationTitle("Edit Wish")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    vm.editWish()
                }, label: {
                    Image(systemName: "checkmark")
                })
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
