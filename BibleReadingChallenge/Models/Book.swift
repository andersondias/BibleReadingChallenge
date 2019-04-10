//
//  Book.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 08/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit
import os.log

class Book: NSObject, NSCoding {
    //MARK: Properties

    var title: String
    var numberOfChapters: Int
    var readChapters: [Int] = []
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("books")
    
    //MARK: Types
    
    struct PropertyKey {
        static let title = "title"
        static let numberOfChapters = "numberOfChapters"
        static let readChapters = "readChapters"
    }
 
    //MARK: Initialization
    
    init?(title: String, numberOfChapters: Int, readChapters: [Int]) {
        if title.isEmpty || numberOfChapters < 1  {
            return nil
        }
        self.title = title
        self.numberOfChapters = numberOfChapters
        self.readChapters = readChapters
    }
    
    //MARK: NSCoding
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String else {
            os_log("Unable to decode the title for a Book object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let numberOfChapters = aDecoder.decodeInteger(forKey: PropertyKey.numberOfChapters)
        
        guard let readChapters = aDecoder.decodeObject(forKey: PropertyKey.readChapters) as? [Int] else {
            os_log("Unable to decode the readChapters for a Book object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(title: title, numberOfChapters: numberOfChapters, readChapters: readChapters)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(numberOfChapters, forKey: PropertyKey.numberOfChapters)
        aCoder.encode(readChapters, forKey: PropertyKey.readChapters)
    }
    
    func chapterIsRead(chapter: Int) -> Bool {
        return readChapters.firstIndex(of: chapter) != nil
    }
}
