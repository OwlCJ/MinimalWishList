
import SwiftUI

struct LaunchScreenView: View {
    @StateObject var vm: WishListViewModel
    @State private var isDone = false
    @State private var opacity = 0.5
    
    var body: some View {
        if isDone {
            WishListView(vm: vm)
        } else {
            Section {
                VStack {
                    Text("Minimal")
                        .font(.custom("NewYork-SemiBoldItalic", size: 43))
                    Text("Wish List")
                        .font(.custom("NewYork-SemiBoldItalic", size: 38))
                }
                .foregroundColor(.primary)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.2)) {
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    self.isDone = true
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WishListViewModel(storage: WishListStorage())
        LaunchScreenView(vm: vm)
    }
}
