
import SwiftUI

struct WishAddView: View {
    @StateObject var vm: WishListViewModel
    @FocusState private var wishFocused: Bool
    @State var isEdit = false
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                ZStack {
                    Spacer()
                    Text("What's your Wish?")
                        .font(.custom("NewYork-SemiBoldItalic", size: 30))
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            vm.addWish()
                            vm.isAddPresented = false
                        }, label: {
                            Image(systemName: "square.and.pencil")
                        })
                        .font(.system(size: 20))
                        .foregroundStyle(.primary)
                        .padding(.trailing, 5)
                    }
                }
            }
            .padding(.vertical)
            Rectangle()
                .foregroundStyle(.primary)
                .frame(height: 1)
                .padding(.bottom, 15)
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
                        vm.addWish()
                        vm.isAddPresented = false
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
