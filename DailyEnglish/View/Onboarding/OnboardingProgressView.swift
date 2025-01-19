import SwiftUI

struct OnboardingProgressView: View {
    let currentStep: Int
    let totalSteps: Int
    
    private var progress: CGFloat {
        guard totalSteps > 0 else { return 0 }
        return CGFloat(currentStep) / CGFloat(totalSteps)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background track
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 4)
                    
                    // Progress bar
                    Rectangle()
                        .fill(Color.colorGreen)
                        .frame(width: geometry.size.width * progress, height: 4)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: progress)
                }
            }
            .frame(height: 4)
            
            // Progress percentage
            HStack {
                Spacer()
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.text.opacity(0.8))
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
    }
}

// Preview için
struct OnboardingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            OnboardingProgressView(currentStep: 2, totalSteps: 5)
        }
    }
}
