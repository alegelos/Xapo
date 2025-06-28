import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Go to Xapo") {
                    //TODO: go to xapo page
                }
                .foregroundColor(.white)
                .fontWeight(.semibold)
            }
            Spacer()
            Image(.xapoLogo)
                .padding()
            Text("Welcome to iOS Test")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
            
            Text("iOS Test for Xapo bank")
                .foregroundColor(.white)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
            
            Spacer()
            
            NavigationLink(value: "Enter App") {
                Text("Enter the app")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 100)
                    .padding(.vertical)
                    .background(Color(.orange3))
                    .cornerRadius(30)
                    .padding()
            }
            
            HStack {
                Button(action: {
                    //TODO: open policy
                }) {
                    Text("Privacy policy")
                        .underline()
                }
                Text("and")
                Button(action: {
                    //TODO: open terms of use
                }) {
                    Text("Terms of use")
                        .underline()
                }
            }
            .font(.callout)
            .padding(.top, 2)
            .foregroundColor(.white)
            .opacity(0.75)
        }
        .navigationDestination(for: String.self) { string in
            ReposView(viewModel: ReposViewModel())
        }
        .padding()
        .background(Color(.background))
    }
}

#Preview {
    WelcomeView()
}
