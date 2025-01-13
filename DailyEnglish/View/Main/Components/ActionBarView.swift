import SwiftUI

struct ActionBarView: View {
    let onShare: () -> Void
    let onVoice: () -> Void
    let onLike: () -> Void
    let onSave: () -> Void
    let isLiked: Bool
    let isSaved: Bool
    
    var body: some View {
        HStack(spacing: 32) {
            Button(action: onShare) {
                Image(systemName: "square.and.arrow.up")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            }
            
            Button(action: onVoice) {
                Image(systemName: "speaker.wave.2")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            }
            
            Button(action: onLike) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .imageScale(.large)
                    .foregroundColor(isLiked ? .red : .primary)
            }
            
            Button(action: onSave) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .imageScale(.large)
                    .foregroundColor(isSaved ? .blue : .primary)
            }
        }
        .padding()
    }
} 