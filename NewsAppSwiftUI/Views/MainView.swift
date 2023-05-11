//
//  MainView.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/9/23.
//

import SwiftUI
import Foundation

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                if let featurePosts = viewModel.featuredPosts {
                    VStack{
                        HStack {
                            Text("Featured posts")
                                .font(.title.bold())
                            Spacer()
                        }
                        LazyVStack {
                            ForEach(featurePosts) { post in
                                NavigationLink(destination: DetailViewCard(blogPost: post)){
                                    FeaturedViewCard(blogPost: post)
                                }
                            }
                        }
                    }
                }
                
                VStack{
                    HStack {
                        Text("Latest posts")
                            .font(.title.bold())
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            if viewModel.blogPosts.count >= 3 {
                                ForEach(viewModel.blogPosts[0...2]) {post in
                                    NavigationLink(destination: DetailViewCard(blogPost: post)) {
                                        FeaturedViewCard(blogPost: post)
                                    }
                                }
                                
                            } else {
                                ForEach(viewModel.blogPosts[0..<viewModel.blogPosts.count]) {post in
                                    NavigationLink(destination: DetailViewCard(blogPost: post)) {
                                        FeaturedViewCard(blogPost: post)
                                    }
                                }
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 30)
                    }
                }
            }
        }.navigationTitle("Home")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("dggssd")
                    }){
                        Image(systemName: "digitalcrown.arrow.clockwise")
                    }
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainView().environmentObject(ViewModel())
        }
        
    }
}
