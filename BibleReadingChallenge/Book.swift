//
//  Book.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 08/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit

class Book {

    //MARK: Properties

    var title: String
    var numberOfChapters: Int
 
    //MARK: Initialization
    
    init?(title: String, numberOfChapters: Int) {
        if title.isEmpty || numberOfChapters < 1  {
            return nil
        }
        self.title = title
        self.numberOfChapters = numberOfChapters
    }
}
