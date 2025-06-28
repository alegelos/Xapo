import SwiftUI
import Domain
import Data

@main
struct XapoSampleApp: App {
    var body: some Scene {
        WindowGroup {
<<<<<<< Updated upstream
            ReposView()
=======
            let viewModel = ReposViewModel()
            ReposView(viewModel: viewModel)
>>>>>>> Stashed changes
        }
    }
}
