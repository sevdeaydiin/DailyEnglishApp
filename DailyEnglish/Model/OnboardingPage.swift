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
    let type: OnboardingType
    let image: String?
    let showNotificationSettings: Bool
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
}
