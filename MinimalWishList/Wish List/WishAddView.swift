
import SwiftUI

struct WishAddView: View {
    @StateObject var vm: WishListViewModel
    @FocusState private var wishFocused: Bool
    @State var isEdit = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("What's your Wish?")
                .font(.custom("NewYork-SemiBoldItalic", size: 30))
            Rectangle()
                .foregroundColor(.primary)
                .frame(height: 1)
                .padding(.top, 15)
                .padding(.bottom, 20)
            HStack {
                Text("Title")
                .font(.custom("NewYork-SemiBold", size: 24))
                Spacer()
            }
            
            HStack {
                Text(">>")
                    .padding(5)
                TextField("Title", text: $vm.newWish.title)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 20))
                    .focused($wishFocused)
                    .onSubmit {
                        vm.addWish()
                        vm.isAddPresented = false
                    }
            }
            .padding(.bottom)
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
        .padding()
        .onAppear {
            wishFocused = true
        }
        .onDisappear() {
            vm.resetNewWish()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    vm.isAddPresented = false
                } label: {
                    Text("Cancel")
                }

            }
        }
    }
}

struct WishAddView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishAddView(vm: vm)
    }
}
