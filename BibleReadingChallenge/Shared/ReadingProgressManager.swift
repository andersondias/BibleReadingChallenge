//
//  ReadingProgressManager.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

class ReadingProgressManager {

    var numberOfReadChapters: Int {
        return readingProgress.readChapters.compactMap({ $0 }).count
    }
    let readingProgress = ReadingProgress(bible: Bible.shared)

    func readChapter(book: BibleBook, chapter: Int, when: String) {
        let position = Bible.shared.chapterToPosition(book: book, chapter: chapter)
        readingProgress.readChapters[position] = when
    }
}
