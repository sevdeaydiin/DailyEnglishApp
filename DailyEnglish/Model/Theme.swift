import SwiftUI

enum ThemeType: String {
    case classicDark = "Classic Dark"
    case coral = "Coral"
    case minimalLight = "Minimal Light"
    case forest = "Forest"
    case cappadocia = "Cappadocia"
    case modern = "Modern"
    
    var backgroundImage: String {
        switch self {
        case .classicDark:
            return "classic_dark"
        case .coral:
            return "coral"
        case .minimalLight:
            return "theme_minimal_light_bg"
        case .forest:
            return "forest"
        case .cappadocia:
            return "cappadocia"
        case .modern:
            return "modern"
        }
    }
    
    var foregroundColorName: String {
        switch self {
        case .classicDark, .coral:
            return "theme_classic_dark_fg"
        case .minimalLight:
            return "theme_minimal_light_fg"
        case .forest, .cappadocia, .modern:
            return "theme_classic_dark_fg"
        }
    }
}

struct Theme {
    let type: ThemeType
    
    var backgroundImage: Image {
        Image(type.backgroundImage)
    }
    
    var textColor: Color {
        Color(type.foregroundColorName)
    }
    
    static let defaultTheme = Theme(type: .classicDark)
}
