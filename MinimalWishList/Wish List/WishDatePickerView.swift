
import SwiftUI

struct WishDatePickerView: View {
    @StateObject var vm: WishListViewModel

    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
                .padding(.trailing, 10)
            Spacer()
            DatePicker(
                "End Date",
                selection: $vm.newWish.endDate,
                displayedComponents: [.date]
            )
        }
        .padding(5)
        .foregroundStyle(.primary)
    }
}

struct WishDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WishListViewModel(storage: WishListStorage())
        WishDatePickerView(vm: vm)
    }
}
