//
//  Constant.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//

import Foundation


let contentTypeId = "blogPost"
let spaceId =  "w9wkjr6jfi6l"
let environmentId = "master"
let accessToken = "adGy_1it2HbYcgfE1SjtQfunO-67-Gj-uKe0hYL3UKc"

let blogSpotPreview = BlogPost(title: "GCD",
                               subtitle: "Using GCD in IOS",
                               imageUrl: "https://i.pinimg.com/originals/8f/ef/aa/8fefaa44f99928585b65d34e05556590.png",
                               description: "Passing a single instance of BlogPost to DetailView and BlogPostCardList does not violate the MVVM principles, as you are only passing a single model object to your view components. The views themselves are not performing any business logic, they are just responsible for displaying the data.In this scenario, it is acceptable to pass a BlogPost instance to your DetailView and BlogPostCardList and store it as a property. Here's an example",
                               featured: true)


