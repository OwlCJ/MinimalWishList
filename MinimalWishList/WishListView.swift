
import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                WishListViewRow()
            }
            .navigationTitle("WishList")
            .font(.system(size: 48, design: .serif))
        }
        
    }
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes =
//           [.font: UIFont(descriptor:
//                   UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
//                   .withDesign(.serif)!, size: 48)]
//    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
