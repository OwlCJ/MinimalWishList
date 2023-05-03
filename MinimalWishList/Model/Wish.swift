//
//  Wish.swift
//  MinimalWishList
//
//  Created by 박철진 on 2023/04/26.
//

import Foundation

struct Wish: Identifiable, Codable{
    var id: UUID = UUID()
    var text: String
    var date: Date
    var isDone: Bool
}

extension Wish {
    static let list: [Wish] = [
        Wish(text: "일본 도쿄 여행가기", date: Date(), isDone: false),
        Wish(text: "Travel Tokyo", date: Date(), isDone: true),
        Wish(text: "Study Hard, Work Hard", date: Date(), isDone: true),
        Wish(text: "Conversation with CJ", date: Date(), isDone: false),
        Wish(text: "take on me", date: Date(), isDone: false),
        Wish(text: "한국 종로 여행가기", date: Date(), isDone: false),
        Wish(text: "랍스타 먹기 냠냠", date: Date(), isDone: false),
        Wish(text: "drink water many many", date: Date(), isDone: false),
        Wish(text: "very Great doing nice", date: Date(), isDone: false),
        Wish(text: "Study Hard, Work Hard", date: Date(), isDone: false),
        Wish(text: "This is Simple App", date: Date(), isDone: false),
        Wish(text: "And i will make Sexy App", date: Date(), isDone: false),
        Wish(text: "Study Hard, Work Hard", date: Date(), isDone: false),
    ]
}
