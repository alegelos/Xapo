import Foundation

// Protocol to abstract URLSession
public protocol URLSessionWrapperProtocol: AnyObject {
    
    func mockableData(for request: ApiProtocol) async throws -> (Data, URLResponse)
    
}
