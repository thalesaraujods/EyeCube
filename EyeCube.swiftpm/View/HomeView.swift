import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var cubeViewModel = CubeViewModel.shared
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 20){
                Text("home_subtitle")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                
                Text("home_deadline")
                    .font(.custom("SF Pro", size: 20, relativeTo: .headline))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                VStack (alignment: .leading, spacing: 25){
                    // EyeTracking
                    VStack (alignment: .leading, spacing: 4){
                        HStack {
                            Image(systemName: "eye")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                            Text("home_topic1")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                        }
                        Text("home_topic1_description")
                            .font(.custom("SF Pro", size: 15, relativeTo: .body))
                    }
                    
                    // Dispositivo
                    VStack (alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: "iphone")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                            Text("home_topic2")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                        }
                        Text("home_topic2_description")
                            .font(.custom("SF Pro", size: 15, relativeTo: .body))
                    }
                    
                    // Cube
                    VStack (alignment: .leading, spacing: 4){
                        HStack {
                            Image(systemName: "cube")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                            Text("home_topic3")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                            
                        }
                        Text("home_topic3_description")
                            .font(.custom("SF Pro", size: 15, relativeTo: .body))
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Jornada
                    VStack (alignment: .leading, spacing: 4){
                        HStack {
                            Image(systemName: "face.smiling")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                            Text("home_topic4")
                                .font(.custom("SF Pro", size: 17, relativeTo: .caption))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                        }
                        Text("home_topic4_description")
                            .font(.custom("SF Pro", size: 15, relativeTo: .body))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                }
                .padding(.leading, 10)
            }
            
            Spacer()
            Button(action: {
                coordinator.push(.cube)
                cubeViewModel.startTimer()
            }) {
                Text("home_button")
                    .font(.custom("SF Pro", size: 20, relativeTo: .body))
                    .fontWeight(.bold)
                    .frame(width: screenWidth*0.31, height: screenHeight*0.07)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
