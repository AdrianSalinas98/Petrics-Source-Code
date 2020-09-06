//
//  FirstViewController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/19/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
// add unit ID: ca-app-pub-4761213067746899/8403638086

import UIKit
import Foundation //for formatting
import GoogleMobileAds

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var conversion = [Currency]()
    
    @IBOutlet weak var arrow: UIImageView!
    
    
    
    let leftUnitPickerData = [" ","MPa","atm","m2","cm2","ft3","acre","m3","gal","degR","degC","Kelvin","mPa-s","kg","g/cc","ppg","N-m","Kilowatt", "Euro","Canadian Dollar","Chinese Yuan","Japanese Yen","Australian Dollar","British Pound","Indian Rupee","Mexican Peso","Swiss Franc"]
       let rightUnitPickerData = [" ","psi","ft2","Darcy","bbl","degF","cP","lbm","lbm/ft3","ft-lb","Hp","US Dollar"]

    @IBOutlet weak var leftPicker: UIPickerView!
    @IBOutlet weak var rightPicker: UIPickerView!
    
    @IBOutlet weak var unitBannerView: GADBannerView!
    
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
    @IBOutlet weak var output: UITextField!
    @IBOutlet weak var leftUnitSelect: UIPickerView!
    @IBOutlet weak var rightUnitSelect: UIPickerView!
    
    @IBOutlet weak var LeftLabel: UILabel!
    @IBOutlet weak var RightLabel: UILabel!
    
 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrow.image = UIImage(named: "IMG_1171 2")
        LeftLabel.text = "input"
        RightLabel.text = "output"
        output.isUserInteractionEnabled = false

        
        
        unitBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
                
        //        real ID vvv
        //        bannerView.adUnitID =
