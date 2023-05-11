//
//  ViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//

import Foundation
import SwiftUI
import Contentful

class ViewModel: ObservableObject {
    
    @Published var blogPosts: [BlogPost] = []
    @Published var error: String = ""
    
    
    var featuredPosts: [BlogPost]? {
        return blogPosts.filter{ entry in
            entry.featured == true
        }
    }
    
    init(){
        getData{
            DispatchQueue.main.async {
            }
        }
    
    }
    
    func getData(completion: @escaping() ->Void){
        ContentfulClient.shared.fetchBlogPosts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let entriesArray):
                    entriesArray.forEach{ entry in
                        self.blogPosts.append(self.mapToBlogSpot(for: entry))
                    }
                    completion()
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }
        }
    }
    
    func mapToBlogSpot(for entry: Entry) -> BlogPost{
        let entry = entry.fields
        return BlogPost(title: entry["title"] as! String,
                        subtitle: entry["subtitle"] as! String,
                        imageUrl: entry["imageUrl"] as? String,
                        description: entry["description"] as! String,
                        featured: entry["featured"] as! Bool
        )
    }
    
  
    
    
}
