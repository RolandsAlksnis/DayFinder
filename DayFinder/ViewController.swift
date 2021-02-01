//
//  ViewController.swift
//  DayFinder
//
//  Created by rolands.alksins on 01/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewControllet first launch")
    }

    @IBAction func findWeekdayTapped(_ sender: Any) {
        // calendar
        // DateComponents()
        // Anything typed will be assigned to day! let day = dayTextField.text
        // dateComponents.day = dayTextField.text
        // calendar.date(from: dateComponents
        
        // DateFormatter()
        
        // From entered Text Fields, display the date to resultLabel
        
        // resultLabel.text = result
    }
    
}