//        unitBannerView.adUnitID = "ca-app-pub-9327866905939676/8091727026"
        unitBannerView.rootViewController = self
        unitBannerView.load(GADRequest())
        
        //        prefill in unit labels
        massEntry.delegate = self
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

        unitBannerView.delegate = self
    
    }
    
    
    @IBAction func arrowButton(_ sender: Any) {
        
        if arrow.image == UIImage(named: "IMG_1170"){
            arrow.image = UIImage(named: "IMG_1171 2")
            LeftLabel.text = "input"
            RightLabel.text = "output"
            output.text = ""
            massEntry.text = ""
            massEntry.isUserInteractionEnabled = true
            output.isUserInteractionEnabled = false
        }

        else if arrow.image == UIImage(named: "IMG_1171 2"){
            arrow.image = UIImage(named: "IMG_1170")
            LeftLabel.text = "output"
            RightLabel.text = "input"
            output.text = ""
            massEntry.text = ""
            massEntry.isUserInteractionEnabled = false
            output.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func execute(_ sender: Any) {
        
        
        if arrow.image == UIImage(named: "IMG_1171 2"){
            
                let leftUnit =  unitDisplayLeft.text
                let rightUnit = unitDisplayRight.text
                let calc1 = Float(massEntry.text!)
                
                if  (leftUnit == "MPa" && rightUnit == "psi") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(145.04))
                        output.text = "\(out1)"
                    if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                    }
                    }
                else if (leftUnit == "MPa" && rightUnit != "psi") {
                    
                    let out1 = "check units"
                        output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "atm" && rightUnit == "psi") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(14.70))
                        output.text = "\(out1)"
                    if out1 > 10000 {
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                    }
                }
                }
                else if (leftUnit == "atm" && rightUnit != "psi") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "N-m" && rightUnit == "ft-lb") {
                    if massEntry.text == "" {
                            output.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(0.7375621))
                            output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                    }
                }
                else if (leftUnit == "N-m" && rightUnit != "ft-lb") {
                    let out1 = "check units"
                    output.text = out1

                    }
        // ----------------------------
                else if (leftUnit == "m2" && rightUnit == "ft2") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(10.7639))
                           output.text = "\(out1)"
                    if out1 > 10000 {
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                    }
                       }
                }
                else if (leftUnit == "m2" && rightUnit == "Darcy") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(1013249965828.1448))
                        output.text = "\(out1)"
                    if out1 > 10000 {
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                    }
                    else if out1 < 0.001{
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                        }
                    }
                }
                else if (leftUnit == "m2" && rightUnit != "ft2") || (leftUnit == "m2" && rightUnit != "Darcy") {
                    
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "Kilowatt" && rightUnit == "Hp") {
                    if massEntry.text == "" {
                            output.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1.34102))
                        output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                        else{
                            output.text = "\(out1)"
                        }
                    }
                }
                else if (leftUnit == "Kilowatt" && rightUnit != "Hp") {
                    let out1 = "check units"
                    output.text = out1

                    }
        // ----------------------------
                else if (leftUnit == "cm2" && rightUnit == "Darcy") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(101325335.4))
                        output.text = "\(out1)"
                    if out1 > 10000 {
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                    }
                    else if out1 < 0.001{
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                        }
                }
                }
                else if (leftUnit == "cm2" && rightUnit == "ft2") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(0.001076))
                    output.text = "\(out1)"
                    if out1 > 10000 {
                        let Fout1 = String(format: "%5.2e" ,out1)
                        output.text = Fout1
                    }
                }
                }
                else if (leftUnit == "cm2" && rightUnit != "ft2" ) || (leftUnit == "cm2" && rightUnit != "Darcy") {
                    let out1 = "check units"
                    output.text = out1
                }
                
        // ----------------------------
                else if (leftUnit == "acre" && rightUnit == "ft2") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                           let out1 = Float(calc1!*(43560))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "acre" && rightUnit != "ft2") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "ft3" && rightUnit == "bbl") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!/(5.615))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "ft3" && rightUnit != "bbl") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "m3" && rightUnit == "bbl") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(6.2898))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "m3" && rightUnit != "bbl") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "gal" && rightUnit == "bbl") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(0.02381))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                    
                else if (leftUnit == "gal" && rightUnit != "bbl") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "degR" && rightUnit == "degF") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!-(459.67))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "degR" && rightUnit != "degF") {
                    let out1 = "check units"
                    output.text = out1
                    }
        // ----------------------------
                else if (leftUnit == "Kelvin" && rightUnit == "degF") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float((calc1!-273.15)*(9/5)+32)
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "Kelvin" && rightUnit != "degF") {
                    let out1 = "check units"
                    output.text = out1
                    }
        // ----------------------------
                else if (leftUnit == "degC" && rightUnit == "degF") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                           let out1 = Float(calc1!*(9/5)+32)
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "degC" && rightUnit != "degF") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "mPa-s" && rightUnit == "cP") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                           let out1 = Float(calc1!*(1))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "mPa-s" && rightUnit != "cP") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "kg" && rightUnit == "lbm") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(2.20462))
                           output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                       }
                }
                else if (leftUnit == "kg" && rightUnit != "lbm") {
                    let out1 = "check units"
                    output.text = out1
                    }
        // ----------------------------
                else if (leftUnit == "g/cc" && rightUnit == "lbm/ft3") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(62.428))
                    output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                }
                }
                else if (leftUnit == "g/cc" && rightUnit != "lbm/ft3") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------
                else if (leftUnit == "ppg" && rightUnit == "lbm/ft3") {
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else{
                    let out1 = Float(calc1!*(7.48))
                    output.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            output.text = Fout1
                        }
                }
                }
                else if (leftUnit == "ppg" && rightUnit != "lbm/ft3") {
                    let out1 = "check units"
                    output.text = out1
                }
        // ----------------------------

                
            
            // ----------------------------2
        
            else if (leftUnit == "Euro" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoEUR = rate!.rates.EUR
                            let out1 = Float(calc1!*(1/USDtoEUR))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
            else if (leftUnit == "Euro" && rightUnit != "US Dollar") {
            let out1 = "check units"
                    massEntry.text = out1
            }
            // ----------------------------3
            
            else if (leftUnit == "Canadian Dollar" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoCAD = rate!.rates.CAD
                            let out1 = Float(calc1!*(1/USDtoCAD))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }

                    else if (leftUnit == "Canadian Dollar" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
           
            
            // ----------------------------4
                       else if (leftUnit == "Chinese Yuan" && rightUnit == "US Dollar") {
                              
                               if massEntry.text == "" {
                                   output.text = "needVal"
                               }
                               else {
                               let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                               URLSession.shared.dataTask(with: url) { data, _, _ in
                                   if let data = data {
                                       let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                       let USDtoYUAN = rate!.rates.CNY
                                       let out1 = Float(calc1!*(1/USDtoYUAN))
                                       DispatchQueue.main.async {

                                       self.output.text = "\(out1)"
                                       if out1 > 10000 {
                                           let Fout1 = String(format: "%5.2e" ,out1)
                                           self.output.text = Fout1
                                       }
                                       else if out1 < 0.1 {
                                           let Fout1 = String(format: "%5.2e" ,out1)
                                           self.output.text = Fout1
                                           }
                                       }
                           
                                   }
                               }.resume()
                                   
                               }
                       }
            else if (leftUnit == "Chinese Yuan" && rightUnit != "US Dollar") {
            let out1 = "check units"
                    massEntry.text = out1
            }
            
            // ----------------------------5
            else if (leftUnit == "Japanese Yen" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoYEN = rate!.rates.JPY
                            let out1 = Float(calc1!*(1/USDtoYEN))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
                    else if (leftUnit == "Japanes Yen" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
            
            
            //------------------------------6
            else if (leftUnit == "Australian Dollar" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoAUD = rate!.rates.AUD
                            let out1 = Float(calc1!*(1/USDtoAUD))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
                    else if (leftUnit == "Australian Dollar" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
            
            //------------------------------7
            else if (leftUnit == "British Pound" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoGBP = rate!.rates.GBP
                            let out1 = Float(calc1!*(1/USDtoGBP))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
                    else if (leftUnit == "British Pound" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
            //------------------------------8
            else if (leftUnit == "Indian Rupee" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoINR = rate!.rates.INR
                            let out1 = Float(calc1!*(1/USDtoINR))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
                    else if (leftUnit == "Indian Rupee" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
            
            //------------------------------9
            else if (leftUnit == "Mexican Peso" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoMXN = rate!.rates.MXN
                            let out1 = Float(calc1!*(1/USDtoMXN))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
                    else if (leftUnit == "Mexican Peso" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
            
            //------------------------------10
            else if (leftUnit == "Swiss Franc" && rightUnit == "US Dollar") {
                   
                    if massEntry.text == "" {
                        output.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoCHF = rate!.rates.CHF
                            let out1 = Float(calc1!*(1/USDtoCHF))
                            DispatchQueue.main.async {

                            self.output.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.output.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }
            
            else if (leftUnit == "Swiss Franc" && rightUnit != "US Dollar") {
                    let out1 = "check units"
                            output.text = out1
                    }
            

//       other way
    }
        else if arrow.image == UIImage(named: "IMG_1170"){
            
            let leftUnit =  unitDisplayLeft.text
            let rightUnit = unitDisplayRight.text
            let calc1 = Float(output.text!)
                    
                    if  (leftUnit == "MPa" && rightUnit == "psi") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/145.04))
                            massEntry.text = "\(out1)"
                        if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                        }
                        }
                    else if (leftUnit == "MPa" && rightUnit != "psi") {
                        
                        let out1 = "check units"
                            output.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "atm" && rightUnit == "psi") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/14.70))
                            massEntry.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                        }
                    }
                    }
                    else if (leftUnit == "atm" && rightUnit != "psi") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "N-m" && rightUnit == "ft-lb") {
                        if output.text == "" {
                                massEntry.text = "needVal"
                            }
                            else{
                            let out1 = Float(calc1!*(1/0.7375621))
                                massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                        }
                    }
                    else if (leftUnit == "N-m" && rightUnit != "ft-lb") {
                        let out1 = "check units"
                        massEntry.text = out1

                        }
            // ----------------------------
                    else if (leftUnit == "m2" && rightUnit == "ft2") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/10.7639))
                               massEntry.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                        }
                           }
                    }
                    else if (leftUnit == "m2" && rightUnit == "Darcy") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/1013249965828.1448))
                            massEntry.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                        }
                        else if out1 < 0.001{
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                            }
                        }
                    }
                    else if (leftUnit == "m2" && rightUnit != "ft2") || (leftUnit == "m2" && rightUnit != "Darcy") {
                        
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "Kilowatt" && rightUnit == "Hp") {
                        if output.text == "" {
                                massEntry.text = "needVal"
                            }
                            else{
                            let out1 = Float(calc1!*(1/1.34102))
                            massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                            else{
                                massEntry.text = "\(out1)"
                            }
                        }
                    }
                    else if (leftUnit == "Kilowatt" && rightUnit != "Hp") {
                        let out1 = "check units"
                        massEntry.text = out1

                        }
            // ----------------------------
                    else if (leftUnit == "cm2" && rightUnit == "Darcy") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/101325335.4))
                            massEntry.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                        }
                        else if out1 < 0.001{
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                            }
                    }
                    }
                    else if (leftUnit == "cm2" && rightUnit == "ft2") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/0.001076))
                            massEntry.text = "\(out1)"
                        if out1 > 10000 {
                            let Fout1 = String(format: "%5.2e" ,out1)
                            massEntry.text = Fout1
                        }
                    }
                    }
                    else if (leftUnit == "cm2" && rightUnit != "ft2" ) || (leftUnit == "cm2" && rightUnit != "Darcy") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
                    
            // ----------------------------
                    else if (leftUnit == "acre" && rightUnit == "ft2") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                            let out1 = Float(calc1!*(1/43560))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "acre" && rightUnit != "ft2") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "ft3" && rightUnit == "bbl") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!/(1/5.615))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "ft3" && rightUnit != "bbl") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "m3" && rightUnit == "bbl") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/6.2898))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "m3" && rightUnit != "bbl") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "gal" && rightUnit == "bbl") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/0.02381))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                        
                    else if (leftUnit == "gal" && rightUnit != "bbl") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "degR" && rightUnit == "degF") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!+(459.67))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "degR" && rightUnit != "degF") {
                        let out1 = "check units"
                        massEntry.text = out1
                        }
            // ----------------------------
                    else if (leftUnit == "Kelvin" && rightUnit == "degF") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                            let out1 = Float((calc1!-32)*(5/9)+273.15)
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "Kelvin" && rightUnit != "degF") {
                        let out1 = "check units"
                        massEntry.text = out1
                        }
            // ----------------------------
                    else if (leftUnit == "degC" && rightUnit == "degF") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                               let out1 = Float((calc1!-32)*(5/9))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "degC" && rightUnit != "degF") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "mPa-s" && rightUnit == "cP") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                               let out1 = Float(calc1!*(1))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "mPa-s" && rightUnit != "cP") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "kg" && rightUnit == "lbm") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/2.20462))
                               massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                           }
                    }
                    else if (leftUnit == "kg" && rightUnit != "lbm") {
                        let out1 = "check units"
                        massEntry.text = out1
                        }
            // ----------------------------
                    else if (leftUnit == "g/cc" && rightUnit == "lbm/ft3") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/62.428))
                        massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                    }
                    }
                    else if (leftUnit == "g/cc" && rightUnit != "lbm/ft3") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
            // ----------------------------
                    else if (leftUnit == "ppg" && rightUnit == "lbm/ft3") {
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else{
                        let out1 = Float(calc1!*(1/7.48))
                        massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                massEntry.text = Fout1
                            }
                    }
                    }
                    else if (leftUnit == "ppg" && rightUnit != "lbm/ft3") {
                        let out1 = "check units"
                        massEntry.text = out1
                    }
                        
