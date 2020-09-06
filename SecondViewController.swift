//
//  SecondViewController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/19/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit
import Foundation //for foramatting



class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let leftUnitPickerData = [" ","MPa","atm","m2","cm2","ft3","acre","m3","gal","degR","degC","Kelvin","mPa-s","kg","g/cc","ppg"]
    let rightUnitPickerData = [" ","psi","ft2","Darcy","bbl","degF","cP","lbm","lbm/ft3"]
    let leftPicker = UIPickerView()
    let rightPicker = UIPickerView()
    
//    left picker-----------------------------------------

    func numberOfComponents(in leftpickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return leftUnitPickerData.count
        case 2:
            return rightUnitPickerData.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return leftUnitPickerData[row]
        case 2:
            return rightUnitPickerData[row]
        default:
            return "error"
        }
    }
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       switch pickerView.tag {
       case 1:
        unitDisplayLeft.text = leftUnitPickerData[row]
        unitDisplayLeft.resignFirstResponder()
       case 2:
        unitDisplayRight.text = rightUnitPickerData[row]
        unitDisplayRight.resignFirstResponder()
       default:
           return
       }
    }


    @IBOutlet weak var massEntry: UITextField!
    @IBOutlet weak var unitDisplayLeft: UITextField!
    @IBOutlet weak var unitDisplayRight: UITextField!
    @IBOutlet weak var output: UILabel!
    
    
    @IBOutlet weak var leftUnitSelect: UIPickerView!
    @IBOutlet weak var rightUnitSelect: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Do any additional setup after loading the view.
        let BHurl = URL(string: "https://rigcount.bakerhughes.com/rig-count-overview")!
        let task = URLSession.shared.dataTask(with: BHurl) { (data, resp, error) in
            guard data == data else {
                print("data was nil")
                return
            }
            
            guard let htmlString = String(data: data!, encoding: String.Encoding.utf8) else {
                print("cant cast data to string")
                return
            }
            print(htmlString)
        }
        
        task.resume()
        
        
//        prefill in unit labels
        unitDisplayLeft.placeholder = "units"
        unitDisplayRight.placeholder = "field units"
        unitDisplayLeft.textAlignment = .center
        unitDisplayRight.textAlignment = .center
        
//        needed settings
        leftUnitSelect.dataSource = self
        leftUnitSelect.delegate = self
        leftUnitSelect.tag = 1
        rightUnitSelect.dataSource  = self
        rightUnitSelect.delegate = self
        rightUnitSelect.tag = 2
        
//         writes whats on the left picker to the left unit display
        unitDisplayLeft.inputView = leftPicker
//         writes whats on the right picker to the right unit display

        unitDisplayRight.inputView = rightPicker
        
        
//        needed settings
        massEntry.delegate = self
        
    }

    @IBAction func execute(_ sender: Any) {
//        ! exclamation means xcode looks inseide text field
        let leftUnit =  unitDisplayLeft.text
        let rightUnit = unitDisplayRight.text
        let calc1 = Float(massEntry.text!)
        
        if  (leftUnit == "MPa" && rightUnit == "psi") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(145.04))
                output.text = "\(out1)"
            }
            }
        else if (leftUnit == "MPa" && rightUnit != "psi") {
            
            let out1 = "check units"
                output.text = out1
        }
// ----------------------------
        else if (leftUnit == "atm" && rightUnit == "psi") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(14.70))
                output.text = "\(out1)"
        }
        }
        else if (leftUnit == "atm" && rightUnit != "psi") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "m2" && rightUnit == "ft2") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(10.7639))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "m2" && rightUnit == "Darcy") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(1013249965828.1448))
            let Fout1 = String(format: "%5.2e" ,out1)
            output.text = Fout1
            }
        }
        else if (leftUnit == "m2" && rightUnit != "ft2") || (leftUnit == "m2" && rightUnit != "Darcy") {
            
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "cm2" && rightUnit == "Darcy") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(101325335.4))
            let Fout1 = String(format: "%5.2e" ,out1)
            output.text = Fout1
        }
        }
        else if (leftUnit == "cm2" && rightUnit == "ft2") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(0.001076))
            output.text = "\(out1)"
        }
        }
        else if (leftUnit == "cm2" && rightUnit != "ft2" ) || (leftUnit == "cm2" && rightUnit != "Darcy") {
            let out1 = "check units"
            output.text = out1
        }
        
// ----------------------------
        else if (leftUnit == "acre" && rightUnit == "ft2") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
                   let out1 = Float(calc1!*(43560))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "acre" && rightUnit != "ft2") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "ft3" && rightUnit == "bbl") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!/(5.615))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "ft3" && rightUnit != "bbl") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "m3" && rightUnit == "bbl") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(6.2898))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "m3" && rightUnit != "bbl") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "gal" && rightUnit == "bbl") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(0.02381))
                   output.text = "\(out1)"
               }
        }
            
        else if (leftUnit == "gal" && rightUnit != "bbl") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "degR" && rightUnit == "degF") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!-(459.67))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "degR" && rightUnit != "degF") {
            let out1 = "check units"
            output.text = out1
            }
// ----------------------------
        else if (leftUnit == "Kelvin" && rightUnit == "degF") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float((calc1!-273.15)*(9/5)+32)
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "Kelvin" && rightUnit != "degF") {
            let out1 = "check units"
            output.text = out1
            }
// ----------------------------
        else if (leftUnit == "degC" && rightUnit == "degF") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
                   let out1 = Float(calc1!*(9/5)+32)
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "degC" && rightUnit != "degF") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "mPa-s" && rightUnit == "cP") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
                   let out1 = Float(calc1!*(1))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "mPa-s" && rightUnit != "cP") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "kg" && rightUnit == "lbm") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(2.20462))
                   output.text = "\(out1)"
               }
        }
        else if (leftUnit == "kg" && rightUnit != "lbm") {
            let out1 = "check units"
            output.text = out1
            }
// ----------------------------
        else if (leftUnit == "g/cc" && rightUnit == "lbm/ft3") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(62.428))
            output.text = "\(out1)"
        }
        }
        else if (leftUnit == "g/cc" && rightUnit != "lbm/ft3") {
            let out1 = "check units"
            output.text = out1
        }
// ----------------------------
        else if (leftUnit == "ppg" && rightUnit == "lbm/ft3") {
            if massEntry.text == "" {
                output.text = "Input"
            }
            else{
            let out1 = Float(calc1!*(7.48))
            output.text = "\(out1)"
        }
        }
        else if (leftUnit == "ppg" && rightUnit != "lbm/ft3") {
            let out1 = "check units"
            output.text = out1
        }
        
        
        
        
            
        
    
    }
// leaves keyboard when touching outside of text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        massEntry.resignFirstResponder()
    }
    
}
extension UIViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        // tap textfield, becomes 1st responder(awaites user input), untap, is resigned text field
        textField.resignFirstResponder()
        return true
        
    }
    
}





