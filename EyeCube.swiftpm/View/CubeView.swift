import UIKit
import SwiftUI

// UIViewController Representable to bring the View Controller to SwiftUI
struct GameView: UIViewControllerRepresentable {
    
    // Binding para receber a referência da GameViewController
    @Binding var gameViewController: GameViewController?
    
    func makeUIViewController(context: Context) -> GameViewController {
        let gameVC = GameViewController()
        
        // Como a criação pode ocorrer fora do ciclo de atualização do SwiftUI,
        // usamos DispatchQueue.main.async para atribuir a referência de forma segura.
        DispatchQueue.main.async {
            self.gameViewController = gameVC
        }
        
        return gameVC
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {}
}

struct CubeView: View {
    
    @State private var gameViewController: GameViewController?
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            GameView(gameViewController: $gameViewController)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                CubeButtonRotateView(gameViewController: $gameViewController)
            }
        }
    }
}

struct CubeButtonRotateView: View {
    
    @Binding var gameViewController: GameViewController?
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let buttonCollor = Color.black
    let sizeButton:CGFloat = 58
    
    var body: some View {
        // Principal
        VStack (spacing: 20){
            // 1ª linha
            HStack (spacing: 31){
                // L'
                Button(action: {
                    gameViewController!.makeMovement(face: .left, clockWise: false)
                }) {
                    Image("l_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // L
                Button(action: {
                    gameViewController!.makeMovement(face: .left, clockWise: true)
                }) {
                    Image(systemName: "l.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // R'
                Button(action: {
                    gameViewController!.makeMovement(face: .right, clockWise: false)
                }) {
                    Image("r_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // R
                Button(action: {
                    gameViewController!.makeMovement(face: .right, clockWise: true)
                }) {
                    Image(systemName: "r.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
            }
            
            // 2ª linha
            HStack (spacing: 31){
                // B'
                Button(action: {
                    gameViewController!.makeMovement(face: .back, clockWise: false)
                }) {
                    Image("b_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // B
                Button(action: {
                    gameViewController!.makeMovement(face: .back, clockWise: true)
                }) {
                    Image(systemName: "b.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // F'
                Button(action: {
                    gameViewController!.makeMovement(face: .front, clockWise: false)
                }) {
                    Image("f_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // F
                Button(action: {
                    gameViewController!.makeMovement(face: .front, clockWise: true)
                }) {
                    Image(systemName: "f.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
            }
            
            // 3ª linha
            HStack (spacing: 31) {
                // D'
                Button(action: {
                    gameViewController!.makeMovement(face: .down, clockWise: false)
                }) {
                    Image("d_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // D
                Button(action: {
                    gameViewController!.makeMovement(face: .down, clockWise: true)
                }) {
                    Image(systemName: "d.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // U'
                Button(action: {
                    gameViewController!.makeMovement(face: .up, clockWise: false)
                }) {
                    Image("u_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                
                // U
                Button(action: {
                    gameViewController!.makeMovement(face: .up, clockWise: true)
                }) {
                    Image(systemName: "u.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
            }
        }
        .padding()
    }
}
