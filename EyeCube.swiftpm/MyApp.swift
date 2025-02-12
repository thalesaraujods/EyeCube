import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CubeView()
                        .edgesIgnoringSafeArea(.all) // Para ocupar toda a tela
        }
    }
}
