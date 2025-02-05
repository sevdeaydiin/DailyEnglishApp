import SwiftUI

struct WordCardView: View {
    let word: String
    let phonetic: String
    let definition: String
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        VStack(spacing: 16) {
            Text(word)
                .font(.largeTitle)
                .bold()
                .foregroundColor(themeManager.currentTheme.textColor)
            
            Text(phonetic)
                .font(.title3)
                .foregroundColor(themeManager.currentTheme.textColor.opacity(0.6))
            
            Text(definition)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(themeManager.currentTheme.textColor)
                .padding(.horizontal, 24)
        }
    }
} 
