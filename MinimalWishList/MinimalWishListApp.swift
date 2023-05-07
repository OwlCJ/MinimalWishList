
import SwiftUI

@main
struct MinimalWishListApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = WishListViewModel(storage: WishListStorage())
            LaunchScreenView(vm: vm)
        }
    }
}
