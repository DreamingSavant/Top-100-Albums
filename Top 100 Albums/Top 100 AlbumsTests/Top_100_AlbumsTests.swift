//
//  Top_100_AlbumsTests.swift
//  Top 100 AlbumsTests
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import XCTest
@testable import Top_100_Albums

class Top_100_AlbumsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJsonMockDataSource() throws {
        
        guard let path = Bundle.main.path(forResource: "mockJson", ofType: "json") else {
            fatalError("Cant find mockJson.json file")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode(Top100Albums.self, from: data)
        
        let resultsCount = response.feed.results.count
        
        XCTAssertEqual(resultsCount, 2)
        XCTAssertFalse(response.feed.results.isEmpty)
        
        let firstResult = response.feed.results.first
        
        XCTAssertEqual(firstResult?.albumName, "Dark Lane Demo Tapes")
        XCTAssertEqual(firstResult?.artistName, "Drake")
        XCTAssertNotEqual(firstResult?.albumName, "My Turn (Deluxe)")
        
    }
}
