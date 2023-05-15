
import SwiftUI
import LocalAuthentication

struct LaunchScreenView: View {
    @StateObject var vm: WishListViewModel
    @State private var isDone = false
    @State private var opacity = 0.5
    @State private var usingAuth = UserDefaults.standard.bool(forKey: "useAuthentication")
    
    var body: some View {
        if isDone && !usingAuth {
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
                    if usingAuth { authenticate() }
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "We need your bioInformation to protect your wishes."
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if success {
                    usingAuth.toggle()
                } else {
                    // 인증 실패
                    print("Face ID 인증 실패")
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

