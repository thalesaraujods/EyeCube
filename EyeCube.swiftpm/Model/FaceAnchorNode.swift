import SceneKit

class FaceAnchorNode: SCNNode {

    override init() {
        super.init()
        
        let size: CGFloat = 0.4
        let mesh = SCNBox(width: size, height: size, length: size, chamferRadius: 0)
        self.geometry = mesh
        self.geometry?.materials.first?.diffuse.contents = UIColor.clear
        
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
