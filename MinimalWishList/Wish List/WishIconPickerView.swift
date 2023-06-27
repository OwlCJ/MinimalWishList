
import SwiftUI

struct WishIconPickerView: View {
    @StateObject var vm: WishListViewModel
    
    let icons: [WishImage] = WishImage.allCases
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 20) {
            ForEach(icons[0..<6], id: \.self) { icon in
                Button {
                    vm.newWish.image = icon
                } label: {
                    Image(systemName: icon.imageName)
                }
                .foregroundColor( vm.newWish.image == icon ? .primary : .secondary)
            }
            ForEach(icons[6...], id: \.self) { icon in
                Button {
                    vm.newWish.image = icon
                } label: {
                    Image(systemName: icon.imageName)
                }
                .foregroundColor( vm.newWish.image == icon ? .primary : .secondary)
            }
        }
        .font(.system(size: 20))
    }
}

struct WishIconPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WishListViewModel(storage: WishListStorage())
        WishIconPickerView(vm: vm)
    }
}
