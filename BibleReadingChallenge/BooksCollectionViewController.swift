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
        books = [
            Book(title: "Gênesis", numberOfChapters: 50),
            Book(title: "Êxodo", numberOfChapters: 40),
            Book(title: "Levítico", numberOfChapters: 27),
            Book(title: "Números", numberOfChapters: 36),
            Book(title: "Deuteronômio", numberOfChapters: 34),
            Book(title: "Josué", numberOfChapters: 24),
            Book(title: "Juízes", numberOfChapters: 21),
            Book(title: "Rute", numberOfChapters: 4),
            Book(title: "1 Samuel", numberOfChapters: 31),
            Book(title: "2 Samuel", numberOfChapters: 24),
            Book(title: "1 Reis", numberOfChapters: 22),
            Book(title: "2 Reis", numberOfChapters: 25),
            Book(title: "1 Crônicas", numberOfChapters: 29),
            Book(title: "2 Crônicas", numberOfChapters: 36),
            Book(title: "Esdras", numberOfChapters: 10),
            Book(title: "Neemias", numberOfChapters: 13),
            Book(title: "Ester", numberOfChapters: 10),
            Book(title: "Jó", numberOfChapters: 42),
            Book(title: "Salmos", numberOfChapters: 150),
            Book(title: "Provérbios", numberOfChapters: 31),
            Book(title: "Eclesiastes", numberOfChapters: 12),
            Book(title: "Cantares", numberOfChapters: 8),
            Book(title: "Isaías", numberOfChapters: 66),
            Book(title: "Jeremias", numberOfChapters: 52),
            Book(title: "Lamentações", numberOfChapters: 5),
            Book(title: "Ezequiel", numberOfChapters: 48),
            Book(title: "Daniel", numberOfChapters: 12),
            Book(title: "Oseias", numberOfChapters: 14),
            Book(title: "Joel", numberOfChapters: 3),
            Book(title: "Amós", numberOfChapters: 9),
            Book(title: "Obadias", numberOfChapters: 1),
            Book(title: "Jonas", numberOfChapters: 4),
            Book(title: "Miqueias", numberOfChapters: 7),
            Book(title: "Naum", numberOfChapters: 3),
            Book(title: "Habacuque", numberOfChapters: 3),
            Book(title: "Sofonias", numberOfChapters: 3),
            Book(title: "Ageu", numberOfChapters: 2),
            Book(title: "Zacarias", numberOfChapters: 14),
            Book(title: "Malaquias", numberOfChapters: 4),
            Book(title: "Mateus", numberOfChapters: 28),
            Book(title: "Marcos", numberOfChapters: 16),
            Book(title: "Lucas", numberOfChapters: 24),
            Book(title: "João", numberOfChapters: 21),
            Book(title: "Atos dos Apóstolos", numberOfChapters: 28),
            Book(title: "Romanos", numberOfChapters: 16),
            Book(title: "1 Coríntios", numberOfChapters: 16),
            Book(title: "2 Coríntios", numberOfChapters: 13),
            Book(title: "Gálatas", numberOfChapters: 6),
            Book(title: "Efésios", numberOfChapters: 6),
            Book(title: "Filipenses", numberOfChapters: 4),
            Book(title: "Colossenses", numberOfChapters: 4),
            Book(title: "1 Tessalonicenses", numberOfChapters: 5),
            Book(title: "2 Tessalonicenses", numberOfChapters: 3),
            Book(title: "1 Timóteo", numberOfChapters: 6),
            Book(title: "2 Timóteo", numberOfChapters: 4),
            Book(title: "Tito", numberOfChapters: 3),
            Book(title: "Filemom", numberOfChapters: 1),
            Book(title: "Hebreus", numberOfChapters: 13),
            Book(title: "Tiago", numberOfChapters: 5),
            Book(title: "1 Pedro", numberOfChapters: 5),
            Book(title: "2 Pedro", numberOfChapters: 3),
            Book(title: "1 João", numberOfChapters: 5),
            Book(title: "2 João", numberOfChapters: 1),
            Book(title: "3 João", numberOfChapters: 1),
            Book(title: "Judas", numberOfChapters: 1),
            Book(title: "Apocalipse", numberOfChapters: 22)
            ] as! [Book]
    }

}
