
import SwiftUI
import StoreKit


struct SettingsView: View {
    @StateObject var vm: WishListViewModel
    @Environment(\.requestReview) private var requestReview
    
    @State var resetCheck: Bool = false
    @State var appInfo: Bool = false
    @State var authBtn: Bool = false
    
    var body: some View {
        VStack() {
            HStack {
                Text("Settings")
                    .font(.custom("NewYork-SemiBoldItalic", size: 45))
                Spacer()
            }.padding(.bottom, 50)
            Spacer()
            VStack(spacing: 40) {
                Button {
                    appInfo = true
                } label: {
                    Text("About App")
                }.alert(vm.appInfoText, isPresented: $appInfo) {}
                Button {
                    requestReview()
                } label: {
                    Text("Review App")
                }
                Button {
                    authBtn = true
                } label: {
                    Text("Lock / Unlock")
                }.alert("Authentication", isPresented: $authBtn) {
                    Button("Lock", role: .cancel) {
                        if !vm.usingAuth {
                            vm.authenticationToggle()
                            vm.isUnlocked = true
                            print(vm.usingAuth)
                        }
                    }
                    Button("UnLock", role: .destructive) {
                        if vm.usingAuth {
                            vm.authenticationToggle()
                            print(vm.usingAuth)
                        }
                        
                    }
                }

                Button(role: .destructive) {
                    resetCheck = true
                } label: {
                    Text("Reset All Wishes")
                }.foregroundColor(.red)
                .alert("Reset All Wishes?", isPresented: $resetCheck) {
                    Button(role: .destructive) {
                        vm.resetWish()
                        vm.isSettingPresented = false
                    } label: {
                        Text("Reset")
                    }
                }
                
            }
            .font(.custom("NewYork-SemiBold", size: 18))
            .foregroundColor(.primary)
            Spacer()
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 30)
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        SettingsView(vm: vm)
    }
}
