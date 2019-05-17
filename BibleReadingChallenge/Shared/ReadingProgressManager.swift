//
//  ReadingProgressManager.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

class ReadingProgressManager {

    var numberOfReadChapters: Int {
        return readingProgress.numberOfReadChapters
    }

    let readingProgress = ReadingProgress(bible: Bible.shared)

    func readChapter(book: BibleBook, chapter: Int, when: String) {
        let p = position(book: book, chapter: chapter)
        readingProgress.readChapters[p] = when
    }
    
    func unreadChapter(book: BibleBook, chapter: Int) {
        let p = position(book: book, chapter: chapter)
        readingProgress.readChapters[p] = nil
    }
    
    private
    
    func position(book: BibleBook, chapter: Int) -> Int {
        return Bible.shared.chapterToPosition(book: book, chapter: chapter)
    }
}
