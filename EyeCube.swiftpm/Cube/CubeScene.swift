import SceneKit

class CubeScene {
    static func createScene() -> SCNScene {
        let scene = SCNScene()
        
        // Criar e posicionar o cubo
        let rubiksCube = RubiksCube()
        rubiksCube.position = SCNVector3(0, 0, 0)
        scene.rootNode.addChildNode(rubiksCube)
        
        // Criar e posicionar a câmera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0.5, y: 0, z: 10) // Ajuste a posição para visualizar melhor o cubo
        scene.rootNode.addChildNode(cameraNode)
        
//        // Criar luz para iluminar o cubo
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .omni
//        lightNode.position = SCNVector3(x: 5, y: 5, z: 5)
//        scene.rootNode.addChildNode(lightNode)
        
        return scene
    }
}
