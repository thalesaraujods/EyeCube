import SwiftUI

struct FinishedView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Spacer().frame(height: screenHeight*0.19)
            FinishedInformationView()
            
            Spacer().frame(height: screenHeight*0.14)
            Button(action: {
                coordinator.popToRoot()
            }) {
                Label("finished_button_home", systemImage: "")
                    .font(.system(.body))
                    .frame(width: screenWidth*0.31, height: screenHeight*0.07)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct FinishedInformationView: View {
    var body: some View {
        Text("🎉")
            .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
            .fontWeight(.bold)
        Text("finished_title_message")
            .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        Text("finished_description_message")
            .font(.custom("SF Pro", size: 20, relativeTo: .headline))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    FinishedView()
}
