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
    var chapter: Int = 0 {
        didSet {
            chapterNumberButton.chapter = chapter
        }
    }
    
    var read: Bool? {
        didSet {
            chapterNumberButton.setRead(read!)
        }
    }
    
    func configure(book: Book, chapter: Int) -> ChapterCollectionViewCell {
        self.book = book
        self.chapter = chapter
        self.read = book.chapterIsRead(chapter)

        return self
    }

    @IBAction func chapterButtonTapped(button: ChapterButton) {
        self.read = !(read ?? false)
        updateBooks()
    }
    
    private func updateBooks() {
        if read! {
            BooksManager.shared.readChapter(book: book!, chapter: chapter)
        } else {
            BooksManager.shared.unreadChapter(book: book!, chapter: chapter)
        }
    }
}
