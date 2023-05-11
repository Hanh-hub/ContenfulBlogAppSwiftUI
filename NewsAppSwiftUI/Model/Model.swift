//
//  Model.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//

import Foundation
import SwiftUI
import Contentful



// Models.swift
struct BlogPost: Identifiable {
    let id = UUID() // needed for using ForEach statement
    var title: String
    var subtitle: String
    var imageUrl: String?
    var description: String
    var featured: Bool
}
struct Author: Codable, Identifiable {
    let id: String
    let name: String
}

