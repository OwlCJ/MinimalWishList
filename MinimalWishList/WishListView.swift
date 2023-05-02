
import SwiftUI

struct WishListView: View {
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(Wish.list) { wish in
                        WishListViewRow(wish: wish)
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
        }
        .onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "NewYork-SemiBoldItalic", size: 50)!]
            
//            vm.fetch()
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView(vm: WishListViewModel(storage: WishListStorage()))
    }
}
