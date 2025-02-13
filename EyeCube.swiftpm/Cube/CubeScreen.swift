import SwiftUI
import SceneKit

struct CubeScreen: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = CubeScene.createScene()
        sceneView.allowsCameraControl = true  // Permite interação manual para rotacionar o cubo
        sceneView.backgroundColor = .darkGray
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {}
}

