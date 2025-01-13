import SwiftUI

/*
struct OnboardingPageView: View {
    let page: OnboardingPage
    @Binding var userName: String
    @Binding var selectedOption: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(page.title)
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 50)
            
            if let subtitle = page.subtitle {
                Text(subtitle)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            
            if let options = page.options {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                selectedOption = option
                            }) {
                                HStack {
                                    Text(option)
                                        .foregroundColor(.black)
                                    Spacer()
                                    if selectedOption == option {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.bg)
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            if page.inputField {
                TextField("Enter your name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .padding(.top)
            }
            
            Spacer()
        }
        .background(
            Color.bg.opacity(0.8)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    OnboardingPageView(
        page: OnboardingPage(
            title: "Welcome",
            subtitle: "Get started with your vocabulary journey",
            buttonTitle: "Continue",
            options: nil,
            inputField: true,
            skipButton: false,
            type: .welcome
        ),
        userName: .constant(""),
        selectedOption: .constant(nil)
    )
} 
*/
