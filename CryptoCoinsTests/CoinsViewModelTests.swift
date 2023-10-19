//
//  CoinsViewModelTests.swift
//  CryptoCoinsTests
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import XCTest
@testable import CryptoCoins

final class CoinsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCoins() async throws {
        let sut = CoinsViewModel(coinService: CoinsServiceMockable())
        await sut.fetchCoins()
        XCTAssertEqual(sut.coins.count, 100)
        XCTAssertEqual(sut.coins.first?.name, "Bitcoin")
        XCTAssertEqual(sut.coins.first?.currentPrice, 27549.0)
    }
}
