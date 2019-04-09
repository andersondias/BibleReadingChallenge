//
//  DashboardViewController.swift
//  BibleReadingChallenge
//
//  Created by Anderson Dias on 08/04/19.
//  Copyright © 2019 Anderson Dias. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var dashTitle: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    var numberOfChaptersToReadEverDay: Float {
        // Get the current year
        let year = Calendar.current.component(.year, from: Date())
        // Get the first day of next year
        if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
            // Get the last day of the current year
            if let lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear) {
                if let diffInDays = Calendar.current.dateComponents([.day], from: Date(), to: lastOfYear).day {
                    return Float(BooksManager.shared.numberOfUnreadChapters) / Float(diffInDays)
                }
            }
        }
        
        return 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dashTitle.text = "\(BooksManager.shared.numberOfReadChapters) de \(BooksManager.shared.numberOfChapters) capítulos lidos"
        progressLabel.text = "Progresso: \(numberOfChaptersToReadEverDay)"
    }
}
