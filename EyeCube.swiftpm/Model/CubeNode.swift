import SceneKit

class CubeNode: SCNNode {
    
    override init() {
        super.init()
        
        let size = CGFloat(1)
        let mesh = SCNBox(width: CGFloat(size), height: size, length: size, chamferRadius: 0.1)
        self.geometry = mesh

        
        let body = SCNPhysicsBody(type: .kinematic, shape: .init(geometry: mesh))
        body.isAffectedByGravity = false
        body.categoryBitMask = 1
        body.collisionBitMask = 1
        body.contactTestBitMask = 0
        
        self.physicsBody = body
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum Face {
    case right, left, up, down, front, back
}

var faces: [Face: SCNVector3] = [
    .right: SCNVector3( 1,  0,  0), // Direita
    .left: SCNVector3(-1,  0,  0), // Esquerda
    .up: SCNVector3( 0,  1,  0), // Cima
    .down: SCNVector3( 0, -1,  0), // Baixo
    .front: SCNVector3( 0,  0,  1), // Frente
    .back: SCNVector3( 0,  0, -1) // Trás
]
