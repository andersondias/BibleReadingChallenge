//
//  BooksManagerTests.swift
//  BibleReadingChallengeTests
//
//  Created by Anderson Dias on 13/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import XCTest
@testable import BibleReadingChallenge

class BooksManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfChapters() {
        XCTAssertEqual(BooksManager.shared.numberOfChapters, 1189)
    }

}
