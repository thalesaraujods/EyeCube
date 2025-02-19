import UIKit
import SwiftUI

struct CubeView: View {
    
    @State private var gameViewController: GameViewController?
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
                ButtonRotateView(gameViewController: $gameViewController)
            }
        }
    }
}

#Preview {
    CubeView ()
}

