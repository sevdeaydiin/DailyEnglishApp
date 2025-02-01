import SwiftUI

struct ThemesView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var themeManager = ThemeManager.shared
    @State private var selectedTheme: String?
    
    let themes: [(name: String, image: String, isLocked: Bool)] = [
        ("Classic Dark", "classic_dark", false),
        ("Coral", "coral", false),
        ("Create your own", "", false),
        ("Minimal Light", "minimal_light", true),
        ("Forest", "forest", true),
        ("Cappadocia", "cappadocia", true),
        ("Modern", "modern", true)
    ]
    
    let freeThemes: [(name: String, image: String)] = [
        ("Minimal Light", "minimal_light"),
        ("Forest", "forest"),
        ("Cappadocia", "cappadocia"),
        ("Modern", "modern")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Current Themes Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Themes")
                        .font(.largeTitle)
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(themes, id: \.name) { theme in
                                if theme.name == "Create your own" {
                                    CreateThemeButton()
                                } else {
                                    ThemeCard(
                                        image: theme.image,
                                        isSelected: selectedTheme == theme.name,
                                        isLocked: theme.isLocked,
                                        onSelect: {
                                            if !theme.isLocked {
                                                selectTheme(theme.name)
                                            }
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Most Popular Section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Most popular")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button("View all") {
                            // View all action
                        }
                        .foregroundColor(.blue)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(themes.filter { $0.isLocked }, id: \.name) { theme in
                                ThemeCard(
                                    image: theme.image,
                                    isSelected: false,
                                    isLocked: true,
                                    onSelect: {}
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Free Today Section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Free today")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button("View all") {
                            // View all action
                        }
                        .foregroundColor(.blue)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(freeThemes, id: \.name) { theme in
                                ThemeCard(
                                    image: theme.image,
                                    isSelected: selectedTheme == theme.name,
                                    isLocked: false,
                                    onSelect: {
                                        selectTheme(theme.name)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
        }
        .navigationBarItems(trailing: Button("Unlock all") {
            // Unlock all action
        })
        .onAppear {
            if let currentTheme = UserDefaults.standard.string(forKey: "selectedTheme") {
                selectedTheme = currentTheme
            }
        }
    }
    
    private func selectTheme(_ themeName: String) {
        selectedTheme = themeName
        themeManager.setTheme(themeName)
        UserDefaults.standard.set(themeName, forKey: "selectedTheme")
    }
}

struct ThemeCard: View {
    let image: String
    let isSelected: Bool
    let isLocked: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            ZStack(alignment: .topTrailing) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                    )
                
                if isLocked {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.white)
                        .padding(8)
                } else if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .padding(8)
                }
                
                if !isLocked && !isSelected {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                        .padding(8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            }
        }
    }
}

struct CreateThemeButton: View {
    var body: some View {
        Button(action: {
            // Create theme action
        }) {
            VStack {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                Text("Create\nyour own")
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.primary)
            .frame(width: 120, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundColor(.gray)
            )
        }
    }
} 
