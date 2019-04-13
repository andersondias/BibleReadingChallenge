//
//  BookTests.swift
//  BibleReadingChallengeTests
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import XCTest

@testable import BibleReadingChallenge

class BookTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Book Class Tests
    
    // Confirm that the Book initializer returns a Book object when passed valid parameters.
    func testBookInitializationSucceeds() {
        // One chapter book
        let oneChapterBook = Book.init(title: "Filemon", numberOfChapters: 1, readChapters: [])
        XCTAssertNotNil(oneChapterBook)
        
        // Huge book
        let longChapterBook = Book.init(title: "Mateus", numberOfChapters: 28, readChapters: [])
        XCTAssertNotNil(longChapterBook)
    }
    
    // Confirm that the Book initialier returns nil when passed a negative rating or an empty name.
    func testBookInitializationFails() {
        // Zero chapters book
        let zeroChapterBook = Book.init(title: "Filemon", numberOfChapters: 0, readChapters: [])
        XCTAssertNil(zeroChapterBook)
        
        // Empty Title
        let emptyTitleBook = Book.init(title: "", numberOfChapters: 1, readChapters: [])
        XCTAssertNil(emptyTitleBook)
    }

}
