import SwiftUI

struct ActionBarView: View {
    let onShare: () -> Void
    let onVoice: () -> Void
    let onLike: () -> Void
    let onSave: () -> Void
    let isLiked: Bool
    let isSaved: Bool
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        HStack(spacing: 40) {
            Button(action: onShare) {
                Image(systemName: "square.and.arrow.up")
                    .font(.title2)
                    .foregroundColor(themeManager.currentTheme.textColor)
            }
            
            Button(action: onVoice) {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(themeManager.currentTheme.textColor)
            }
            
            Button(action: onLike) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.title2)
                    .foregroundColor(isLiked ? .red : themeManager.currentTheme.textColor)
            }
            
            Button(action: onSave) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .font(.title2)
                    .foregroundColor(isSaved ? .yellow : themeManager.currentTheme.textColor)
            }
        }
    }
} 
