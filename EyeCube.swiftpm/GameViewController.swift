import UIKit
import SceneKit

class GameViewController: UIViewController {
    
    // Screen
    let screenSize: CGRect = UIScreen.main.bounds
    var screenWidth: Float!
    var screenHeight: Float!
    
    // Scene
    var sceneView: SCNView!
    var rootNode: SCNNode!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScene()
        createCamera()
        createRubiksCube()
    }
    
    func createScene() {
        screenWidth = Float(screenSize.width)
        screenHeight = Float(screenSize.height)
        
        // sceneview
        sceneView = SCNView(frame: self.view.frame)
        sceneView.scene = SCNScene()
        sceneView.backgroundColor = .gray
        sceneView.showsStatistics = false
        sceneView.allowsCameraControl = true
        sceneView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(sceneView)
        rootNode = sceneView.scene!.rootNode
        
        // gestos
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        // light
        sceneView.autoenablesDefaultLighting = false
    }
    
    func createCamera() {
        let camera = SCNCamera()
        cameraNode = SCNNode()
        cameraNode.camera = camera
        rootNode.addChildNode(cameraNode)
        
        cameraNode.position = SCNVector3Make(0, 0, 10)
    }
    
    func createRubiksCube() {
        
        // distâncias entre os cubos
        let offset: [Float] = [-0.50, 0.5]
        
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
        
        
        for x in offset {
            for y in offset {
                for z in offset {
                    let cube = CubeNode()
                    cube.position = SCNVector3(x: x, y: y, z: z)
                    
                    // aplicando materiais
                    var materials: [SCNMaterial] = []
                    
                    // Left Face
                    if x == offset[0] && y == offset[0] && z == offset[0] {
                        materials = [blackMaterial, blackMaterial, blueMaterial, orangeMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == offset[0] && y == offset[0] && z == offset[1] {
                        materials = [greenMaterial, blackMaterial, blackMaterial, orangeMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == offset[0] && y == offset[1] && z == offset[0] {
                        materials = [blackMaterial, blackMaterial, blueMaterial, orangeMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    if x == offset[0] && y == offset[1] && z == offset[1] {
                        materials = [greenMaterial, blackMaterial, blackMaterial, orangeMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    // Right Face
                    
                    if x == offset[1] && y == offset[0] && z == offset[0] {
                        materials = [blackMaterial, redMaterial, blueMaterial, blackMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == offset[1] && y == offset[0] && z == offset[1] {
                        materials = [greenMaterial, redMaterial, blackMaterial, blackMaterial, blackMaterial, yellowMaterial]
                    }
                    
                    if x == offset[1] && y == offset[1] && z == offset[0] {
                        materials = [blackMaterial, redMaterial, blueMaterial, blackMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    if x == offset[1] && y == offset[1] && z == offset[1] {
                        materials = [greenMaterial, redMaterial, blackMaterial, blackMaterial, whiteMaterial, blackMaterial]
                    }
                    
                    cube.geometry!.materials = materials
                    rootNode.addChildNode(cube)
                }
            }
        }
    }
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]
            
            // get its material
            let material = result.node.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
}
