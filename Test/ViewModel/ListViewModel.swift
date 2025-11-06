//
//  ListViewModel.swift
//  Test
//
//  Created by Rz on 06/11/25.
//

import Foundation

class ListViewModel {
    
    var posts: [dataPostsMdl] = []
    var isLoading = false
    var errorMessage: String?
    
    private let postsService: PostsServices
    
    var didUpdateData: (() -> Void)?
    var didFail: ((String) -> Void)?
    
    init(postsService: PostsServices) {
        self.postsService = postsService
    }
    
    func getDataPosts() async {
        isLoading = true
        do {
            let data = try await postsService.getPostsData()
            posts = data
            await MainActor.run {
                self.didUpdateData?()
            }
        } catch {
            await MainActor.run {
                self.didFail?(error.localizedDescription)
            }
        }
        isLoading = false
    }
}
