import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var cubeViewModel = CubeViewModel.shared
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Spacer().frame(height: screenHeight*0.2)
            HomeInformationView()
            
            Spacer().frame(height: screenHeight*0.21)
            Button(action: {
                coordinator.push(.cube)
                cubeViewModel.startTimer()
            }) {
                Label("home_button", systemImage: "")
                    .font(.system(.body))
                    .frame(width: screenWidth*0.31, height: screenHeight*0.07)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
            }
        }
        .navigationTitle("EyeCube")
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {
//                    print("Configurações pressionado")
//                }) {
//                    Image(systemName: "questionmark.circle.fill") // Ícone de configurações
//                }
//            }
//        }
    }
}

struct HomeInformationView: View {
    var body: some View {
        Image(systemName: "cube")
            .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
            .fontWeight(.bold)
        //        Text("EyeCube")
        //            .font(.custom("SF Pro", size: 40, relativeTo: .largeTitle))
        //            .fontWeight(.bold)
        //            .multilineTextAlignment(.center)
        Text("home_message")
            .font(.custom("SF Pro", size: 20, relativeTo: .headline))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    HomeView()
}

