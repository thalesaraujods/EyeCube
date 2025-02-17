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
