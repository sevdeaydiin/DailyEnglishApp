import SwiftUI

class ThemeManager: ObservableObject {
    @Published private(set) var currentTheme: Theme
    
    static let shared = ThemeManager()
    
    private init() {
        if let savedThemeName = UserDefaults.standard.string(forKey: "selectedTheme"),
           let themeType = ThemeType(rawValue: savedThemeName) {
            currentTheme = Theme(type: themeType)
        } else {
            currentTheme = Theme.defaultTheme
        }
    }
    
    func setTheme(_ themeName: String) {
        guard let themeType = ThemeType(rawValue: themeName) else { return }
        currentTheme = Theme(type: themeType)
        UserDefaults.standard.set(themeName, forKey: "selectedTheme")
    }
} 