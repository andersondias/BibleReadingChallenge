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

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //MARK: Book Class Tests
    
    // Confirm that the Book initializer returns a Book object when passed valid parameters.
    func testBookInitializationSucceeds() {
        // One chapter book
        let oneChapterBook = Book.init(title: "Filemon", numberOfChapters: 1)
        XCTAssertNotNil(oneChapterBook)
        
        // Huge book
        let longChapterBook = Book.init(title: "Mateus", numberOfChapters: 28)
        XCTAssertNotNil(longChapterBook)
    }
    
    // Confirm that the Book initialier returns nil when passed a negative rating or an empty name.
    func testBookInitializationFails() {
        // Zero chapters book
        let zeroChapterBook = Book.init(title: "Filemon", numberOfChapters: 0)
        XCTAssertNil(zeroChapterBook)
        
        // Empty Title
        let emptyTitleBook = Book.init(title: "", numberOfChapters: 1)
        XCTAssertNil(emptyTitleBook)
    }

}
