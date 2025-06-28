import Foundation

public protocol ReposRequestsProtocol: AnyObject {
    
    func repos(for: DateOptions, page: Page) async throws -> [Repo]
    
}
