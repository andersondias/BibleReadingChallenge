//
//  BooksManager.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//
import Foundation
import os.log

class BooksManager {
    static let shared = BooksManager()

    var books = [Book]()
    static let booksAbbreviations = ["Gn", "Êx", "Lv", "Nm", "Dt", "Js", "Jz", "Rt", "1Sm", "2Sm", "1Rs", "2Rs", "1Cr", "2Cr", "Ed", "Ne", "Et", "Jó", "Sl", "Pv", "Ec", "Ct", "Is", "Jr", "Lm", "Ez", "Dn", "Os", "Jl", "Am", "Ob", "Jn", "Mq", "Na", "Hc", "Sf", "Ag", "Zc", "Ml", "Mt", "Mc", "Lc", "Jo", "At", "Rm", "1Co", "2Co", "Gl", "Ef", "Fp", "Cl", "1Ts", "2Ts", "1Tm", "2Tm", "Tt", "Fm", "Hb", "Tg", "1Pe", "2Pe", "1Jo", "2Jo", "3Jo", "Jd", "Ap"]

    var numberOfChapters: Int {
        return books.reduce(0) { (total, book) in
            return total + book.numberOfChapters
        }
    }

    var numberOfReadChapters: Int {
        return books.reduce(0) { (total, book) in
            return total + book.readChapters.count
        }
    }

    var numberOfUnreadChapters: Int {
        return numberOfChapters - numberOfReadChapters
    }
    
    var numberOfChaptersToReadEverDay: Int {
        var numberOfDays = numberOfDaysInFloat
        numberOfDays.round(FloatingPointRoundingRule.up)
        return Int(numberOfDays)
    }
    
    var numberOfDaysInFloat: Float {
        return Float(numberOfUnreadChapters) / Float(daysTilTheEndOfYear)
    }
    
    func readChapter(book: Book, chapter: Int) {
        if book.readChapters.firstIndex(of: chapter) == nil {
            book.readChapters.append(chapter)
            update()
        }
    }

    func unreadChapter(book: Book, chapter: Int) {
        if let index = book.readChapters.firstIndex(of: chapter) {
            book.readChapters.remove(at: index)
            update()
        }
    }
    
