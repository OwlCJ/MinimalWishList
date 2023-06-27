
import SwiftUI

struct WishAddView: View {
    @StateObject var vm: WishListViewModel
    @FocusState private var wishFocused: Bool
    @State var isEdit = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Text("What's your Wish?")
                    .font(.custom("NewYork-SemiBoldItalic", size: 30))
                Spacer()
                Button(action: {
                    vm.addWish()
                    vm.isAddPresented = false
                }, label: {
                    Image(systemName: "checkmark")
                })
                .font(.system(size: 20))
            }
            .padding(.vertical)
            Rectangle()
                .foregroundStyle(.primary)
                .frame(height: 1)
                .padding(.bottom, 20)
            HStack {
                Text("Title")
                .font(.custom("NewYork-SemiBold", size: 25))
                Spacer()
            }
            
            HStack {
                Text(">>")
                    .padding(6)
                TextField("Title", text: $vm.newWish.title)
                    .font(.custom("NanumSquareNeoTTF-cBd", size: 18))
                    .focused($wishFocused)
                    .onSubmit {
                        vm.addWish()
                        vm.isAddPresented = false
                    }
            }
            .padding(.bottom, 10)
            HStack {
                Text("Description")
                .font(.custom("NewYork-SemiBold", size: 22))
                Spacer()
            }
            HStack {
                VStack {
                    Text(">")
                        .padding(6)
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
    }
}

struct WishAddView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishAddView(vm: vm)
    }
}
