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
            setTitle("\(chapter)", for: .normal)
        }
    }
}
