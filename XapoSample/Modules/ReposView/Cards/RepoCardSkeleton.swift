import SwiftUI

struct RepoCardSkeleton: View {
    var body: some View {
        VStack {
            HStack {
                SkeletonView()
                    .frame(width: RepoCard.Layout.imageWidth + RepoCard.Layout.padding,
                           height: RepoCard.Layout.imageHeight + RepoCard.Layout.padding)
                    .cornerRadius(RepoCard.Layout.cornerRadius)
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 30) {
                        SkeletonView().frame(height: 20)
                        SkeletonView().frame(width: 70, height: 20)
                    }
                    SkeletonView().frame(height: 30)
                }
            }
            Divider()
                .frame(height: RepoCard.Layout.dividerHeight)
                .background(Color.gray.opacity(0.7))

            HStack {
                SkeletonView().frame(width: 50, height: 15).cornerRadius(5)
                Spacer()
                SkeletonView().frame(width: 100, height: 10)
            }
        }
        .padding()
        .background(Color.background)
        .cornerRadius(RepoCard.Layout.cardCornerRadius)
        .shadow(color: Color.black.opacity(0.2),
                radius: RepoCard.Layout.cornerRadius, 
                x: 0,
                y: 5)
        .padding(.horizontal)
    }
}

// MARK: - Helping Structures

extension RepoCardSkeleton {
    
    struct SkeletonView: View {
        var body: some View {
            Rectangle().fill(Color(UIColor.systemBackground).opacity(0.4)).blinking()
        }
    }
    
}

// Preview
struct RepoCardSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        RepoCardSkeleton()
    }
}
