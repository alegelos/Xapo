import SwiftUI
import Domain
import Data

struct RepoCard: View {
    var repo: Repo
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "book.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Layout.imageWidth,
                           height: Layout.imageHeight)
                    .foregroundColor(.white)
                    .padding(.all, Layout.padding)
                    .background(.orange1)
                    .cornerRadius(Layout.cornerRadius)
                VStack(alignment: .leading,
                       spacing: Layout.spacing) {
                    HStack {
                        Text(repo.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        HStack(spacing: Layout.spacing) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(repo.stars)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Text(repo.description)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(4)
                }
            }
            Divider()
                .background(.white.opacity(0.7))
            HStack {
                if !repo.language.isEmpty {
                    Text(repo.language)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, Layout.languagePadding)
                        .background(.orange2)
                        .cornerRadius(Layout.languageCornerRadius)
                }
                Spacer()
                
                HStack {
                    Image(systemName: "calendar")
                    Text(repo.lastUpdate.map { "Updated on \($0, formatter: DateFormatter.mediumStyle)" } ?? "Date not available")
                        .font(.caption)
                }
                .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .background(Color.background)
        .cornerRadius(Layout.cardCornerRadius)
        .shadow(color: .black.opacity(0.2),
                radius: Layout.cornerRadius,
                x: 0,
                y: 5)
        .padding(.horizontal)
    }
    
}

// MARK: - Helping Structures

extension RepoCard {
    
    struct Layout {
        
        static let imageWidth: CGFloat = 40
        static let imageHeight: CGFloat = 40
        static let cornerRadius: CGFloat = 10
        static let padding: CGFloat = 10
        static let dividerHeight: CGFloat = 1
        static let spacing: CGFloat = 4
        static let languageCornerRadius:CGFloat = 5
        static let languagePadding:CGFloat = 5
        static let cardCornerRadius: CGFloat = 20
        
    }

}

#Preview {
    RepoCard(repo: RepoPreviewUtils.repo)
}
