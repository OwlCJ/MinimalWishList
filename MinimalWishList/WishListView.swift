
import SwiftUI

struct WishListView: View {
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(0..<15) { _ in
                            WishListViewRow()
                    }
                }
                HStack {
                    Button {
                        print("----> Add Button Clicked")
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 25)
                    }
                }
            }
            .navigationTitle("WishList")
            .padding(.top, 20)
        }
        .onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes =
                       [.font: UIFont(descriptor:
                               UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
                        .withDesign(.serif)!
                        .withSymbolicTraits(.traitBold)!,
                        size: 38)
                       ]
            vm.fetch()
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView(vm: WishListViewModel(storage: WishListStorage()))
    }
}
