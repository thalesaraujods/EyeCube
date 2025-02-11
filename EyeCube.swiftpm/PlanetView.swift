import SwiftUI
import SceneKit

struct PlanetView: View {
    var body: some View {
        VStack{
            SceneView(
                scene: SCNScene(named: models[0].modelName),
                options: [.autoenablesDefaultLighting, .allowsCameraControl]
            )
        }
    }
}

// Data Model
struct Model: Identifiable {
    
    var id: Int
    var name: String
    var modelName: String
    var details: String
}

// Sample Data
var models = [
    Model(id: 0, name: "Pluto", modelName: "PlutoScene.scn", details: "Pluto é um planeta legal e fica no espaço."),
]

