//
//  ReadingProgress.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

class ReadingProgress {
    var readChapters: [String?]
    
    init(bible: Bible) {
        self.readChapters = [String?](repeating: nil, count: bible.numberOfChapters)
    }
}
