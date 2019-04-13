//
//  ChapterButton.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 09/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit

class ChapterButton: UIButton {
    var chapter: Int = 0 {
        didSet {
            replaceAttributeTitle(read: false)
        }
    }
    
    func setRead(_ read: Bool) {
        replaceAttributeTitle(read: read)
    }

    private func replaceAttributeTitle(read: Bool) {
        var attributes = [NSAttributedString.Key : Any]()
        if read {
            attributes[NSAttributedString.Key.strikethroughStyle] = NSUnderlineStyle.thick.rawValue
            attributes[NSAttributedString.Key.strikethroughColor] = UIColor.lightGray
            attributes[NSAttributedString.Key.foregroundColor] = UIColor.lightGray
        }
        let extractedExpr = NSAttributedString(string: "\(chapter)", attributes: attributes)
        setAttributedTitle(extractedExpr, for: .normal)
    }
}
