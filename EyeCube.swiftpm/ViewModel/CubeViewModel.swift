import SwiftUI

class CubeViewModel: ObservableObject {
    static let shared = CubeViewModel()
    @Published var isDisabled: Bool = false
    @Published var timeElapsed: Int = 0
    private var timer: Timer?
    
    // Formata o tempo no estilo MM:SS
    var formattedTime: String {
        let minutes = timeElapsed / 60
        let seconds = timeElapsed % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startTimer() {
        timeElapsed = 0 // Reinicia o tempo ao iniciar
        timer?.invalidate() // Garante que não há timers ativos antes de criar um novo
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timeElapsed += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func disableButtonsTemporarily() {
        print("apertei o botão")
        isDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isDisabled = false
        }
    }
}
