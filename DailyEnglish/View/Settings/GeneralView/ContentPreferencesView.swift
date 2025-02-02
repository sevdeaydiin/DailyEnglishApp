//
//  ContentPreferencesView.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 2/2/25.
//

import SwiftUI

struct ContentPreferencesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Content Preferences")
                .font(.title)
                .bold()
            Text("Select your vocabulary level")
                .font(.subheadline)
                .padding(.bottom, 36)
            PreferencesButton(text: "Beginner")
            PreferencesButton(text: "Intermediate")
            PreferencesButton(text: "Advanced")
            Spacer()
        }
        .padding()
        .padding(.horizontal)
    }
}

private struct PreferencesButton: View {
    var text: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(text)
                .font(.title3)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(style: StrokeStyle(lineWidth: 2))
                )
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.colorGreen)

    }
}

#Preview {
    ContentPreferencesView()
}
