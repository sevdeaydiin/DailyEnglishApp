//
//  GeneralView.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 2/1/25.
//

import SwiftUI

struct GeneralView: View {

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            List {
                Section("PREMIUM") {
                    NavigationLink(destination: ContentPreferencesView()) {
                        Label("Manage subscription", systemImage: "sparkles")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section("MAKE IT YOURS") {
                    NavigationLink(destination: Text("Manage subscription")) {
                        Label("Content Preferences", systemImage: "text.page.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    NavigationLink(destination: Text("Manage subscription")) {
                        Label("Muted content", systemImage: "speaker.slash.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    NavigationLink(destination: Text("Manage subscription")) {
                        Label("Language", systemImage: "globe.europe.africa.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    NavigationLink(destination: Text("Manage subscription")) {
                        Label("Sounds", systemImage: "speaker.wave.2.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    NavigationLink(destination: Text("Manage subscription")) {
                        Label("Streak", systemImage: "flame.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section("Account") {
                    NavigationLink(destination: Text("Manage subscription")) {
                        Label("Sign In", systemImage: "person.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section("SUPPORT US") {
                        Label("Share Vocabulary", systemImage: "square.and.arrow.up.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)

                        Label("Leave us a review", systemImage: "captions.bubble.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
        
                        Label("Vote on next features", systemImage: "star.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section("HELP") {
                        Label("Help", systemImage: "questionmark.circle.fill")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
                
                Section("OTHER") {
                    Text("Privacy Policy")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    Text("Terms and Conditions")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                .listRowBackground(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color.white)
            }
        }
    }
}

#Preview {
    GeneralView()
}
