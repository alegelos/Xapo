import Foundation
import Domain

struct RepoPreviewUtils {
    
    static let owner = Repo.Owner(id: 101,
                                  login: "exampleuser",
                                  avatarUrl: "https://avatars.githubusercontent.com/u/583231?v=4")
    
    static let repo = Repo(id: 123456,
                           nodeId: "MDEwOlJlcG9zaXRvcnkx",
                           name: "SwiftUI-Example",
                           fullName: "exampleuser/SwiftUI-Example",
                           owner: owner,
                           htmlUrl: "https://github.com/exampleuser/SwiftUI-Example",
                           description: "Example project demonstrating SwiftUI usage.",
                           url: "https://api.github.com/repos/exampleuser/SwiftUI-Example",
                           stars: 535,
                           language: "Swift",
                           forks: 42,
                           openIssues: 10,
                           contributorsUrl: "https://api.github.com/repos/exampleuser/SwiftUI-Example/contributors",
                           lastUpdate: Date())
}
