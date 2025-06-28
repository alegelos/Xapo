import Foundation
import Domain

public final class GitHubApiReposRequests: ApiRequests { 
    
}

extension GitHubApiReposRequests: ReposRequestsProtocol {    
    
    public func repos(for date: DateOptions,
                      page: Page) async throws -> [Domain.Repo] {
        do {
            let request = GithubApi.trendingRepositories(date: date, page: page)
            let (data, _) = try await session.mockableData(for: request)
            let reposResponse = try JSONDecoder.githubDecoder.decode(GitHubReposResponse.self, from: data)
            
            return  reposResponse.repos.map { $0.domain }
        } catch {
            //TODO: log error
            throw error
        }
    }
    
}
