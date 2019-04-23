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
    @IBOutlet weak var todayDateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dashTitle.text = "\(BooksManager.shared.numberOfChaptersToReadEverDay)"
        todayDateLabel.text = currentDateFormatted()
    }
    
    private
    
    func currentDateFormatted() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        return dateFormatterPrint.string(from: Date())
    }
}
