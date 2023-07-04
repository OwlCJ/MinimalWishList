
import SwiftUI

struct WishListView: View {
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        List {
            ForEach(vm.list) { wish in
                let index = vm.list.firstIndex(where: { $0.id == wish.id })!
                NavigationLink {
                    WishEditView(wish: $vm.list[index], vm: vm)
                } label: {
                    WishListRow(wish: $vm.list[index], vm: vm)
                }
            }
            .onDelete(perform: vm.deleteWish)
            .onMove(perform: vm.moveWish)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.isAddPresented = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
        .foregroundStyle(.primary)
        .listStyle(.inset)
        .sheet(isPresented: $vm.isAddPresented) {
            WishAddView(vm: vm)
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishListView(vm: vm)
    }
}
