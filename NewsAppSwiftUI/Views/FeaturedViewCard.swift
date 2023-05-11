//
//  FeaturedViewCard.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeaturedViewCard: View {
    @Environment(\.colorScheme) var colorScheme
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading){
//            if let url = blogPost.imageUrl, let imageUrl = URL(string: url) {
//                WebImage(url: imageUrl)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .formatImage()
//            } else {
//                Image(systemName: "photo.artframe")
//                    .resizable()
//                    .formatImage()
//            }
            
            WebImageView(urlString: blogPost.imageUrl)
                .formatImage()
            
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.title)
                        .formatText(Font.title2.bold(),.primary)
                    Spacer()
                }
                HStack {
                    Text(blogPost.subtitle)
                        .formatText(.subheadline, .secondary)
                    Spacer()
                }
            }
            .frame(height: 110)
        }
        .padding(15)
        .background(colorScheme == .dark ? Color(hex: "#121212") : Color.white)
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: colorScheme == .dark ? .white.opacity(0.01) : .black.opacity(0.1), radius: 15, x: 0, y: 5)
    }
}

struct FeaturedViewCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedViewCard(blogPost: blogSpotPreview)
    }
}
