import SwiftUI
import Data
import Domain

struct ReposView: View {
    
    @StateObject var viewModel: ReposViewModel
    
    var body: some View {
        List {
            switch viewModel.state {
            case .error(let error):
                Text("Error loading repos: \(error.localizedDescription)")
                                    .foregroundColor(.red)
            case .loading:
                ForEach(0..<10, id: \.self) { _ in
                    RepoCardSkeleton()
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 10)
                        .redacted(reason: .placeholder)
                }
            case .success(let repos):
                ForEach(repos) { repo in
                    NavigationLink(value: repo) {
                        RepoCard(repo: repo)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(.plain)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
        }
        .navigationDestination(for: Repo.self) { repo in
            RepoDetailsView(repo: repo)
        }
        .padding(.trailing)
        .listStyle(.plain)
        .navigationBarTitle("Repos")
        .background(Color(.background))
        .navigationBarBackButtonHidden(true)
        .task {
            await viewModel.onAppear()
        }
    }
}

#Preview {
    let gitHubApiReposRequests = GitHubApiReposRequests(session: MockedURLSession())
    let viewModel = ReposViewModel(sesssion: gitHubApiReposRequests)
    return ReposView(viewModel: viewModel)
}
