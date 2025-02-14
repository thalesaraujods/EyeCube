import SceneKit

class RubiksCube: SCNNode {
    
    var cubeSize: CGFloat = 1 // tamanho de um cubo
    var cubeDistance: CGFloat = 1 // distância entre os cubos
    var cubeGeometry: SCNBox = SCNBox()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        createCube()
    }
    
    func createCube() {
        // material
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red
        
        let blueMaterial = SCNMaterial()
        blueMaterial.diffuse.contents = UIColor.blue
        
        let yellowMaterial = SCNMaterial()
        yellowMaterial.diffuse.contents = UIColor.yellow
        
        let whiteMaterial = SCNMaterial()
        whiteMaterial.diffuse.contents = UIColor.white
        
        let orangeMaterial = SCNMaterial()
        orangeMaterial.diffuse.contents = UIColor.orange
        
        let blackMaterial = SCNMaterial()
        blackMaterial.diffuse.contents = UIColor.black
        
        let purpleMaterial = SCNMaterial()
        purpleMaterial.diffuse.contents = UIColor.purple
        
        // posição inicial
        var xPos:Float = 0
        var yPos:Float = 0
        var zPos:Float = 0
        
        for x in 0..<2 {
            for y in 0..<2 {
                for z in 0..<2 {
                    self.cubeGeometry = SCNBox(width: cubeSize,
                                               height: cubeSize,
                                               length: cubeSize,
                                               chamferRadius: 0.1)
                    
                    // aplicando materiais
                    var materials: [SCNMaterial] = []
                    
                    // frontal
                    if x == 0 && y == 0 && z == 0 {
                        materials = [greenMaterial, blackMaterial, blackMaterial, orangeMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == 0 && y == 1 && z == 0 {
                        materials = [greenMaterial, blackMaterial, blackMaterial, orangeMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    if x == 1 && y == 0 && z == 0 {
                        materials = [greenMaterial, redMaterial, blackMaterial, blackMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == 1 && y == 1 && z == 0 {
                        materials = [greenMaterial, redMaterial, blackMaterial, blackMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    // costas
                    if x == 0 && y == 0 && z == 1 {
                        materials = [blackMaterial, blackMaterial, blueMaterial, orangeMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == 0 && y == 1 && z == 1 {
                        materials = [blackMaterial, blackMaterial, blueMaterial, orangeMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    if x == 1 && y == 0 && z == 1 {
                        materials = [blackMaterial, redMaterial, blueMaterial, blackMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == 1 && y == 1 && z == 1 {
                        materials = [blackMaterial, redMaterial, blueMaterial, blackMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    cubeGeometry.materials = materials
                    
                    let cube = SCNNode(geometry: cubeGeometry)
                    cube.position = SCNVector3(x: xPos, y: yPos, z: zPos)
                    
                    zPos -= Float(cubeDistance)
                    self.addChildNode(cube)
                }
                zPos = 0
                yPos += Float(cubeDistance)
            }
            zPos = 0
            yPos = 0
            xPos += Float(cubeDistance)
        }
    }
}

