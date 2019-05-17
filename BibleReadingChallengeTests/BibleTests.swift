//
//  BibleTests.swift
//  BibleReadingChallengeTests
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import XCTest

@testable import BibleReadingChallenge

class BibleTests: XCTestCase {
    let genesis = Bible.shared.books[0]
    let exodus = Bible.shared.books[1]
    
    //MARK: Book Class Tests
    func testChapterToPosition() {
        var position = Bible.shared.chapterToPosition(book: genesis, chapter: 1)
        XCTAssertEqual(position, 0)
        
        position = Bible.shared.chapterToPosition(book: genesis, chapter: 2)
        XCTAssertEqual(position, 1)
        
        position = Bible.shared.chapterToPosition(book: genesis, chapter: 50)
        XCTAssertEqual(position, 49)
        
        position = Bible.shared.chapterToPosition(book: exodus, chapter: 1)
        XCTAssertEqual(position, 50)
        
        position = Bible.shared.chapterToPosition(book: exodus, chapter: 20)
        XCTAssertEqual(position, 69)
    }
}
