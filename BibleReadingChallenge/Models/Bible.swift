//
//  Bible.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 17/05/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

class Bible {
    static let shared = Bible()

    var books: [BibleBook]
    var numberOfChapters: Int {
        return books.map({$0.numberOfChapters}).reduce(0, +)
    }

    func chapterToPosition(book: BibleBook, chapter: Int) -> Int {
        var index = -1
        for currentBook in books {
            if currentBook.title != book.title {
                index += currentBook.numberOfChapters
            } else {
                index += chapter
                break
            }
        }

        return index
    }
    
    private init() {
        self.books = [
            BibleBook(title: "Gênesis", abbreviation: "Gn", numberOfChapters: 50),
            BibleBook(title: "Êxodo", abbreviation: "Êx", numberOfChapters: 40),
            BibleBook(title: "Levítico", abbreviation: "Lv", numberOfChapters: 27),
            BibleBook(title: "Números", abbreviation: "Nm", numberOfChapters: 36),
            BibleBook(title: "Deuteronômio", abbreviation: "Dt", numberOfChapters: 34),
            BibleBook(title: "Josué", abbreviation: "Js", numberOfChapters: 24),
            BibleBook(title: "Juízes", abbreviation: "Jz", numberOfChapters: 21),
            BibleBook(title: "Rute", abbreviation: "Rt", numberOfChapters: 4),
            BibleBook(title: "1 Samuel", abbreviation: "1Sm", numberOfChapters: 31),
            BibleBook(title: "2 Samuel", abbreviation: "2Sm", numberOfChapters: 24),
            BibleBook(title: "1 Reis", abbreviation: "1Rs", numberOfChapters: 22),
            BibleBook(title: "2 Reis", abbreviation: "2Rs", numberOfChapters: 25),
            BibleBook(title: "1 Crônicas", abbreviation: "1Cr", numberOfChapters: 29),
            BibleBook(title: "2 Crônicas", abbreviation: "2Cr", numberOfChapters: 36),
            BibleBook(title: "Esdras", abbreviation: "Ed", numberOfChapters: 10),
            BibleBook(title: "Neemias", abbreviation: "Ne", numberOfChapters: 13),
            BibleBook(title: "Ester", abbreviation: "Et", numberOfChapters: 10),
            BibleBook(title: "Jó", abbreviation: "Jó", numberOfChapters: 42),
            BibleBook(title: "Salmos", abbreviation: "Sl", numberOfChapters: 150),
            BibleBook(title: "Provérbios", abbreviation: "Pv", numberOfChapters: 31),
            BibleBook(title: "Eclesiastes", abbreviation: "Ec", numberOfChapters: 12),
            BibleBook(title: "Cantares", abbreviation: "Ct", numberOfChapters: 8),
            BibleBook(title: "Isaías", abbreviation: "Is", numberOfChapters: 66),
            BibleBook(title: "Jeremias", abbreviation: "Jr", numberOfChapters: 52),
            BibleBook(title: "Lamentações", abbreviation: "Lm", numberOfChapters: 5),
            BibleBook(title: "Ezequiel", abbreviation: "Ez", numberOfChapters: 48),
            BibleBook(title: "Daniel", abbreviation: "Dn", numberOfChapters: 12),
            BibleBook(title: "Oseias", abbreviation: "Os", numberOfChapters: 14),
            BibleBook(title: "Joel", abbreviation: "Jl", numberOfChapters: 3),
            BibleBook(title: "Amós", abbreviation: "Am", numberOfChapters: 9),
            BibleBook(title: "Obadias", abbreviation: "Ob", numberOfChapters: 1),
            BibleBook(title: "Jonas", abbreviation: "Jn", numberOfChapters: 4),
            BibleBook(title: "Miqueias", abbreviation: "Mq", numberOfChapters: 7),
            BibleBook(title: "Naum", abbreviation: "Na", numberOfChapters: 3),
            BibleBook(title: "Habacuque", abbreviation: "Hc", numberOfChapters: 3),
            BibleBook(title: "Sofonias", abbreviation: "Sf", numberOfChapters: 3),
            BibleBook(title: "Ageu", abbreviation: "Ag", numberOfChapters: 2),
            BibleBook(title: "Zacarias", abbreviation: "Zc", numberOfChapters: 14),
            BibleBook(title: "Malaquias", abbreviation: "Ml", numberOfChapters: 4),
            BibleBook(title: "Mateus", abbreviation: "Mt", numberOfChapters: 28),
            BibleBook(title: "Marcos", abbreviation: "Mc", numberOfChapters: 16),
            BibleBook(title: "Lucas", abbreviation: "Lc", numberOfChapters: 24),
            BibleBook(title: "João", abbreviation: "Jo", numberOfChapters: 21),
            BibleBook(title: "Atos dos Apóstolos", abbreviation: "At", numberOfChapters: 28),
            BibleBook(title: "Romanos", abbreviation: "Rm", numberOfChapters: 16),
            BibleBook(title: "1 Coríntios", abbreviation: "1Co", numberOfChapters: 16),
            BibleBook(title: "2 Coríntios", abbreviation: "2Co", numberOfChapters: 13),
            BibleBook(title: "Gálatas", abbreviation: "Gl", numberOfChapters: 6),
            BibleBook(title: "Efésios", abbreviation: "Ef", numberOfChapters: 6),
            BibleBook(title: "Filipenses", abbreviation: "Fp", numberOfChapters: 4),
            BibleBook(title: "Colossenses", abbreviation: "Cl", numberOfChapters: 4),
            BibleBook(title: "1 Tessalonicenses", abbreviation: "1Ts", numberOfChapters: 5),
            BibleBook(title: "2 Tessalonicenses", abbreviation: "2Ts", numberOfChapters: 3),
            BibleBook(title: "1 Timóteo", abbreviation: "1Tm", numberOfChapters: 6),
            BibleBook(title: "2 Timóteo", abbreviation: "2Tm", numberOfChapters: 4),
            BibleBook(title: "Tito", abbreviation: "Tt", numberOfChapters: 3),
            BibleBook(title: "Filemom", abbreviation: "Fm", numberOfChapters: 1),
            BibleBook(title: "Hebreus", abbreviation: "Hb", numberOfChapters: 13),
            BibleBook(title: "Tiago", abbreviation: "Tg", numberOfChapters: 5),
            BibleBook(title: "1 Pedro", abbreviation: "1Pe", numberOfChapters: 5),
            BibleBook(title: "2 Pedro", abbreviation: "2Pe", numberOfChapters: 3),
            BibleBook(title: "1 João", abbreviation: "1Jo", numberOfChapters: 5),
            BibleBook(title: "2 João", abbreviation: "2Jo", numberOfChapters: 1),
            BibleBook(title: "3 João", abbreviation: "3Jo", numberOfChapters: 1),
            BibleBook(title: "Judas", abbreviation: "Jd", numberOfChapters: 1),
            BibleBook(title: "Apocalipse", abbreviation: "Ap", numberOfChapters: 22)
            ] as! [BibleBook]
    }
}
