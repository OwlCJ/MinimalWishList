
import Foundation
import Combine
import LocalAuthentication

final class WishListViewModel: ObservableObject {
    let storage: WishListStorage
    
    @Published var list: [Wish] = []
    @Published var newWish: Wish = Wish(image: .etc, title: "", description: "", startDate: Date(), endDate: Date(), isDone: false)

    @Published var isAddPresented: Bool = false
    @Published var isEditPresented: Bool = false
    @Published var isSettingPresented: Bool = false
    @Published var usingAuth: Bool = UserDefaults.standard.bool(forKey: "useAuthentication")
    
    @Published var isUnlocked: Bool = false
    
    var subscriptions = Set<AnyCancellable>()
    
    
    let appInfoText: String = """
    Minimal Wish List v1.0
    
    © 2023 CJPark
    """
    
    init(storage: WishListStorage) {
        self.storage = storage
        bind()
    }
    
    //For Editing
    func addWish() {
        guard !newWish.title.isEmpty else { return }
        self.list.append(newWish)
    }
    
    func editWish(wish: Wish) {
        guard let index = self.list.firstIndex(where: { $0.id == wish.id }) else { return }
        self.list[index].image = wish.image
        self.list[index].title = wish.title
        self.list[index].endDate = wish.endDate
        self.storage.persist(list)
    }
    
    func deleteWish(at offsets: IndexSet) {
        self.list.remove(atOffsets: offsets)
    }
    
    func moveWish(from source: IndexSet, to destination: Int) {
        self.list.move(fromOffsets: source, toOffset: destination)
    }
    
    func resetNewWish() {
        self.newWish = Wish(image: .etc, title: "", description: "", startDate: Date(), endDate: Date(), isDone: false)
    }
    
    func resetWish() {
        self.list.removeAll()
        self.storage.persist(list)
    }
    
    private func bind() {
        $list.sink { items in
            self.persist(items: items)
        }.store(in: &subscriptions)
        $usingAuth.sink { bool in
            self.setAuthentication(bool)
        }.store(in: &subscriptions)
    }
    
    //Data Store & Load
    func persist(items: [Wish]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
    
    
    //Authentication
    func isUnlockToggle() {
        self.isUnlocked.toggle()
    }
    
    func authenticationToggle() {
        self.usingAuth.toggle()
    }
    
    func setAuthentication(_ auth: Bool) {
        if auth == false {
            UserDefaults.standard.set(false, forKey: "useAuthentication")
        } else if auth == true {
            UserDefaults.standard.set(true, forKey: "useAuthentication")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "We need your bioInformation to protect your wishes."
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        if !self.isUnlocked { self.isUnlockToggle() }
                    } else {
                        // 인증 실패
                        print("Face ID 인증 실패")
                    }
                }
            }
        }
    }
}
