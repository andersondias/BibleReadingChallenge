//
//  BooksCollectionViewController.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ChapterCollectionViewCell"

class BooksCollectionViewController: UICollectionViewController {
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // TODO: Quando é melhor usar o register? Por que usar?
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)

        // Do any additional setup after loading the view.
        loadSampleBooks()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return books.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books[section].numberOfChapters
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ChapterCollectionViewCell {
            
            cell.chapterNumberButton.book = books[indexPath.section]
            cell.chapterNumberButton.chapter = indexPath.item + 1
            cell.chapterNumberButton.setTitle(String(cell.chapterNumberButton.chapter), for: .normal)
            
            cell.chapterNumberButton.addTarget(self, action: #selector(BooksCollectionViewController.chapterButtonTapped(button:)), for: .touchUpInside)
            
            return cell
        }
    
        return UICollectionViewCell()
    }

    @objc func chapterButtonTapped(button: ChapterButton) {
        if let index = button.book?.readChapters.firstIndex(of: button.chapter) {
            button.book?.readChapters.remove(at: index)
            button.setTitleColor(nil, for: .normal)
        } else {
            button.setTitleColor(UIColor.red, for: .normal)
            button.book?.readChapters.append(button.chapter)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? BookHeaderCollectionReusableView{
            sectionHeader.BookTitleLabel.text = books[indexPath.section].title
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleBooks() {
        guard let genesis = Book(title: "Genesis", numberOfChapters: 50) else {
            fatalError("Unable to instantiate genesis")
        }
        
        guard let exodus = Book(title: "Exodo", numberOfChapters: 40) else {
            fatalError("Unable to instantiate exodus")
        }
        
        guard let filemon = Book(title: "Filemon", numberOfChapters: 1) else {
            fatalError("Unable to instantiate filemon")
        }
        
        books += [genesis, exodus, filemon]
    }

}
