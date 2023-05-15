
import SwiftUI
import StoreKit
import LocalAuthentication

struct SettingsView: View {
    @StateObject var vm: WishListViewModel
    
    @Environment(\.requestReview) private var requestReview
    @State private var resetCheck: Bool = false
    @State private var appInfo: Bool = false
    @State private var usingAuth: Bool = UserDefaults.standard.bool(forKey: "useAuthentication")
    
    let appInfoText: String = """
    Minimal Wish List v1.0
    
    © 2023 CJPark
    """
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 25) {
                HStack(spacing: 20) {
                    Button {
                        appInfo = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .alert(appInfoText, isPresented: $appInfo) {}
                    Button {
                        requestReview()
                    } label: {
                        Image(systemName: "star")
                    }
                    Button {
                        useAuthentication()
                    } label: {
                        usingAuth ? Image(systemName: "lock") : Image(systemName: "lock.open")
                    }
                }
                .foregroundColor(.primary)
                Spacer()
                Button(role: .destructive) {
                    resetCheck = true
                } label: {
                    Image(systemName: "trash")
                }
                .alert("Reset All Wishes?", isPresented: $resetCheck) {
                    Button(role: .destructive) {
                        vm.resetWish()
                    } label: {
                        Text("Reset")
                    }
                }
            }
            .font(.system(size: 18))
        }
        .onAppear {
            print(usingAuth)
            print(UserDefaults.standard.bool(forKey: "useAuthentication"))
        }
        .padding()
    }
    
    func useAuthentication() {
        if usingAuth == false {
            UserDefaults.standard.set(true, forKey: "useAuthentication")
            usingAuth = true
        } else if usingAuth == true {
            UserDefaults.standard.set(false, forKey: "useAuthentication")
            usingAuth = false
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        SettingsView(vm: vm)
    }
}
