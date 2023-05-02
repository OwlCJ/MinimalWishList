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
}

extension Wish {
    static let list: [Wish] = [
        Wish(text: "일본 도쿄 여행가기", date: Date()),
        Wish(text: "Travel Tokyo", date: Date()),
        Wish(text: "Study Hard, Work Hard", date: Date()),
        Wish(text: "Conversation with CJ", date: Date()),
        Wish(text: "take on me", date: Date()),
        Wish(text: "한국 종로 여행가기", date: Date()),
        Wish(text: "랍스타 먹기 냠냠", date: Date()),
        Wish(text: "drink water many many", date: Date()),
        Wish(text: "very Great doing nice", date: Date()),
        Wish(text: "Study Hard, Work Hard", date: Date()),
        Wish(text: "This is Simple App", date: Date()),
        Wish(text: "And i will make Sexy App", date: Date()),
        Wish(text: "Study Hard, Work Hard", date: Date()),
    ]
}
