import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Sign in")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            Text("Sign in to Vocabulary and secure your data")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Text("Keep your content and settings even if you switch to a new device, uninstall the app, or clear the app data")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {

            }) {
                HStack(spacing: 12) {
                    Image(systemName: "applelogo")
                        .font(.title)
                    Text("Sign in with Apple")
                        .fontWeight(.semibold)
                        .font(.title3)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                
            }) {
                HStack(spacing: 12) {
                    Image("google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Sign in with Google")
                        .fontWeight(.semibold)
                        .font(.title3)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Text("By signing in, you agree to our Terms & Conditions and Privacy Policy")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
        }
        .padding()
        .background(Color(UIColor.systemBackground).ignoresSafeArea())
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
} 
