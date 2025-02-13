import SwiftUI

struct CubeView: View {
    var body: some View {
        CubeScreen()
            .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    CubeScreen()
}
