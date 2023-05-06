//
//  Wish.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import Foundation

struct Wish: Identifiable, Codable{
    var id: UUID = UUID()
    var image: WishImage
    var text: String
    var startDate: Date
    var endDate: Date
    var isDone: Bool
}

extension Wish {
    static let list: [Wish] = [
        Wish(image: .travel, text: "일본 도쿄 여행가기", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .travel, text: "Travel Tokyo", startDate: Date(), endDate: Date(), isDone: true),
        Wish(image: .study, text: "Study Hard, Work Hard", startDate: Date(), endDate: Date(), isDone: true),
        Wish(image: .etc, text: "Conversation with CJ", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .exercise, text: "take on me", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .travel, text: "한국 종로 여행가기", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .taste, text: "랍스타 먹기 냠냠", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .taste, text: "drink water many many", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .cook, text: "very Great doing nice", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .goal, text: "Study Hard, Work Hard", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .shopping, text: "This is Simple App", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .finance, text: "And i will make Sexy App", startDate: Date(), endDate: Date(), isDone: false),
        Wish(image: .sport, text: "Study Hard, Work Hard", startDate: Date(), endDate: Date(), isDone: false),
    ]
}
