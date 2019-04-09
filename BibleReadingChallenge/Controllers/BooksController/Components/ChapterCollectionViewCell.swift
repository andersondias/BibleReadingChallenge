//
//  ChapterCollectionViewCell.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit

@IBDesignable class ChapterCollectionViewCell: UICollectionViewCell {

    //MARK: Properties

    @IBOutlet weak var chapterNumberButton: ChapterButton!
    var book: Book?
    
    func configure(book: Book, chapter: Int) -> ChapterCollectionViewCell {
        self.book = book

        chapterNumberButton.chapter = chapter
        return self
    }
    
    @IBAction func chapterButtonTapped(button: ChapterButton) {
        if let index = book?.readChapters.firstIndex(of: button.chapter) {
            book?.readChapters.remove(at: index)
            button.setTitleColor(nil, for: .normal)
        } else {
            button.setTitleColor(UIColor.red, for: .normal)
            book?.readChapters.append(button.chapter)
        }
    }
}
