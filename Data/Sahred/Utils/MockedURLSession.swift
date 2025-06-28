import Foundation


/// Use to mock URLSession calls
public final class MockedURLSession: URLSessionWrapperProtocol {
    
    private let jsonReader = JSonReader()
    
    public var mockError: Error?
    
    public init(mockError: Error? = nil) {
        self.mockError = mockError
    }
    
    public func mockableData(for request: ApiProtocol) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        }
        let jsonData = try jsonReader.localJSon(request.jsonSample)
        
        return (jsonData, HTTPURLResponse())
    }
    
}
