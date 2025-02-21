import UIKit
import SwiftUI

struct CubeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State private var gameViewController = GameViewController()
    @ObservedObject var viewModel = CubeViewModel.shared
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            GameView(gameViewController: $gameViewController)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(viewModel.formattedTime)")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                //                Button(action: {
                //                    gameViewController!.checkIsComplete()
                //                }) {
                //                    Label("Começar", systemImage: "")
                //                        .font(.system(.body))
                //                        .frame(width: screenWidth*0.31, height: screenHeight*0.07)
                //                        .background(Color.blue)
                //                        .foregroundColor(Color.white)
                //                        .cornerRadius(10)
                //                        .multilineTextAlignment(.center)
                //                }
                ButtonRotateView(gameViewController: $gameViewController)
            }
        }
        .onChange(of: gameViewController.isCompleted) {
            if gameViewController.isCompleted {
                coordinator.push(.finished)
            }
        }
    }
}

#Preview {
    CubeView ()
}

