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
    let genesis = BooksManager.shared.books[0]
    let exodus = BooksManager.shared.books[1]

    override func setUp() {
        for book in BooksManager.shared.books {
            book.readChapters.removeAll()
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfChapters() {
        XCTAssertEqual(BooksManager.shared.numberOfChapters, 1189)
    }
    
    // Increments the number of read chapters when a chapter is read
    func testReadChapters() {
        BooksManager.shared.readChapter(book: genesis, chapter: 1)
        XCTAssertEqual(BooksManager.shared.numberOfReadChapters, 1)

        BooksManager.shared.readChapter(book: genesis, chapter: 2)
        XCTAssertEqual(BooksManager.shared.numberOfReadChapters, 2)
        
        BooksManager.shared.readChapter(book: exodus, chapter: 3)
        BooksManager.shared.readChapter(book: exodus, chapter: 4)
        XCTAssertEqual(BooksManager.shared.numberOfReadChapters, 4)
    }
    
    // Do not increment counter when the chapter is already read
    func testReadChaptersDoNotIncrementsTwice() {
        BooksManager.shared.readChapter(book: genesis, chapter: 2)
        BooksManager.shared.readChapter(book: genesis, chapter: 2)
        XCTAssertEqual(BooksManager.shared.numberOfReadChapters, 1)
    }
    
    // Decrements the number of read chapters when chapter is unred
    func testUnreadChapter() {
        BooksManager.shared.readChapter(book: genesis, chapter: 1)
        BooksManager.shared.unreadChapter(book: genesis, chapter: 1)
        XCTAssertEqual(BooksManager.shared.numberOfReadChapters, 0)
    }
    
    // Do not decrement already unread chapter
    func testUnreadChapterWhenItIsAlreadyUnread() {
        BooksManager.shared.unreadChapter(book: genesis, chapter: 2)
        XCTAssertEqual(BooksManager.shared.numberOfReadChapters, 0)
    }

}
