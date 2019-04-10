//
//  BookHeaderCollectionReusableView.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit

class BookHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var BookTitleLabel: UILabel!
    @IBOutlet weak var markAllButton: UIButton!

    var book: Book?

    @IBAction func markAllClicked(_ sender: Any) {
        if book == nil {
            return
        }

        for chapter in 1...book!.numberOfChapters {
            BooksManager.shared.readChapter(book: book!, chapter: chapter)
        }
    }

    func configure(book: Book) -> BookHeaderCollectionReusableView {
        self.book = book

        BookTitleLabel.text = book.title
        return self
    }
}
