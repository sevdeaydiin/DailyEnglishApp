import SwiftUI

struct WordCardView: View {
    @Environment(\.colorScheme) private var colorScheme
    let word: String
    let phonetic: String
    let definition: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text(word)
                .font(.system(size: 32, weight: .bold, design: .default))
                .foregroundColor(.primary)
            
            Text(phonetic)
                .font(.system(size: 18, weight: .regular, design: .default))
                .foregroundColor(.secondary)
            
            Text(definition)
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
    }
} 