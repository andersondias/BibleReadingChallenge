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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dashTitle.text = "\(BooksManager.shared.numberOfReadChapters)"
    }


}

