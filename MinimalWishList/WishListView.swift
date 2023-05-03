
import SwiftUI

struct WishListView: View {
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.list) { wish in
                    WishListRow(wish: $vm.list[vm.list.firstIndex(where: { $0.id == wish.id })!])
                }
                .onDelete(perform: vm.deleteWish)
            }
            .navigationTitle("WishList")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.addWish(text: "New Wish")
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(.primary)
                }
            }
            .listStyle(.inset)
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
