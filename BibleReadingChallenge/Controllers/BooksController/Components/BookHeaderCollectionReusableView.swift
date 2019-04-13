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
    var parentCollectionView: UICollectionView?

    @IBAction func markAllClicked(_ sender: Any) {
        if book == nil {
            return
        }

        for chapter in 1...book!.numberOfChapters {
            BooksManager.shared.readChapter(book: book!, chapter: chapter)
            parentCollectionView?.reloadData()
        }
    }

    func configure(book: Book, collectionView: UICollectionView) -> BookHeaderCollectionReusableView {
        self.book = book
        self.parentCollectionView = collectionView

        BookTitleLabel.text = book.title
        if book.readChapters.count == book.numberOfChapters {
            markAllButton.isEnabled = false
        } else {
            markAllButton.isEnabled = true
        }
        return self
    }
}
