import Foundation
import Domain

struct GitHubReposResponse: Decodable {
    var totalCount: Int
    var incompleteResults: Bool
    var repos: [Repo]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repos = "items"
    }
}

// MARK: - Helping Structures

extension GitHubReposResponse {
    
    struct Repo: Decodable {
        var id: Int
        var nodeId: String
        var name: String
        var fullName: String
        var owner: Owner
        var htmlUrl: String
        var description: String?
        var url: String
        var stars: Int
        var language: String?
        var forks: Int
        var openIssues: Int
        var contributorsUrl: String?
        var lastUpdate: Date?
        
        var domain: Domain.Repo {
            Domain.Repo(id: id,
                        nodeId: nodeId,
                        name: name,
                        fullName: fullName,
                        owner: owner.domain,
                        htmlUrl: htmlUrl,
                        description: description ?? "",
                        url: url,
                        stars: stars,
                        language: language ?? "",
                        forks: forks,
                        openIssues: openIssues,
                        contributorsUrl: contributorsUrl,
                        lastUpdate: lastUpdate)
        }
        
        enum CodingKeys: String, CodingKey {
            case id
            case nodeId = "node_id"
            case name
            case fullName = "full_name"
            case owner
            case htmlUrl = "html_url"
            case description
            case url
            case stars = "stargazers_count"
            case language
            case forks = "forks_count"
            case openIssues = "open_issues_count"
            case contributorsUrl = "contributors_url"
            case lastUpdate = "updated_at"
        }
    }
    
    struct Owner: Decodable {
        
        var login: String
        var id: Int
        var nodeId: String
        var avatarUrl: String
        
        enum CodingKeys: String, CodingKey {
            case login
            case id
            case nodeId = "node_id"
            case avatarUrl = "avatar_url"
        }
        
        var domain: Domain.Repo.Owner {
            Domain.Repo.Owner(id: id,
                              login: login,
                              avatarUrl: avatarUrl)
        }
        
    }
    
}
