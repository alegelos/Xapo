import Foundation

extension URLSession: URLSessionWrapperProtocol {

    public func mockableData(for request: ApiProtocol) async throws -> (Data, URLResponse) {
        guard let url = request.url else {
            throw ApiRequests.Errors.nilURL
        }
        
        let request = URLRequest(url: url)
        
        return try await data(for: request)
    }

}
