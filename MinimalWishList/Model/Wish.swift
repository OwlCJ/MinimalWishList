

import Foundation

struct Wish: Identifiable, Codable{
    var id: UUID = UUID()
    var image: WishImage
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date
    var isDone: Bool
}

extension Wish {
    static let list: [Wish] = [
        Wish(image: .travel, title: "일본 도쿄 여행가기", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .travel, title: "Travel Tokyo", description: "", startDate: Date(), endDate: Date(), isDone: true),
        Wish(image: .study, title: "Study Hard, Work Hard", description: "", startDate: Date(), endDate: Date(), isDone: true),
        Wish(image: .etc, title: "Conversation with CJ", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .exercise, title: "take on me", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .travel, title: "한국 종로 여행가기", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .taste, title: "랍스타 먹기 냠냠", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .taste, title: "drink water many many", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .cook, title: "very Great doing nice", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .goal, title: "Study Hard, Work Hard", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .shopping, title: "This is Simple App", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .finance, title: "And i will make Sexy App", description: "", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .sport, title: "Study Hard, Work Hard", description: "", startDate: Date(), endDate: Date(), isDone: false),
    ]
}
