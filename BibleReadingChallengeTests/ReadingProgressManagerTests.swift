//
//  ReadingProgressManagerTests.swift
//  BibleReadingChallengeTests
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import XCTest
@testable import BibleReadingChallenge

class ReadingProgressManagerTests: XCTestCase {
    let genesis = Bible.shared.books[0]
    let exodus = Bible.shared.books[1]

    func testReadChapters() {
        let manager = ReadingProgressManager()
        
        manager.readChapter(book: genesis, chapter: 1, when: "20190516")
        manager.readChapter(book: genesis, chapter: 1, when: "20190517")
        XCTAssertEqual(manager.numberOfReadChapters, 1)
        
        manager.readChapter(book: genesis, chapter: 2, when: "20190517")
        XCTAssertEqual(manager.numberOfReadChapters, 2)
        
        manager.readChapter(book: exodus, chapter: 3, when: "20190517")
        manager.readChapter(book: exodus, chapter: 4, when: "20190517")
        XCTAssertEqual(manager.numberOfReadChapters, 4)
    }

    func testUnreadChapters() {
        let manager = ReadingProgressManager()
        
        manager.readChapter(book: genesis, chapter: 1, when: "20190516")
        XCTAssertEqual(manager.numberOfReadChapters, 1)
        manager.unreadChapter(book: genesis, chapter: 1)
        XCTAssertEqual(manager.numberOfReadChapters, 0)
    }
}
