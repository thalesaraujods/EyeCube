import SwiftUI
import SceneKit

struct CubeView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = CubeScene.createScene()
        sceneView.allowsCameraControl = true  // Permite interação manual para rotacionar o cubo
        sceneView.backgroundColor = .darkGray
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // Se precisar atualizar algo na cena, faça isso aqui
    }
}

