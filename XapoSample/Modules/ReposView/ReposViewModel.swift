import Foundation
import Domain
import Data

final class ReposViewModel: ObservableObject {
    
    @Published var state: DataLoadState = .loading
    
    private var sesssion: ReposRequestsProtocol
    private var page = Page(number: .zero)
    
    init(sesssion: ReposRequestsProtocol = GitHubApiReposRequests()) {
        self.sesssion = sesssion
    }
    
    @MainActor
    func onAppear() async {
        do {
            let repos = try await sesssion.repos(for: .lastWeek, page: page)
            state = .success(repos)
        } catch {
            //TODO: handle error
            //TODO: show a friendly human readable error and a retry
            state = .error(error)
        }
    }
    
    @MainActor
    func onScrollingBottomEnd() {
        //TODO: semi infinite scroll / paging
    }
    
}

// MARK: - Helping Structures

extension ReposViewModel {
    
    enum DataLoadState {
        case loading
        case success([Repo])
        case error(Error)
    }
    
}
