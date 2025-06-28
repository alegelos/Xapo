import Foundation
import Domain

public enum GithubApi {
    
    case trendingRepositories(date: DateOptions, page: Page)
    
}

// MARK: - ApiProtocol

extension GithubApi: ApiProtocol {
    
    public var url: URL? {
        guard let baseURL = baseURL else {
            // TODO: log error
            return nil
        }
        var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                       resolvingAgainstBaseURL: false)
        
        do {
            switch self {
            case .trendingRepositories(let dateOptions, let page):
                let sort = "stars"
                let order = "desc"
                let date = try dateOptions.stringDate()
                let query = "created:>\(date)"
                let pageNumber = page.number
                let perPage = page.items
                
                components?.queryItems = [
                    URLQueryItem(name: "q", value: query),
                    URLQueryItem(name: "sort", value: sort),
                    URLQueryItem(name: "order", value: order),
                    URLQueryItem(name: "page", value: "\(pageNumber)"),
                    URLQueryItem(name: "per_page", value: "\(perPage)")
                ]
            }
        } catch {
            //TODO: handle error, maybe a default date?
            return nil
        }
        
        return components?.url
    }

    public var jsonSample: String {
        switch self {
        case .trendingRepositories:
            return "TrendingRepos"
        }
    }
}

// MARK: - Private

extension GithubApi {
    
    private var baseURL: URL? {
        guard let url = URL(string: "https://api.github.com") else {
            //TODO: log error
            return nil
        }
        
        return url
    }
    
    private var path: String {
        switch self {
        case .trendingRepositories:
            return "/search/repositories"
        }
    }
   
}
