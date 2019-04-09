//
//  BooksManager.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

class BooksManager {
    static let shared = BooksManager()
    var books = [Book]()
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
    
    private init() {
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
