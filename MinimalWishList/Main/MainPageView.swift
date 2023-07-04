
import SwiftUI

struct MainPageView: View {
    @StateObject var vm: WishListViewModel
    @State private var selection = 2
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
//                Text("Done List")
//                    .navigationTitle("DoneList")
//                    .tag(1)
                WishListView(vm: vm)
                    .navigationTitle("Wish List")
                    .tag(2)
                SettingsView(vm: vm)
                    .navigationTitle("Settings")
                    .tag(3)
            }
            .tabViewStyle(.page)
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "NewYork-SemiBoldItalic", size: 40)!]
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
}



struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WishListViewModel(storage: WishListStorage())
        MainPageView(vm: vm)
    }
}
