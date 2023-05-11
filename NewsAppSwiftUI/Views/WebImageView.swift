//
//  WebImageView.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/11/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct WebImageView: View {
    var urlString: String?
    var body: some View {
        if let url = urlString, let imageUrl = URL(string: url) {
            WebImage(url: imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}
