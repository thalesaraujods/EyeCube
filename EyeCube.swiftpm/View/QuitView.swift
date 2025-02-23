import SwiftUI

struct QuitView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Spacer().frame(height: screenHeight*0.19)
            QuitInformationView()
            
            Spacer().frame(height: screenHeight*0.14)
            
            Button(action: {
                coordinator.popToRoot()
            }) {
                Text("quit_button_home")
                    .font(.custom("SF Pro", size: 20, relativeTo: .body))
                    .fontWeight(.bold)
                    .frame(width: screenWidth*0.31, height: screenHeight*0.07)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct QuitInformationView: View {
    var body: some View {
        Text("👊🏻")
            .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
            .fontWeight(.bold)
        Text("quit_title_message")
            .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.bottom, 3)
        Text("quit_description_message")
            .font(.custom("SF Pro", size: 20, relativeTo: .headline))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    QuitView()
}

