//
//  DetailViewCard.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct DetailViewCard: View {
    var blogPost: BlogPost
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    WebImageView(urlString: blogPost.imageUrl)
                        .frame(height: 310)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Text(blogPost.title)
                                .formatText(.title,.primary)
                                .padding(.vertical, 15)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        Text(blogPost.description)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .foregroundColor(Color.primary.opacity(0.9))
                            .padding(.bottom, 25)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 20)

                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailViewCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCard(blogPost: blogSpotPreview)
    }
}
