
import Foundation

enum WishImage: String, Codable, CaseIterable{
    case travel
    case study
    case sport
    case taste
    case cook
    case health
    case exercise
    case finance
    case shopping
    case goal
    case etc
    
    var imageName: String {
        switch self {
        case .travel: return "airplane.departure"
        case .study: return "book"
        case .sport: return "football"
        case .taste: return "fork.knife"
        case .cook: return "frying.pan"
        case .exercise: return "dumbbell"
        case .health: return "leaf"
        case .finance: return "dollarsign"
        case .shopping: return "cart"
        case .goal: return "flag.checkered"
        case .etc: return "ellipsis"
        }
    }
}
