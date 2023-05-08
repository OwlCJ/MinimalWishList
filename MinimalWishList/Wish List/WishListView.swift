
import SwiftUI

struct WishListView: View {
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                WishLists(vm: vm)
                Settings(vm: vm)
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

struct WishLists: View {
    @StateObject var vm: WishListViewModel
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
//        List(vm.list, selection: $multiSelection) { wish in
//            let index = vm.list.firstIndex(where: { $0.id == wish.id })!
//            WishListRow(wish: $vm.list[index])
//        }
        List(selection: $multiSelection) {
            ForEach(vm.list) { wish in
                let index = vm.list.firstIndex(where: { $0.id == wish.id })!
                WishListRow(wish: $vm.list[index])
                    .onLongPressGesture {
                        vm.isEditPresented = true
                    }
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
                    vm.isAddPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        }
        
        .foregroundColor(.primary)
        .listStyle(.inset)
        .sheet(isPresented: $vm.isAddPresented) {
            WishAddView(vm: vm)
                .presentationDetents([.height(350)])
        }
        .sheet(isPresented: $vm.isEditPresented) {
            WishEditView(vm: vm)
                .presentationDetents([.height(350)])
        }
    }
}

struct Settings: View {
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                vm.isSettingPresented = true
            } label: {
                Image(systemName: "gear").font(.system(size: 18))
            }
            .padding()
            .foregroundColor(.primary)
            .sheet(isPresented: $vm.isSettingPresented) {
                SettingsView(vm: vm)
                    .presentationDetents([.height(55)])
            }
        }
    }
}
