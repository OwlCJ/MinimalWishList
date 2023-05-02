
import Foundation

final class WishListStorage {
    func persist(_ items: [Wish]) {
        Storage.store(items, to: .documents, as: "wishlist.json")
    }
    
    func fetch() -> [Wish] {
        let list = Storage.retrive("wishlist.json", from: .documents, as: [Wish].self) ?? []
        return list
    }
}
