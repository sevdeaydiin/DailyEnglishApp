import Foundation

struct OnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String?
    let buttonTitle: String
    let options: [String]?
    let inputField: Bool
    let skipButton: Bool
    var selectedOption: String?
    var selectedOptions: Set<String>?
    let type: OnboardingType
    let image: String?
    let showNotificationSettings: Bool
    let allowMultipleSelection: Bool
    
    var hasValidSelection: Bool {
        if let options = options {
            if allowMultipleSelection {
                return selectedOptions?.isEmpty == false
            } else {
                return selectedOption != nil
            }
        }
        return true
    }
}

enum OnboardingType {
    case welcome
    case source
    case age
    case gender
    case name
    case commitment
    case timeSpent
    case level
    case lastText
    case notifications
    case goal
    case interested
}
