import SwiftUI

enum Page: String, Identifiable {
    case home, welcome, cube, questions, finished, quit
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .home:
            HomeView()
        case .welcome:
            WelcomeView()
        case .cube:
            CubeView()
        case .questions:
            QuestionsView()
        case .finished:
            FinishedView()
        case .quit:
            QuitView()
        }
    }
}

