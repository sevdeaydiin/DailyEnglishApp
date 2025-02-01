import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        NavigationView {
            List {
                Section("SETTINGS") {
                    NavigationLink(destination: Text("General Settings")) {
                        Label("General", systemImage: "gearshape.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("App Icon Settings")) {
                        Label("App icon", systemImage: "app.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: ThemesView()) {
                        Label("Themes", systemImage: "paintpalette.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("Reminder Settings")) {
                        Label("Reminders", systemImage: "bell.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("Widget Settings")) {
                        Label("Home Screen widgets", systemImage: "rectangle.3.group.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("Watch Settings")) {
                        Label("Watch", systemImage: "applewatch")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("Bundle Settings")) {
                        Label("Self-Growth bundle", systemImage: "square.grid.2x2.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section("YOUR WORDS") {
                    NavigationLink(destination: Text("Collections")) {
                        Label("Collections", systemImage: "bookmark.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("Your Own Words")) {
                        Label("Your own words", systemImage: "doc.text.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("Search")) {
                        Label("Search", systemImage: "magnifyingglass")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Text("History")) {
                        Label("History", systemImage: "clock.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    NavigationLink(destination: Text("Favorites")) {
                        Label("Favorites", systemImage: "heart.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section {
                    Button(action: {
                        clearAllData()
                        dismiss()
                    }) {
                        HStack (spacing: 12) {
                            Image(systemName: "trash")
                            Text("Clear All Data")
                        }
                        .foregroundColor(.red)
                    }
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
            }
            .navigationTitle("Vocabulary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .scrollContentBackground(.hidden)
            .background(colorScheme == .dark ? Color(UIColor.systemBackground) : Color(UIColor.systemGroupedBackground))
            .listStyle(InsetGroupedListStyle())
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

