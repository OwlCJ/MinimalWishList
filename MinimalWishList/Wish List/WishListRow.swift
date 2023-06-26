
import SwiftUI

struct WishListRow: View {
    @Binding var wish: Wish
    @StateObject var vm: WishListViewModel
    
    var body: some View {
        HStack(spacing: 5) {
            HStack {
                Image(systemName: wish.image.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                .padding(.trailing, 10)
                VStack {
                    Text(wish.text).strikethrough(wish.isDone)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(dateFormatter.string(from: wish.endDate))
                        .font(.system(.caption))
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .onTapGesture {
                vm.isEditPresented = true
            }
            Text("D\(remainDays(endDate: wish.endDate))")
                .font(.system(.caption))
            Toggle(isOn: $wish.isDone) {}
            .toggleStyle(WishCheckBox())
        }
        .font(.custom("NanumSquareNeoTTF-cBd", size: 16))
        .frame(height: 50)
        .sheet(isPresented: $vm.isEditPresented) {
            WishEditView(wish: $wish, vm: vm)
                .presentationDetents([.height(350)])
        }
    }
    
    func remainDays(endDate: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: calendar.startOfDay(for: .now), to: endDate)
        
        guard let day = components.day else { return "-" }
        let result = day > 0 ? "-\(String(day))" : "+\(String(-day))"
        return result
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        return formatter
    }()
}

struct WishCheckBox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark" : "circle" )
                    .foregroundColor(.primary)
            }
        }
    }
}

struct WishListRow_Previews: PreviewProvider {
    static var previews: some View {
        let vm =  WishListViewModel(storage: WishListStorage())
        WishListRow(wish: .constant(Wish.list[0]), vm: vm)
    }
}
