import XCTest
import Domain

@testable import Data
@testable import XapoSample

final class ReposViewModelTests: XCTestCase {
    
    private var viewModel: ReposViewModel!
    private var session: MockedURLSession!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        session = MockedURLSession()
        let reposRequests = GitHubApiReposRequests(session: session)
        viewModel = ReposViewModel(sesssion: reposRequests)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        session = nil
        
        try super.tearDownWithError()
    }

    @MainActor 
    func testOnAppear() async throws {
        //GIVEN
        let expectedRepos = trendingRepos
        
        //WHEN
        await viewModel.onAppear()
        
        //THEN
        guard case let .success(repos) = viewModel.state else {
            XCTFail()
            return
        }
        XCTAssertEqual(expectedRepos, repos)
        XCTAssertFalse(repos.isEmpty)
    }
    
    @MainActor
    func testOnAppear_loadingState() async throws {
        //GIVEN
        let expectedRepos = trendingRepos
        
        //WHEN
        
        //THEN
        guard case .loading = viewModel.state else {
            XCTFail()
            return
        }
    }
    
    @MainActor
    func testOnAppear_fail() async throws {
        //GIVEN
        session.mockError = SessionError.nilData
        
        //WHEN
        await viewModel.onAppear()
        
        //THEN
        guard case let .error(error) = viewModel.state else {
            XCTFail()
            return
        }
        XCTAssertEqual(SessionError.nilData.localizedDescription, error.localizedDescription)
    }

}

// MARK: - Private

extension ReposViewModelTests {
    
    var trendingRepos: [Domain.Repo] {
        do {
            let reposData = try JSonReader().localJSon("TrendingRepos")
            let reposRepsonse = try JSONDecoder.githubDecoder.decode(GitHubReposResponse.self, from: reposData)
            
            return reposRepsonse.repos.map { $0.domain }
        } catch {
            XCTFail()
            return []
        }
    }
    
}

// MARK: - Helping Structures

extension ReposViewModelTests {
    
    enum SessionError: Error {
        case nilData
    }
    
}
