import Foundation
import UIKit
import SceneKit

class GameViewController: UIViewController {
    
    // Faces do Rubiks's Cube
    enum Face: CaseIterable {
        case right, left, up, down, front, back
    }
    
    // Screen
    let screenSize: CGRect = UIScreen.main.bounds
    var screenWidth: Float!
    var screenHeight: Float!
    
    // Scene
    var sceneView: SCNView!
    var rootNode: SCNNode!
    var cameraNode: SCNNode!
    
    // distâncias entre os cubos
    let offset: [Float] = [-0.50, 0.5]
    
    var isScrambled: Bool = false
    var isCompleted: Bool = false
    
    var faces: [Face: SCNVector3] = [
        .right: SCNVector3( 1,  0,  0), // Direita
        .left: SCNVector3(-1,  0,  0), // Esquerda
        .up: SCNVector3( 0,  1,  0), // Cima
        .down: SCNVector3( 0, -1,  0), // Baixo
        .front: SCNVector3( 0,  0,  1), // Frente
        .back: SCNVector3( 0,  0, -1) // Trás
    ]
    
    var facesNodes: [Face:SCNNode] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isCompleted = false
        createScene()
        createCamera()
        createRubiksCube()
        createArchorNode()
        generateScramble()
    }
    
    func generateScramble() {
        var delay: TimeInterval = 0
        
        for _ in 0..<10 {
            let randomFace = Face.allCases.randomElement()!
            let randomClockwise = Bool.random()
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.makeMovement(face: randomFace, clockWise: randomClockwise, duration: 0.1)
            }
            
            delay += 0.25 // Adiciona um delay entre cada rotação
        }
        
        self.isCompleted = false
        self.isScrambled = true
    }
    
    func createScene() {
        screenWidth = Float(screenSize.width)
        screenHeight = Float(screenSize.height)
        
        // sceneview
        sceneView = SCNView(frame: self.view.frame)
        sceneView.scene = SCNScene()
        sceneView.backgroundColor = .clear
        sceneView.showsStatistics = false
        sceneView.allowsCameraControl = true
        sceneView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sceneView.scene?.physicsWorld.contactDelegate = self
        self.view.addSubview(sceneView)
        //sceneView.scene.rootNode = sceneView.scene!.rootNode
        
        //        // gestos
        //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        //        sceneView.addGestureRecognizer(tapGesture)
        
        // light
        sceneView.autoenablesDefaultLighting = false
    }
    
    func createCamera() {
        let camera = SCNCamera()
        cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, -1, 10)
        sceneView.scene!.rootNode.addChildNode(cameraNode)
    }
    
    func createRubiksCube() {
        // material
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green
        greenMaterial.name = "green"
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red
        redMaterial.name = "red"
        
        let blueMaterial = SCNMaterial()
        blueMaterial.diffuse.contents = UIColor.blue
        blueMaterial.name = "blue"
        
        let yellowMaterial = SCNMaterial()
        yellowMaterial.diffuse.contents = UIColor.yellow
        yellowMaterial.name = "yellow"
        
        let whiteMaterial = SCNMaterial()
        whiteMaterial.diffuse.contents = UIColor.gray
        whiteMaterial.name = "white"
        
        let orangeMaterial = SCNMaterial()
        orangeMaterial.diffuse.contents = UIColor.orange
        orangeMaterial.name = "orange"
        
        let blackMaterial = SCNMaterial()
        blackMaterial.diffuse.contents = UIColor.black
        blackMaterial.name = "black"
        
        for x in offset {
            for y in offset {
                for z in offset {
                    let cube = CubeNode()
                    cube.position = SCNVector3(x: x, y: y, z: z)
                    
                    // aplicando materiais
                    var materials: [SCNMaterial] = []
                    
                    // Left Face
                    if x == offset[0] && y == offset[0] && z == offset[0] {
                        materials = [blackMaterial, blackMaterial, blueMaterial, redMaterial, blackMaterial, whiteMaterial]
                        cube.name = "cubeA"
                    }
                    
                    if x == offset[0] && y == offset[0] && z == offset[1] {
                        materials = [greenMaterial, blackMaterial, blackMaterial, redMaterial, blackMaterial, whiteMaterial]
                        cube.name = "cubeB"
                    }
                    
                    if x == offset[0] && y == offset[1] && z == offset[0] {
                        materials = [blackMaterial, blackMaterial, blueMaterial, redMaterial, yellowMaterial, blackMaterial]
                        cube.name = "cubeC"
                    }
                    
                    if x == offset[0] && y == offset[1] && z == offset[1] {
                        materials = [greenMaterial, blackMaterial, blackMaterial, redMaterial, yellowMaterial, blackMaterial]
                        cube.name = "cubeD"
                    }
                    
                    // Right Face
                    if x == offset[1] && y == offset[0] && z == offset[0] {
                        materials = [blackMaterial, orangeMaterial, blueMaterial, blackMaterial, blackMaterial, whiteMaterial]
                        cube.name = "cubeE"
                    }
                    
                    if x == offset[1] && y == offset[0] && z == offset[1] {
                        materials = [greenMaterial, orangeMaterial, blackMaterial, blackMaterial, blackMaterial, whiteMaterial]
                        cube.name = "cubeF"
                    }
                    
                    if x == offset[1] && y == offset[1] && z == offset[0] {
                        materials = [blackMaterial, orangeMaterial, blueMaterial, blackMaterial, yellowMaterial, blackMaterial]
                        cube.name = "cubeG"
                    }
                    
                    if x == offset[1] && y == offset[1] && z == offset[1] {
                        materials = [greenMaterial, orangeMaterial, blackMaterial, blackMaterial, yellowMaterial, blackMaterial]
                        cube.name = "cubeH"
                    }
                    
                    cube.geometry!.materials = materials
                    sceneView.scene!.rootNode.addChildNode(cube)
                }
            }
        }
    }
    
    func createArchorNode() {
        for (key, face) in faces {
            let faceAnchor = FaceAnchorNode()
            faceAnchor.position = face
            faceAnchor.geometry!.materials.first?.diffuse.contents = UIColor.clear
            sceneView.scene!.rootNode.addChildNode(faceAnchor)
            facesNodes[key] = faceAnchor
        }
    }
    
    func checkToleranceDistance(positionCube: SCNVector3, positionCorrect: SCNVector3, tolerance: Float) -> Bool {
        if abs(Float(positionCorrect.x) - Float(positionCube.x)) <= tolerance &&
            abs(Float(positionCorrect.y) - Float(positionCube.y)) <= tolerance &&
            abs(Float(positionCorrect.z) - Float(positionCube.z))  <= tolerance {
            return true
        } else {
            return false
        }
    }
    
    func checkIsComplete() {
        var countCompleteCubesA: Int = 0
        var countCompleteCubesB: Int = 0
        var countCompleteCubesC: Int = 0
        var countCompleteCubesD: Int = 0
        let toleranceDistance: Float = 0.03
        
        if isScrambled {
            // Verifiçao A
            for child in sceneView.scene!.rootNode.childNodes {
                let name = child.name
                let position = child.position
                
                switch name {
                case "cubeA":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeB":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeC":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeD":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeE":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeF":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeG":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                case "cubeH":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesA += 1
                    }
                default:
                    break
                }
            }
            
            // Verifiçao B
            for child in sceneView.scene!.rootNode.childNodes {
                let name = child.name
                let position = child.position
                
                switch name {
                case "cubeA":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeB":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeC":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeD":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeE":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeF":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeG":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                case "cubeH":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesB += 1
                    }
                default:
                    break
                }
            }
            
            // Verifiçao C
            for child in sceneView.scene!.rootNode.childNodes {
                let name = child.name
                let position = child.position
                
                switch name {
                case "cubeA":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeB":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeC":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeD":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeE":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeF":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeG":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                case "cubeH":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesC += 1
                    }
                default:
                    break
                }
            }
            
            // Verifiçao D
            for child in sceneView.scene!.rootNode.childNodes {
                let name = child.name
                let position = child.position
                
                switch name {
                case "cubeA":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeB":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeC":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeD":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[1], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeE":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeF":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[0], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeG":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[1]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                case "cubeH":
                    if checkToleranceDistance(positionCube: position, positionCorrect: SCNVector3(x: offset[0], y: offset[1], z: offset[0]), tolerance: toleranceDistance) {
                        countCompleteCubesD += 1
                    }
                default:
                    break
                }
            }
            
            if (countCompleteCubesA == 8) || (countCompleteCubesB == 8) || (countCompleteCubesC == 8) || (countCompleteCubesD == 8) {
                self.isCompleted = true
            }
        }
    }
    
    func makeMovement(face: Face, clockWise: Bool, duration: CGFloat) {
        sceneView.scene!.rootNode.runAction(.sequence([
            .run { _ in
                self.rotate(face: face, clockWise: clockWise, duration: duration)
            }
        ]))
    }
    
    func rotate(face: Face, clockWise: Bool = true, duration: CGFloat = 1) {
        let faceNode = facesNodes[face]
        let contactCubes = sceneView.scene!.physicsWorld.contactTest(with: faceNode!.physicsBody!)
        var processed: [SCNNode] = []
        
        for contactCube in contactCubes {
            if (contactCube.nodeA is FaceAnchorNode) {
                if let cube = contactCube.nodeB as? CubeNode, !processed.contains(cube) {
                    processed.append(cube)
                    
                    let oldTransform = cube.worldTransform
                    
                    cube.removeFromParentNode()
                    faceNode?.addChildNode(cube)
                    
                    cube.transform = sceneView.scene!.rootNode.convertTransform(oldTransform, to: faceNode!)
                }
            }
        }
        
        let rotateDir = faces[face]! * (.pi / 2) * (clockWise ? -1 : 1)
        faceNode?.runAction(.sequence([
            .rotateBy(x: CGFloat(rotateDir.x),
                      y: CGFloat(rotateDir.y),
                      z: CGFloat(rotateDir.z), duration: duration),
            .run { [weak self] node in
                guard let self else { return }
                for child in processed {
                    let oldTransform = child.worldTransform
                    
                    child.removeFromParentNode()
                    sceneView.scene!.rootNode.addChildNode(child)
                    
                    child.transform = oldTransform
                }
            }
        ]))
    }
    
    //    @objc
    //    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
    //        // retrieve the SCNView
    //        let scnView = self.view as! SCNView
    //
    //        // check what nodes are tapped
    //        let p = gestureRecognize.location(in: scnView)
    //        let hitResults = scnView.hitTest(p, options: [:])
    //        // check that we clicked on at least one object
    //        if hitResults.count > 0 {
    //            // retrieved the first clicked object
    //            let result = hitResults[0]
    //
    //            // get its material
    //            let material = result.node.geometry!.firstMaterial!
    //
    //            // highlight it
    //            SCNTransaction.begin()
    //            SCNTransaction.animationDuration = 0.5
    //
    //            // on completion - unhighlight
    //            SCNTransaction.completionBlock = {
    //                SCNTransaction.begin()
    //                SCNTransaction.animationDuration = 0.5
    //
    //                material.emission.contents = UIColor.black
    //
    //                SCNTransaction.commit()
    //            }
    //
    //            material.emission.contents = UIColor.red
    //
    //            SCNTransaction.commit()
    //        }
    //    }
    
}

extension GameViewController: SCNPhysicsContactDelegate {
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
    }
}

extension SCNVector3: @retroactive Equatable {
    public static func * (lhs: SCNVector3, rhs: Float) -> SCNVector3 {
        return SCNVector3(x: lhs.x * rhs, y: lhs.y * rhs, z: lhs.z * rhs)
    }
    
    public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
}
