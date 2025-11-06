//
//  TestTests.swift
//  TestTests
//
//  Created by Rz on 06/11/25.
//

import XCTest
@testable import Test

final class TestTests: XCTestCase {
    
    var viewModel: ListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ListViewModel(postsService: PostsServices.shared)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testGetDataPosts_ShouldFetchSuccessfully() async throws {
        // When
        await viewModel.getDataPosts()
        
        XCTAssertFalse(viewModel.posts.isEmpty, "data kosojng.")
        
        if let first = viewModel.posts.first {
            print("✅ Fetched post title: \(first.title ?? "No Title")")
        }
    }

    func testGetDataPosts_Performance() async throws {
        // You can test network performance (optional)
        measure {
            Task {
                await self.viewModel.getDataPosts()
            }
        }
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