    private func update() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(books, toFile: Book.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Books successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save books...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadBooks() -> [Book]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Book.ArchiveURL.path) as? [Book]
    }
    
    private func loadSampleBooks() -> [Book] {
        return [
            Book(title: "Gênesis", numberOfChapters: 50, readChapters: [])!,
            Book(title: "Êxodo", numberOfChapters: 40, readChapters: []),
            Book(title: "Levítico", numberOfChapters: 27, readChapters: []),
            Book(title: "Números", numberOfChapters: 36, readChapters: []),
            Book(title: "Deuteronômio", numberOfChapters: 34, readChapters: []),
            Book(title: "Josué", numberOfChapters: 24, readChapters: []),
            Book(title: "Juízes", numberOfChapters: 21, readChapters: []),
            Book(title: "Rute", numberOfChapters: 4, readChapters: []),
            Book(title: "1 Samuel", numberOfChapters: 31, readChapters: []),
            Book(title: "2 Samuel", numberOfChapters: 24, readChapters: []),
            Book(title: "1 Reis", numberOfChapters: 22, readChapters: []),
            Book(title: "2 Reis", numberOfChapters: 25, readChapters: []),
            Book(title: "1 Crônicas", numberOfChapters: 29, readChapters: []),
            Book(title: "2 Crônicas", numberOfChapters: 36, readChapters: []),
            Book(title: "Esdras", numberOfChapters: 10, readChapters: []),
            Book(title: "Neemias", numberOfChapters: 13, readChapters: []),
            Book(title: "Ester", numberOfChapters: 10, readChapters: []),
            Book(title: "Jó", numberOfChapters: 42, readChapters: []),
            Book(title: "Salmos", numberOfChapters: 150, readChapters: []),
            Book(title: "Provérbios", numberOfChapters: 31, readChapters: []),
            Book(title: "Eclesiastes", numberOfChapters: 12, readChapters: []),
            Book(title: "Cantares", numberOfChapters: 8, readChapters: []),
            Book(title: "Isaías", numberOfChapters: 66, readChapters: []),
            Book(title: "Jeremias", numberOfChapters: 52, readChapters: []),
            Book(title: "Lamentações", numberOfChapters: 5, readChapters: []),
            Book(title: "Ezequiel", numberOfChapters: 48, readChapters: []),
            Book(title: "Daniel", numberOfChapters: 12, readChapters: []),
            Book(title: "Oseias", numberOfChapters: 14, readChapters: []),
            Book(title: "Joel", numberOfChapters: 3, readChapters: []),
            Book(title: "Amós", numberOfChapters: 9, readChapters: []),
            Book(title: "Obadias", numberOfChapters: 1, readChapters: []),
            Book(title: "Jonas", numberOfChapters: 4, readChapters: []),
            Book(title: "Miqueias", numberOfChapters: 7, readChapters: []),
            Book(title: "Naum", numberOfChapters: 3, readChapters: []),
            Book(title: "Habacuque", numberOfChapters: 3, readChapters: []),
            Book(title: "Sofonias", numberOfChapters: 3, readChapters: []),
            Book(title: "Ageu", numberOfChapters: 2, readChapters: []),
            Book(title: "Zacarias", numberOfChapters: 14, readChapters: []),
            Book(title: "Malaquias", numberOfChapters: 4, readChapters: []),
            Book(title: "Mateus", numberOfChapters: 28, readChapters: []),
            Book(title: "Marcos", numberOfChapters: 16, readChapters: []),
            Book(title: "Lucas", numberOfChapters: 24, readChapters: []),
            Book(title: "João", numberOfChapters: 21, readChapters: []),
            Book(title: "Atos dos Apóstolos", numberOfChapters: 28, readChapters: []),
            Book(title: "Romanos", numberOfChapters: 16, readChapters: []),
            Book(title: "1 Coríntios", numberOfChapters: 16, readChapters: []),
            Book(title: "2 Coríntios", numberOfChapters: 13, readChapters: []),
            Book(title: "Gálatas", numberOfChapters: 6, readChapters: []),
            Book(title: "Efésios", numberOfChapters: 6, readChapters: []),
            Book(title: "Filipenses", numberOfChapters: 4, readChapters: []),
            Book(title: "Colossenses", numberOfChapters: 4, readChapters: []),
            Book(title: "1 Tessalonicenses", numberOfChapters: 5, readChapters: []),
            Book(title: "2 Tessalonicenses", numberOfChapters: 3, readChapters: []),
            Book(title: "1 Timóteo", numberOfChapters: 6, readChapters: []),
            Book(title: "2 Timóteo", numberOfChapters: 4, readChapters: []),
            Book(title: "Tito", numberOfChapters: 3, readChapters: []),
            Book(title: "Filemom", numberOfChapters: 1, readChapters: []),
            Book(title: "Hebreus", numberOfChapters: 13, readChapters: []),
            Book(title: "Tiago", numberOfChapters: 5, readChapters: []),
            Book(title: "1 Pedro", numberOfChapters: 5, readChapters: []),
            Book(title: "2 Pedro", numberOfChapters: 3, readChapters: []),
            Book(title: "1 João", numberOfChapters: 5, readChapters: []),
            Book(title: "2 João", numberOfChapters: 1, readChapters: []),
            Book(title: "3 João", numberOfChapters: 1, readChapters: []),
            Book(title: "Judas", numberOfChapters: 1, readChapters: []),
            Book(title: "Apocalipse", numberOfChapters: 22, readChapters: [])
        ] as! [Book]
    }

    private init() {
        if let savedBooks = loadBooks() {
            books = savedBooks
        }
        else {
            books = loadSampleBooks()
            update()
        }
    }
    
    private var daysTilTheEndOfYear: Int {
        // Get the current year
        let year = Calendar.current.component(.year, from: Date())
        
        // Get the first day of next year
        if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
            // Get the last day of the current year
            if let lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear) {
                if let diffInDays = Calendar.current.dateComponents([.day], from: Date(), to: lastOfYear).day {
                    return diffInDays
                }
            }
        }
        
        return 365
    }
}
