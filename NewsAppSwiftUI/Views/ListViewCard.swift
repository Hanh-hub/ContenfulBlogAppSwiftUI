//
//  ListViewCard.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct ListViewCard: View {
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            
            WebImageView(urlString: blogPost.imageUrl)
                .frame(height: 180)
                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.title)
                        .formatText(Font.title2.bold(),.primary)
                    Spacer()
                }

                HStack {
                    Text(blogPost.subtitle)
                        .formatText(.headline, .secondary)
                    Spacer()
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 60, alignment: .leading)
        .padding()
    }
}

struct ListViewCard_Previews: PreviewProvider {
    static var previews: some View {
        ListViewCard(blogPost: blogSpotPreview)
    }
}
