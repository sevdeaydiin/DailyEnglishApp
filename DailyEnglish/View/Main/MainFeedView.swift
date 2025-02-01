import SwiftUI

struct MainFeedView: View {
    @StateObject private var viewModel = MainFeedViewModel()
    @State private var showingSettings = false
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                //themeManager.currentTheme.backgroundColor.ignoresSafeArea()
                ZStack {
                    themeManager.currentTheme.backgroundImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.5))
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .ignoresSafeArea()
                
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
                
                Button(action: {
                    showingSettings = true
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(themeManager.currentTheme.textColor)
                }
                .padding(.top, 64)
                .padding(.trailing, 24)
            }
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
        .ignoresSafeArea()
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
    @StateObject private var themeManager = ThemeManager.shared
    
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

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    clearAllData()
                    dismiss()
                }) {
                    Text("Clear All Data")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func clearAllData() {
        UserDefaults.standard.removeObject(forKey: "isOnboardingCompleted")
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "userLevel")
        UserDefaults.standard.removeObject(forKey: "selectedTheme")
        
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: OnboardingView())
            }
        }
    }
}
