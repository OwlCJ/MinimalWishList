
import SwiftUI

struct WishDatePickerView: View {
    @StateObject var vm: WishListViewModel
    @State var isOn: Bool = false
    
    var body: some View {
        HStack {
            Button {
                isOn.toggle()
                print(isOn)
            } label: {
                Image(systemName: "calendar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
            }
            .padding(.trailing, 10)
            DatePicker(
                "End Date",
                selection: $vm.newWishEndDate,
                displayedComponents: [.date]
            )
        }
        .padding(10)
        .foregroundColor(.primary)
    }
}

struct WishDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WishListViewModel(storage: WishListStorage())
        WishDatePickerView(vm: vm)
    }
}
