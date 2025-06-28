import SwiftUI
import Domain

struct RepoDetailsView: View {
    let repo: Repo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                RepoHeaderView(repo: repo)
                
                Text(repo.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Rectangle()
                    .fill(.orange2)
                    .frame(height: 1)
                DetailInformationView(title: "Full Name", value: repo.fullName)
                DetailInformationView(title: "Stars", value: String(repo.stars))
                DetailInformationView(title: "Forks", value: String(repo.forks))
                DetailInformationView(title: "Open Issues", value: String(repo.openIssues))
                DetailInformationView(title: "Language", value: repo.language)

                if let lastUpdate = repo.lastUpdate {
                    DetailInformationView(title: "Last Updated", value: DateFormatter.mediumStyle.string(from: lastUpdate))
                }
                
                if let contributorsUrl = repo.contributorsUrl {
                    Button("Contributors") {
                        //TODO: show contributors
                        print(contributorsUrl)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(.orange3)
                    .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Repository Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
    }
}

struct RepoHeaderView: View {
    let repo: Repo
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "book.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(.orange1)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(repo.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Owner: \(repo.owner.login)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(.bottom, 5)
            Rectangle()
                .fill(.orange2)
                .frame(height: 1)
            AsyncImage(url: URL(string: repo.owner.avatarUrl)) { image in
                image.resizable()
            } placeholder: {
                Color.gray.frame(width: 60, height: 60)
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(.orange2, lineWidth: 2))
        }
    }
}

struct DetailInformationView: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title + ":")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    RepoDetailsView(repo: RepoPreviewUtils.repo)
}