//            right here
                    else if (leftUnit == "Euro" && rightUnit == "US Dollar") {
                   
                    if output.text == "" {
                        massEntry.text = "needVal"
                    }
                    else {
                    let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data {
                            let rate = try? JSONDecoder().decode(Currency.self, from: data)
                            let USDtoEUR = rate!.rates.EUR
                            let out1 = Float(calc1!*(USDtoEUR))
                            DispatchQueue.main.async {

                            self.massEntry.text = "\(out1)"
                            if out1 > 10000 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.massEntry.text = Fout1
                            }
                            else if out1 < 0.1 {
                                let Fout1 = String(format: "%5.2e" ,out1)
                                self.massEntry.text = Fout1
                                }
                            }
                
                        }
                    }.resume()
                        
                    }
            }

                else if (leftUnit == "Euro" && rightUnit != "US Dollar") {
                let out1 = "check units"
                        massEntry.text = out1
                }
                // ----------------------------3
                
                else if (leftUnit == "Canadian Dollar" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoCAD = rate!.rates.CAD
                                let out1 = Float(calc1!*(USDtoCAD))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }

                        else if (leftUnit == "Canadian Dollar" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                massEntry.text = out1
                        }
               
                
                // ----------------------------4
                           else if (leftUnit == "Chinese Yuan" && rightUnit == "US Dollar") {
                                  
                                   if output.text == "" {
                                       massEntry.text = "needVal"
                                   }
                                   else {
                                   let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                                   URLSession.shared.dataTask(with: url) { data, _, _ in
                                       if let data = data {
                                           let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                           let USDtoYUAN = rate!.rates.CNY
                                           let out1 = Float(calc1!*(USDtoYUAN))
                                           DispatchQueue.main.async {

                                           self.massEntry.text = "\(out1)"
                                           if out1 > 10000 {
                                               let Fout1 = String(format: "%5.2e" ,out1)
                                               self.massEntry.text = Fout1
                                           }
                                           else if out1 < 0.1 {
                                               let Fout1 = String(format: "%5.2e" ,out1)
                                               self.massEntry.text = Fout1
                                               }
                                           }
                               
                                       }
                                   }.resume()
                                       
                                   }
                           }
                else if (leftUnit == "Chinese Yuan" && rightUnit != "US Dollar") {
                let out1 = "check units"
                        massEntry.text = out1
                }
                
                // ----------------------------5
                else if (leftUnit == "Japanese Yen" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoYEN = rate!.rates.JPY
                                let out1 = Float(calc1!*(USDtoYEN))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }
                        else if (leftUnit == "Japanes Yen" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                massEntry.text = out1
                        }
                
                
                //------------------------------6
                else if (leftUnit == "Australian Dollar" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoAUD = rate!.rates.AUD
                                let out1 = Float(calc1!*(USDtoAUD))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }
                        else if (leftUnit == "Australian Dollar" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                massEntry.text = out1
                        }
                
                //------------------------------7
                else if (leftUnit == "British Pound" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoGBP = rate!.rates.GBP
                                let out1 = Float(calc1!*(USDtoGBP))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }
                        else if (leftUnit == "British Pound" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                massEntry.text = out1
                        }
                //------------------------------8
                else if (leftUnit == "Indian Rupee" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoINR = rate!.rates.INR
                                let out1 = Float(calc1!*(USDtoINR))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }
                        else if (leftUnit == "Indian Rupee" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                massEntry.text = out1
                        }
                
                //------------------------------9
                else if (leftUnit == "Mexican Peso" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoMXN = rate!.rates.MXN
                                let out1 = Float(calc1!*(USDtoMXN))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }
                        else if (leftUnit == "Mexican Peso" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                massEntry.text = out1
                        }
                
                //------------------------------10
                else if (leftUnit == "Swiss Franc" && rightUnit == "US Dollar") {
                       
                        if output.text == "" {
                            massEntry.text = "needVal"
                        }
                        else {
                        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data {
                                let rate = try? JSONDecoder().decode(Currency.self, from: data)
                                let USDtoCHF = rate!.rates.CHF
                                let out1 = Float(calc1!*(USDtoCHF))
                                DispatchQueue.main.async {

                                self.massEntry.text = "\(out1)"
                                if out1 > 10000 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                }
                                else if out1 < 0.1 {
                                    let Fout1 = String(format: "%5.2e" ,out1)
                                    self.massEntry.text = Fout1
                                    }
                                }
                    
                            }
                        }.resume()
                            
                        }
                }
                
                else if (leftUnit == "Swiss Franc" && rightUnit != "US Dollar") {
                        let out1 = "check units"
                                output.text = out1
                        }
            
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        massEntry.resignFirstResponder()
        output.resignFirstResponder()
    }
    
    
}
    
extension UIViewController : UITextFieldDelegate {
            public func textFieldShouldReturn(_ textField:UITextField) -> Bool {
                // tap textfield, becomes 1st responder(awaites user input), untap, is resigned text field
                textField.resignFirstResponder()
                return true
                
            }
            
        }
                
extension UIViewController {
    public func unitBannerView(_ bannerView: GADBannerView) {
        print("recieved ad")
    }
    
    public func unitBannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }

    
    
}
                
                
                    
                
            
            
        

    

