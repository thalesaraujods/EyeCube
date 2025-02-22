import UIKit
import SwiftUI

struct CubeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State private var gameViewController = GameViewController()
    @State private var showExitConfirmation: Bool = false
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
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    showExitConfirmation = true
                    
                }) {
                    Image(systemName: "x.circle")
                        .font(.custom("SF Pro", size: 25, relativeTo: .body))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                }
                .alert("cube_quit_alert_message", isPresented: $showExitConfirmation) {
                    Button("negative_option", role: .cancel) {
                        showExitConfirmation = false
                    }
                    Button("afirmative_option", role: .destructive) {
                        coordinator.push(.quit) // Retorna para a tela anterior
                    }
                    
            }
            
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    coordinator.push(.questions)
                }) {
                    Image(systemName: "questionmark.circle")
                        .font(.custom("SF Pro", size: 25, relativeTo: .body))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                }
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

