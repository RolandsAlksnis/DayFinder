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
        let calendar = Calendar.current
        
        // DateComponents()
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
            warningAlert(withTitle: "Input error!", withMessage: "Date Text Fields can't be empty")
            return
        }
        // Anything typed will be assigned to day! let day = dayTextField.text
        // dateComponents.day = dayTextField.text
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        // calendar.date(from: dateComponents
        guard let date = calendar.date(from: dateComponents) else { return }
        
        // DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                
                // resultLabel.text = result
                resultLabel.text = capitalizedWeekday
            } else {
                // Alert
                warningAlert(withTitle: "Wrong Date !", withMessage: "Please enter the correct date !")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearAllTextFields()
        }
        // From entered Text Fields, display the date to resultLabel
        // resultLabel.text = result
    }
    
    func clearAllTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of the week, inside your finder"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func warningAlert(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK !", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
    }// warning Popup
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinder" {
            
        // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
        // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps to find exact weekday for given date"
        }
    }
    
    
}// end class

