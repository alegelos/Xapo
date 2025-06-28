import SwiftUI
import Domain
import Data

@main
struct XapoSampleApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "BackgroundColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UIBarButtonItem.appearance().tintColor = UIColor(named: "Orange2")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WelcomeView()
            }
        }
    }
    
}
