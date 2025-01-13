import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background.ignoresSafeArea()
            
            if viewModel.currentPage.skipButton {
                HStack {
                    Spacer()
                    Button("Skip") {
                        viewModel.nextPage()
                    }
                    .foregroundColor(.text.opacity(0.8))
                }
                .padding(.top, 16)
                .padding(.trailing, 24)
            }
            
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    Text(viewModel.currentPage.title)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.text)
                        .padding(.top, 80)
                    
                    if let subtitle = viewModel.currentPage.subtitle {
                        Text(subtitle)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.text)
                    }
                }
                .padding(.horizontal, 24)
                
                if let options = viewModel.currentPage.options {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 12) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    viewModel.selectedOption = option
                                }) {
                                    HStack {
                                        Text(option)
                                            .font(.system(size: 17))
                                            .foregroundColor(.text)
                                        Spacer()
                                        if viewModel.selectedOption == option {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.text)
                                        } else {
                                            Circle()
                                                .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.gray.opacity(0.1))
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 32)
                    }
                }
                
                if viewModel.currentPage.inputField {
                    ZStack(alignment: .leading) {
                        if viewModel.userName.isEmpty {
                            Text("Enter your name")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 8)
                        }
                        TextField("", text: $viewModel.userName)
                            .foregroundColor(.text)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.background))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.text.opacity(0.7), lineWidth: 2)
                    )
                    .padding(.horizontal, 24)
                    .padding(.top)
                }
                
                Spacer()
                
                if viewModel.shouldShowContinueButton {
                    Button(action: {
                        viewModel.nextPage()
                    }) {
                        Text(viewModel.currentPage.buttonTitle)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.button)
                            .cornerRadius(28)
                            .padding(.horizontal, 24)
                    }
                    .transition(.opacity)
                    .padding(.bottom, 34)
                }
            }
        }
        .animation(.easeInOut, value: viewModel.selectedOption)
    }
} 
