import SwiftUI

class CubeViewModel: ObservableObject {
    static let shared = CubeViewModel()
    @Published var isDisabled: Bool = false
    
    func disableButtonsTemporarily() {
        print("apertei o botão")
        isDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isDisabled = false
        }
    }
}
