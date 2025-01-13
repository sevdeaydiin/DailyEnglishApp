import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            OnboardingPageView(page: viewModel.currentPage,
                             userName: $viewModel.userName,
                             selectedOption: binding(for: viewModel.currentPage.type))
            
            Button(action: {
                viewModel.nextPage()
            }) {
                Text(viewModel.currentPage.buttonTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            
            if viewModel.currentPage.skipButton {
                Button("Skip") {
                    viewModel.nextPage()
                }
                .foregroundColor(.white)
                .padding(.bottom)
            }
        }
        .background(
            Color.black.opacity(0.8)
                .ignoresSafeArea()
        )
    }
    
    private func binding(for type: OnboardingType) -> Binding<String?> {
        switch type {
        case .age:
            return $viewModel.selectedAge
        case .gender:
            return $viewModel.selectedGender
        case .commitment:
            return $viewModel.selectedCommitment
        case .timeSpent:
            return $viewModel.selectedTimeSpent
        default:
            return .constant(nil)
        }
    }
} 
