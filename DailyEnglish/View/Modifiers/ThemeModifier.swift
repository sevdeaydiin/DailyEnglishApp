import SwiftUI

struct ThemeModifier: ViewModifier {
    @StateObject private var themeManager = ThemeManager.shared
    
    func body(content: Content) -> some View {
        content
            .background(themeManager.currentTheme.backgroundImage)
            .foregroundColor(themeManager.currentTheme.textColor)
    }
}

extension View {
    func withTheme() -> some View {
        modifier(ThemeModifier())
    }
} 
