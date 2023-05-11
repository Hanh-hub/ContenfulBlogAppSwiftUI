//
//  AllPosts.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/9/23.
//

import SwiftUI

struct AllPosts: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.blogPosts) {post in
                    NavigationLink(destination: DetailViewCard(blogPost: post)) {
                        ListViewCard(blogPost: post)
                    }
                }
            }
            .navigationTitle("All blog posts")
            .listStyle(InsetListStyle())
        }

    }
}

struct AllPosts_Previews: PreviewProvider {
    static var previews: some View {
        AllPosts().environmentObject(ViewModel())
    }
}
