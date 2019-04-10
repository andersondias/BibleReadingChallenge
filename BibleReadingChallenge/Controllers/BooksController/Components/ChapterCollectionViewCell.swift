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
        changeButtonState(read: book.chapterIsRead(chapter: chapter))

        return self
    }
    
    func changeButtonState(read: Bool) {
        if read {
            chapterNumberButton.setTitleColor(UIColor.green, for: .normal)
        } else {
            chapterNumberButton.setTitleColor(nil, for: .normal)
        }
    }

    @IBAction func chapterButtonTapped(button: ChapterButton) {
        if (book?.chapterIsRead(chapter: button.chapter))! {
            BooksManager.shared.unreadChapter(book: book!, chapter: button.chapter)
            changeButtonState(read: false)
        } else {
            changeButtonState(read: true)
            BooksManager.shared.readChapter(book: book!, chapter: button.chapter)
        }
    }
}
