//
//  ApiClient.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/10/23.
//


import Foundation
import Contentful

import SwiftUI



enum ApiError: Error{
    case parsingError
    case networkError(Error)
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .networkError (let error):
            return "NetworkError \(error.localizedDescription)"
        case .parsingError:
            return "Parsing error"
        case .serverError(let statusCode):
            return "Server error with status code \(statusCode)"
        }
    }
    
}

class ContentfulClient {
    static let shared = ContentfulClient()
    private let client: Client

    init(spaceId: String = spaceId, environemtId: String = environmentId, accessToken: String = accessToken) {
        client = Client(spaceId: spaceId,environmentId: environmentId, accessToken: accessToken)
    }

    func fetchBlogPosts(completion: @escaping (Result<[Entry],ApiError>) -> Void) {
        let query = Query.where(contentTypeId: contentTypeId)
        do {
            try query.order(by: Ordering(sys: .createdAt, inReverse: true))

            client.fetchArray(of: Entry.self, matching: query) { result in
                switch result {
                case .success(let arrayResponse):
                    let entries = arrayResponse.items
                    completion(.success(entries))
                case .failure(let error):
                    print(error)
                    completion(.failure(.networkError(error)))
                }
            }
        } catch let error{
            fatalError("\(error.localizedDescription)")
        }
    }
    

    
  
}

