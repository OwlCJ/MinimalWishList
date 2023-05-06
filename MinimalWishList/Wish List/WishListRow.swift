//
//  WishListViewRow.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import SwiftUI

struct WishListRow: View {
    @Binding var wish: Wish
    
    var body: some View {
        HStack(spacing: 5) {
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
            Spacer()
            Text("D\(remainDays(endDate: wish.endDate))")
                .font(.system(.caption))
            Toggle(isOn: $wish.isDone) {}
            .toggleStyle(WishCheckBox())
        }
        .font(.custom("NanumSquareNeoTTF-cBd", size: 17))
        .frame(height: 45)
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
        WishListRow(wish: .constant(Wish.list[0]))
    }
}
