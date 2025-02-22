import SwiftUI

enum Page: String, Identifiable {
    case home, cube, questions, finished, quit
    
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
                .navigationTitle("home_title")
        case .cube:
            CubeView()
                .navigationBarBackButtonHidden(true)
        case .questions:
            QuestionsView()
                .navigationTitle("questions_title")
                .navigationBarTitleDisplayMode(.inline)
        case .finished:
            FinishedView()
                .navigationBarBackButtonHidden(true)
        case .quit:
            QuitView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

