import SwiftUI

struct MainFeedView: View {
    @StateObject private var viewModel = MainFeedViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.words) { word in
                        WordCardWithActions(
                            word: word,
                            isLiked: word.isLiked,
                            isSaved: word.isSaved,
                            onShare: viewModel.share,
                            onVoice: viewModel.playPronunciation,
                            onLike: viewModel.toggleLike,
                            onSave: viewModel.toggleSave
                        )
                        .frame(height: geometry.size.height)
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

struct WordCardWithActions: View {
    let word: Word
    let isLiked: Bool
    let isSaved: Bool
    let onShare: () -> Void
    let onVoice: () -> Void
    let onLike: () -> Void
    let onSave: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            WordCardView(
                word: word.word,
                phonetic: word.phonetic,
                definition: word.definition
            )
            .transition(.scale.combined(with: .opacity))
            
            Spacer()
            
            ActionBarView(
                onShare: onShare,
                onVoice: onVoice,
                onLike: onLike,
                onSave: onSave,
                isLiked: isLiked,
                isSaved: isSaved
            )
            .padding(.bottom, 100)
        }
    }
} 
