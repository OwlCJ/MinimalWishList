
import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        Text("Wish List")
            .font(.custom("NewYork-SemiBoldItalic", size: 40))
            .foregroundColor(.primary)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
