
import SwiftUI

@main
struct MinimalWishListApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = WishListViewModel(storage: WishListStorage())
            WishListView(vm: vm)
        }
    }
}
