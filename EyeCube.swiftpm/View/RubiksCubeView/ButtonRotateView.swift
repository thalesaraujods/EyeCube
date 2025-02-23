import SwiftUI

struct ButtonRotateView: View {
    
    @ObservedObject var viewModel = CubeViewModel.shared
    @Binding var gameViewController: GameViewController
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let buttonCollor = Color.blue
    let sizeButton:CGFloat = 58
    let rotateDuration: CGFloat = 0.5
    let delay: Double = 0.7
    
    var body: some View {
        // Principal
        VStack (spacing: 20){
            // 1ª linha
            HStack (spacing: 31){
                // L'
                Button(action: {
                    gameViewController.makeMovement(face: .left, clockWise: false, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image("l_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // L
                Button(action: {
                    gameViewController.makeMovement(face: .left, clockWise: true, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image(systemName: "l.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // R'
                Button(action: {
                    gameViewController.makeMovement(face: .right, clockWise: false, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image("r_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // R
                Button(action: {
                    gameViewController.makeMovement(face: .right, clockWise: true, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image(systemName: "r.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
            }
            
            // 2ª linha
            HStack (spacing: 31){
                // B'
                Button(action: {
                    gameViewController.makeMovement(face: .back, clockWise: false, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image("b_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // B
                Button(action: {
                    gameViewController.makeMovement(face: .back, clockWise: true, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image(systemName: "b.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // F'
                Button(action: {
                    gameViewController.makeMovement(face: .front, clockWise: false, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image("f_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // F
                Button(action: {
                    gameViewController.makeMovement(face: .front, clockWise: true, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image(systemName: "f.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
            }
            
            // 3ª linha
            HStack (spacing: 31) {
                // D'
                Button(action: {
                    gameViewController.makeMovement(face: .down, clockWise: false, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image("d_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // D
                Button(action: {
                    gameViewController.makeMovement(face: .down, clockWise: true, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image(systemName: "d.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // U'
                Button(action: {
                    gameViewController.makeMovement(face: .up, clockWise: false, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image("u_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
                
                // U
                Button(action: {
                    gameViewController.makeMovement(face: .up, clockWise: true, duration: rotateDuration)
                    viewModel.disableButtonsTemporarily()
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        gameViewController.checkIsComplete()
                    }
                }) {
                    Image(systemName: "u.circle.fill")
                        .font(.custom("SF Pro", size: sizeButton, relativeTo: .body))
                        .frame(width: screenWidth*0.15, height: screenHeight*0.07)
                        .foregroundColor(buttonCollor)
                }
                .disabled(viewModel.isDisabled)
            }
        }
        .padding()
    }
}
