import UIKit
import SwiftUI

// UIViewController Representable to bring the View Controller to SwiftUI
struct GameView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> GameViewController {
        return GameViewController()
    }

    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {}
}

struct CubeView: View {
    var body: some View {
        GameView() //
            .edgesIgnoringSafeArea(.all)
    }
}

