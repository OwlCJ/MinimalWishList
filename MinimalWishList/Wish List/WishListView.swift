
import SwiftUI

struct WishListView: View {
    @StateObject var vm: WishListViewModel
    @State var addViewDetents:PresentationDetent = .medium
    
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
        
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            DispatchQueue.main.async {
                if vm.usingAuth && vm.isUnlocked {
                    vm.isUnlocked = false
                }
            }
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
        .foregroundStyle(.primary)
        .listStyle(.inset)
        .sheet(isPresented: $vm.isAddPresented) {
            WishAddView(vm: vm)
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
            }
        }
    }
}
