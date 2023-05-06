
import SwiftUI

struct WishListView: View {
    @Environment(\.editMode) var editMode
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.list) { wish in
                    let index = vm.list.firstIndex(where: {$0.id == wish.id })!
                    WishListRow(wish: $vm.list[index])
                }
                .onDelete(perform: vm.deleteWish)
                .onMove(perform: vm.moveWish)
            }
            .navigationTitle("WishList")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
            .foregroundColor(.primary)
            .listStyle(.inset)
            .sheet(isPresented: $vm.isPresented) {
                WishAddView(vm: vm)
                    .presentationDetents([.height(350)])
            }
        }
        .onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "NewYork-SemiBoldItalic", size: 50)!]
            
            vm.fetch()
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView(vm: WishListViewModel(storage: WishListStorage()))
    }
}
