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
        // Arrange
        guard let path = Bundle(for: Top_100_AlbumsTests.self).path(forResource: "mockJson", ofType: "json") else {
            fatalError("Cant find mockJson.json file")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let dataResponse = Response(data: data)
        guard let response = dataResponse.decode(Top100Albums.self) else {
            fatalError("Response was nil")
        }
        
        // Act
        let resultsCount = response.feed.results.count
        let firstResult = response.feed.results.first
        
        // Assert
        XCTAssertEqual(resultsCount, 2)
        XCTAssertFalse(response.feed.results.isEmpty)
        XCTAssertEqual(firstResult?.albumName, "Dark Lane Demo Tapes")
        XCTAssertEqual(firstResult?.artistName, "Drake")
        XCTAssertNotEqual(firstResult?.albumName, "My Turn (Deluxe)")
    }
    
    func testMockAlbumDetailViewModel() throws {
        // Arrange
        guard let path = Bundle(for: Top_100_AlbumsTests.self).path(forResource: "SingleJson",
                                                                    ofType: "json") else {
            fatalError("Cant find SingleJson.json file")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let dataResponse = Response(data: data)
        guard let response = dataResponse.decode(Results.self) else {
            fatalError("Response was nil")
        }
        
        // Act
        let viewModel = AlbumDetailViewModel(result: response)
        
        // Assert
        XCTAssertEqual(viewModel.nameOfArtist, "Drake")
        XCTAssertEqual(viewModel.releaseDate, "2020-05-01")
        XCTAssertEqual(viewModel.nameOfAlbum, "Dark Lane Demo Tapes")
        XCTAssertEqual(viewModel.albumImageUrl, "https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/02/32/85/02328553-ae05-1801-47bf-8f1e29871db1/20UMGIM34466.rgb.jpg/200x200bb.png")
        XCTAssertEqual(viewModel.albumURL, "https://music.apple.com/ca/album/dark-lane-demo-tapes/1511037323?app=music")
        XCTAssertEqual(viewModel.copyright, "℗ 2020 OVO, under exclusive license to Republic Records, a division of UMG Recordings, Inc.")
        XCTAssertEqual(viewModel.genre, "Hip-Hop/Rap")
    }
    
    func testMockAlbumDetailViewModelFail() {
        // Arrange
        let results = Results(artistName: nil,
                              releaseDate: nil,
                              albumName: nil,
                              artworkURL: nil,
                              albumURL: nil,
                              copyright: nil,
                              genres: [])
        
        // Act
        let viewModel = AlbumDetailViewModel(result: results)
        
        // Assert
        XCTAssertEqual(viewModel.nameOfArtist, "")
        XCTAssertEqual(viewModel.releaseDate, "")
        XCTAssertEqual(viewModel.nameOfAlbum, "")
        XCTAssertEqual(viewModel.albumImageUrl, "")
        XCTAssertEqual(viewModel.albumURL, "")
        XCTAssertEqual(viewModel.copyright, "")
        XCTAssertEqual(viewModel.genre, "")
    }
    
    func testMockTopAlbumTableViewCellModel() throws {
        // Arrange
        guard let path = Bundle(for: Top_100_AlbumsTests.self).path(forResource: "SingleJson",
                                                                    ofType: "json") else {
                                                                        fatalError("Cant find SingleJson.json file")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let dataResponse = Response(data: data)
        guard let response = dataResponse.decode(Results.self) else {
            fatalError("Response was nil")
        }
        
        // Act
        let viewModel = TopAlbumTableViewCellModel(result: response)
        
        // Assert
        XCTAssertEqual(viewModel.nameOfArtist, "Drake")
        XCTAssertEqual(viewModel.nameOfAlbum, "Dark Lane Demo Tapes")
        XCTAssertEqual(viewModel.albumImageUrl, "https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/02/32/85/02328553-ae05-1801-47bf-8f1e29871db1/20UMGIM34466.rgb.jpg/200x200bb.png")
    }
    
    func testMockTopAlbumTableViewCellModelFail() {
        // Arrange
        let results = Results(artistName: nil,
                              releaseDate: nil,
                              albumName: nil,
                              artworkURL: nil,
                              albumURL: nil,
                              copyright: nil,
                              genres: [])
        
        // Act
        let viewModel = TopAlbumTableViewCellModel(result: results)
        
        // Assert
        XCTAssertEqual(viewModel.nameOfAlbum, "")
        XCTAssertEqual(viewModel.nameOfArtist, "")
        XCTAssertEqual(viewModel.albumImageUrl, "")
    }
    
    func testTopAlbumsViewModel() {
        // Arrange
        let viewModel = TopAlbumsViewModel(MockNetworker("mockJson"))
        
        // Act
        let expectation = XCTestExpectation(description: "testTopAlbumsViewModel")
        viewModel.getMostPopularAlbums {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        // Assert
        XCTAssertEqual(viewModel.count, 2)
        let detailViewModel = viewModel.detailsViewModel(for: 0)
        XCTAssertEqual(detailViewModel?.nameOfArtist, "Drake")
        XCTAssertEqual(detailViewModel?.releaseDate, "2020-05-01")
        XCTAssertEqual(detailViewModel?.nameOfAlbum, "Dark Lane Demo Tapes")
        let cellViewModel = viewModel.cellViewModel(index: 0)
        XCTAssertEqual(cellViewModel?.nameOfArtist, "Drake")
        XCTAssertEqual(cellViewModel?.nameOfAlbum, "Dark Lane Demo Tapes")
        XCTAssertEqual(cellViewModel?.albumImageUrl, "https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/02/32/85/02328553-ae05-1801-47bf-8f1e29871db1/20UMGIM34466.rgb.jpg/200x200bb.png")
    }
        
}
