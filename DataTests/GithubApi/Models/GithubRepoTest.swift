import XCTest
import Domain

@testable import Data

final class GithubRepoTest: XCTestCase {
    
    private var repoToTest: GitHubReposResponse.Repo!
    
    //Repo data
    private let id = 007
    private let nodeId = "nodeId"
    private let repoName = "name"
    private let fullName = "fullName"
    private let htmlUrl = "htmlUrl"
    private let repoDescription = "description"
    private let url = "url"
    private let stars = 7
    private let language = "language"
    private let forks = 11
    private let openIssues = 13
    private let contributorsUrl = "contributorsUrl"
    private let lastUpdate = Date()
    
    //Owner data
    private let ownerId = 17
    private let login = "login"
    private let avatarUrl = "avatarUrl"
    private let ownerNodeId = "nodeId"
    
    override func setUpWithError() throws {
        
        let ownerData = GitHubReposResponse.Owner(
            login: login,
            id: ownerId,
            nodeId: ownerNodeId,
            avatarUrl: avatarUrl
        )
        
        repoToTest = GitHubReposResponse.Repo(
            id: id,
            nodeId: nodeId,
            name: repoName,
            fullName: fullName,
            owner: ownerData,
            htmlUrl: htmlUrl,
            description: repoDescription,
            url: url,
            stars: stars,
            language: language,
            forks: forks,
            openIssues: openIssues,
            contributorsUrl: contributorsUrl,
            lastUpdate: lastUpdate
        )
        
    }
    
    override func tearDownWithError() throws {
        repoToTest = nil
    }
    
    func testRepoDomain() throws {
        //GIVEN
        let actualDomainRepo: Domain.Repo
        let expectedDomainRepo = repoDomainLayer
        
        //WHEN
        actualDomainRepo = repoToTest.domain
        
        //THEN
        XCTAssertEqual(expectedDomainRepo, actualDomainRepo)
    }
    
    func testRepoOwnerDomain() throws {
        //GIVEN
        let actualDomainRepoOwner: Domain.Repo.Owner
        let expectedDomainRepoOwner = repoDomainLayer.owner
        
        //WHEN
        actualDomainRepoOwner = repoToTest.owner.domain
        
        //THEN
        XCTAssertEqual(expectedDomainRepoOwner, actualDomainRepoOwner)
    }
    
}

// MARK: - Private

extension GithubRepoTest {
    
    private var repoDomainLayer: Domain.Repo {
        Domain.Repo(id: id,
                    nodeId: nodeId,
                    name: repoName,
                    fullName: fullName,
                    owner: ownerDomain,
                    htmlUrl: htmlUrl,
                    description: repoDescription,
                    url: url,
                    stars: stars,
                    language: language,
                    forks: forks,
                    openIssues: openIssues,
                    contributorsUrl: contributorsUrl,
                    lastUpdate: lastUpdate)
    }
    
    private var ownerDomain: Domain.Repo.Owner {
        Domain.Repo.Owner(id: ownerId,
                          login: login,
                          avatarUrl: avatarUrl)
    }
    
}
