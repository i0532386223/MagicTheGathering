//
//  MagicTheGatheringTests.swift
//  MagicTheGatheringTests
//
//  Created by Ivan Kramarchuk on 09/09/2019.
//  Copyright © 2019 i0532386223.me. All rights reserved.
//

import XCTest
@testable import MagicTheGathering

class MagicTheGatheringTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCards() {
        networkService.getCards(searchText: nil, completion: { (success, data) -> Void in
            XCTAssert(data?.count ?? 0 > 0)
        })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
