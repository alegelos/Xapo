import Foundation

public class ApiRequests {
    
    let session: URLSessionWrapperProtocol
    
    public init(session: URLSessionWrapperProtocol = URLSession(configuration: .default)) {
        self.session = session
    }
    
}

// MARK: - Helping Structures

extension ApiRequests {
    
    enum Errors: Error {
        case nilURL
    }
    
}
