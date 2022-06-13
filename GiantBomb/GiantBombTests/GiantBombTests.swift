//
//  GiantBombTests.swift
//  GiantBombTests
//
//  Created by Brian Young on 6/12/22.
//

import XCTest
@testable import GiantBomb

class GiantBombTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLiveGameRequest() async throws {
        let client = GiantBombClient()
        let response = try await client.getGame(gameId: "3030-4725")
        XCTAssert(response.limit == 1)
        if let name = response.results?.name {
            print(name)
        }
    }

    func testLiveSearchRequest() async throws {
        let client = GiantBombClient()
        let response = try await client.search(query: "Dude", limit: 5)
        XCTAssert(response.results?.count == 5)
        if let name = response.results?.count {
            print(name)
        }
    }
}
