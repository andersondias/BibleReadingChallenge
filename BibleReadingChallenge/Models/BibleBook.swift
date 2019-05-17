//
//  BibleBook.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

class BibleBook {
    var title: String
    var abbreviation: String
    var numberOfChapters: Int
    
    init?(title: String, abbreviation: String, numberOfChapters: Int) {
        if title.isEmpty || abbreviation.isEmpty || numberOfChapters < 1  {
            return nil
        }
        
        self.title = title
        self.abbreviation = abbreviation
        self.numberOfChapters = numberOfChapters
    }
}
