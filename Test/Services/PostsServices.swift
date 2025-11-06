//
//  PostsServices.swift
//  Test
//
//  Created by Rz on 06/11/25.
//

import Foundation
//import Alamofire

class PostsServices {
    
    static let shared = PostsServices()
    
    func getPostsData() async throws -> [dataPostsMdl] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw URLError(.badURL)
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Server returned \(httpResponse.statusCode)"])
        }
        
        let decodedData = try JSONDecoder().decode([dataPostsMdl].self, from: data)
        return decodedData
    }
    
}
