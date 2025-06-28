import Foundation

public struct Repo: Identifiable, Hashable {
    
    public var id: Int
    public var nodeId: String
    public var name: String
    public var fullName: String
    public var owner: Owner
    public var htmlUrl: String
    public var description: String
    public var url: String
    public var stars: Int
    public var language: String
    public var forks: Int
    public var openIssues: Int
    public var contributorsUrl: String?
    public var lastUpdate: Date?
    
    public init(id: Int,
                nodeId: String,
                name: String,
                fullName: String,
                owner: Owner,
                htmlUrl: String,
                description: String,
                url: String,
                stars: Int,
                language: String,
                forks: Int,
                openIssues: Int,
                contributorsUrl: String?,
                lastUpdate: Date?) {
        self.id = id
        self.nodeId = nodeId
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.htmlUrl = htmlUrl
        self.description = description
        self.url = url
        self.stars = stars
        self.language = language
        self.forks = forks
        self.openIssues = openIssues
        self.contributorsUrl = contributorsUrl
        self.lastUpdate = lastUpdate
    }
    
}

// MARK: - Helping Structures

extension Repo {
    
    public struct Owner: Hashable {
        
        public var id: Int
        public var login: String
        public var avatarUrl: String
        
        public init(id: Int, 
                    login: String,
                    avatarUrl: String) {
            self.id = id
            self.login = login
            self.avatarUrl = avatarUrl
        }
        
    }
    
}

