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
