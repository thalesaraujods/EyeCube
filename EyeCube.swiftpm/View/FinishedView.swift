import SwiftUI

struct FinishedView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack (alignment: .center){
            Spacer().frame(height: screenHeight*0.19)
            FinishedInformationView()
            
            Spacer().frame(height: screenHeight*0.14)
            Button(action: {
                coordinator.popToRoot()
            }) {
                Text("finished_button_home")
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

struct FinishedInformationView: View {
    var body: some View {
        VStack {
            Text("🎉")
                .font(.custom("SF Pro", size: 60, relativeTo: .largeTitle))
                .fontWeight(.bold)
            Text("finished_title_message")
                .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 3)
            Text("finished_description_message")
                .font(.custom("SF Pro", size: 18, relativeTo: .headline))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    FinishedView()
}
