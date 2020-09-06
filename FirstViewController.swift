//
//  FirstViewController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/19/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit
import Foundation //for formatting

class FirstViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource {

    let casePickerData = ["","Case 1","Case 2", "Case 3", "Case 4"]
    let casePickerV = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return casePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return casePickerData[row]
    }
   
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        caseDisplay.text = casePickerData[row]
        
        if caseDisplay.text == "Case 1" {
            perpLaminated.text = "NONE"
            gammaAquifer.text = "NONE"
            
            parallelLaminated.text = ""
            resPureShale.text = ""
            resAquifer.text = ""
            gammaPureShale.text = ""
            gammaLaminated.text = ""
            gammaCleanSS.text = ""
            archie_m.text = ""
            archie_n.text = ""
            archie_a.text = ""
            neutronAquifer.text = ""
            neutronPureShale.text = ""
            neutronLaminated.text = ""
            densityAquifer.text = ""
            densityPureShale.text = ""
            densityLaminated.text = ""
        }
        else if caseDisplay.text == "Case 2"{
            perpLaminated.text = "NONE"
            gammaPureShale.text = "NONE"
            gammaLaminated.text = "NONE"
            gammaAquifer.text = "NONE"
            gammaCleanSS.text = "NONE"
            resAquifer.text = "NONE"
            neutronLaminated.text = "NONE"
            densityLaminated.text = "NONE"
            
            parallelLaminated.text = ""
            resPureShale.text = ""
            archie_m.text = ""
            archie_n.text = ""
            archie_a.text = ""
            neutronAquifer.text = ""
            neutronPureShale.text = ""
            densityAquifer.text = ""
            densityPureShale.text = ""

        }
        else if caseDisplay.text == "Case 3"{
            gammaPureShale.text = "NONE"
            gammaLaminated.text = "NONE"
            gammaAquifer.text = "NONE"
            gammaCleanSS.text = "NONE"
            
            parallelLaminated.text = ""
            resPureShale.text = ""
            resAquifer.text = ""
            archie_m.text = ""
            archie_n.text = ""
            archie_a.text = ""
            neutronAquifer.text = ""
            neutronPureShale.text = ""
            neutronLaminated.text = ""
            densityAquifer.text = ""
            densityPureShale.text = ""
            densityLaminated.text = ""
 
        }
        else if caseDisplay.text == "Case 4"{
            gammaCleanSS.text = "NONE"
            perpLaminated.text = "NONE"
            
            parallelLaminated.text = ""
            resPureShale.text = ""
            resAquifer.text = ""
            gammaPureShale.text = ""
            gammaLaminated.text = ""
            gammaAquifer.text = ""
            archie_m.text = ""
            archie_n.text = ""
            archie_a.text = ""
            neutronAquifer.text = ""
            neutronPureShale.text = ""
            neutronLaminated.text = ""
            densityAquifer.text = ""
            densityPureShale.text = ""
            densityLaminated.text = ""

        }
        
        
    }
 
    
    
    
    @IBOutlet weak var casePicker: UIPickerView!
    @IBOutlet weak var caseDisplay: UITextField!
    
//    resistivity
    @IBOutlet weak var parallelLaminated: UITextField!
    @IBOutlet weak var perpLaminated: UITextField!
    @IBOutlet weak var resPureShale: UITextField!
    @IBOutlet weak var resAquifer: UITextField!
//    ----------------------------------------------------
//    Gamma Ray
    @IBOutlet weak var gammaPureShale: UITextField!
    @IBOutlet weak var gammaLaminated: UITextField!
    @IBOutlet weak var gammaAquifer: UITextField!
    @IBOutlet weak var gammaCleanSS: UITextField!
    
//    archie's parameters
    @IBOutlet weak var archie_m: UITextField!
    @IBOutlet weak var archie_n: UITextField!
    @IBOutlet weak var archie_a: UITextField!
    
//    Nuetron Porosity
    @IBOutlet weak var neutronAquifer: UITextField!
    @IBOutlet weak var neutronPureShale: UITextField!
    @IBOutlet weak var neutronLaminated: UITextField!
    
//    Density Porosity
    @IBOutlet weak var densityAquifer: UITextField!
    @IBOutlet weak var densityPureShale: UITextField!
    @IBOutlet weak var densityLaminated: UITextField!
//    ----------------------------------------------------

//    outputs
    @IBOutlet weak var concShale: UITextField!
    @IBOutlet weak var sandPorosity: UITextField!
    @IBOutlet weak var waterSaturation: UITextField!
    @IBOutlet weak var hydrocarbonSaturation: UITextField!
    @IBOutlet weak var HPV: UITextField!
    @IBOutlet weak var fluidDensity: UITextField!
    @IBOutlet weak var hydrocarbonDensity: UITextField!
    @IBOutlet weak var fluidType: UITextField!
    @IBOutlet weak var waterYN: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//prefill unit labels
        caseDisplay.placeholder = "case #"
        caseDisplay.textAlignment = .center
//needed settings
        
        casePicker.dataSource = self
        casePicker.delegate = self
        
        parallelLaminated.delegate = self
        perpLaminated.delegate = self
        resPureShale.delegate = self
        resAquifer.delegate = self
        gammaPureShale.delegate = self
        gammaLaminated.delegate = self
        gammaAquifer.delegate = self
        archie_m.delegate = self
        archie_n.delegate = self
        archie_a.delegate = self
        neutronAquifer.delegate = self
        neutronPureShale.delegate = self
        neutronLaminated.delegate = self
        densityAquifer.delegate = self
        densityPureShale.delegate = self
        densityLaminated.delegate = self
        gammaCleanSS.delegate = self
        
    }

    @IBAction func calculate(_ sender: Any) {
        
        let caseDisplayV = caseDisplay.text
        
//        variables
        let parallelLaminatedV = Double(parallelLaminated.text!)
        let perpLaminatedV = Double(perpLaminated.text!)
        let resPureShaleV = Double(resPureShale.text!)
        let resAquiferV = Double(resAquifer.text!)
        let gammaPureShaleV = Double(gammaPureShale.text!)
        let gammaLaminatedV = Double(gammaLaminated.text!)
        let gammaAquiferV = Double(gammaAquifer.text!)
        let gammaCleanSSV = Double(gammaCleanSS.text!)
        let archie_mV = Double(archie_m.text!)
        let archie_nV = Double(archie_n.text!)
        let archie_aV = Double(archie_n.text!)
        let neutronAquiferV = Double(neutronAquifer.text!)
        let neutronPureShaleV = Double(neutronPureShale.text!)
        let neutronLaminatedV = Double(neutronLaminated.text!)
        let densityAquiferV = Double(densityAquifer.text!)
        let densityPureShaleV = Double(densityPureShale.text!)
        let densityLaminatedV = Double(densityLaminated.text!)
        
        
//        case 1
        
        if caseDisplayV == "Case 1" {
            if (parallelLaminated.text == "") || (parallelLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
                
            }
            else if (resPureShale.text == "") || (resPureShale.text == ".") {
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (resAquifer.text == "") || (resAquifer.text == ".") {
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (gammaPureShale.text == "") || (gammaPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (gammaLaminated.text == "") || (gammaLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
                
            }
            else if (gammaCleanSS.text == "") || (gammaCleanSS.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
                    
            }
            else if (archie_m.text == "") || (archie_m.text == ".") {
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_n.text == "") || (archie_n.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_a.text == "") || (archie_a.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronAquifer.text == "") || (neutronAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronPureShale.text == "") || (neutronPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronLaminated.text == "") || (neutronLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityAquifer.text == "") || (densityAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityPureShale.text == "") || (densityPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityLaminated.text == "") || (densityLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else {
            
                let Csh = (gammaLaminatedV! - gammaCleanSSV!)/(gammaPureShaleV! - gammaCleanSSV!)
                let SSporosity_Aq = pow(((pow(densityAquiferV!,2)) + (pow(neutronAquiferV!,2)))/2, 0.5)
                let correctedDensityPorosity = (densityLaminatedV!-(Csh*densityPureShaleV!))/(1-Csh)
                let correctedNuetronPorosity = (neutronLaminatedV!-(Csh*neutronPureShaleV!))/(1-Csh)
                let correctedSSporosity = pow(((pow(correctedDensityPorosity,2)) + (pow(correctedNuetronPorosity,2)))/2, 0.5)
                let  Rss = (1-Csh)/((1/parallelLaminatedV!)-(Csh/resPureShaleV!))
                let Rw = (resAquiferV!*((pow(SSporosity_Aq,archie_mV!))/archie_aV!))
                let Sw = pow(((Rw/Rss)*(archie_aV!/(pow(correctedSSporosity,archie_mV!)))),(1/archie_nV!))
                let Shc = (1-Sw)
                let HPVV = (1-Csh)*(correctedSSporosity)*(Shc)
                let rhoB = (densityLaminatedV!*1) + (1 - densityLaminatedV!)*2.65
                let rhoSh = (densityPureShaleV!*1) + (1 - densityPureShaleV!)*2.65
                let rhoSS = (1/(1-Csh))*(rhoB-(rhoSh*Csh))
                let rhoF = (1/correctedSSporosity)*(rhoSS-(1-correctedSSporosity)*2.65)

                if Sw == 1 {
                    let rhoHC = "Aquifer"
                    let fluid = "water"
                    waterYN.text = "YES"
                    fluidType.text = "\(fluid)"
                    hydrocarbonDensity.text = rhoHC
                }
                else if Sw != 1 {
                    let rhoHC = (1/(1-Sw))*(rhoF-(Sw*1))
                    waterYN.text = "NO"
                    if rhoHC < 0.3 {
                        let fluid = "Light HC"
                        fluidType.text = fluid
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                    else {
                        let fluid = "Oil"
                        fluidType.text = "\(fluid)"
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                }
                concShale.text = "\(String(format: "%.2f",(Csh*100))) %"
                sandPorosity.text = "\(String(format: "%.2f",(correctedSSporosity*100))) %"
                waterSaturation.text = "\(String(format: "%.2f",(Sw*100))) %"
                hydrocarbonSaturation.text = "\(String(format: "%.2f",(Shc*100))) %"
                HPV.text = "\(String(format: "%.2f",(HPVV*100))) %"
                fluidDensity.text = "\(String(format: "%.2f",(rhoF))) g/cc"
            }
        }
            
//        case 2
        else if caseDisplayV == "Case 2" {
            if (parallelLaminated.text == "") || (parallelLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (resPureShale.text == "") || (resPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_m.text == "") || (archie_m.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_n.text == "") || (archie_n.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_a.text == "") || (archie_a.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronAquifer.text == "") || (neutronAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronPureShale.text == "") || (neutronPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityAquifer.text == "") || (densityAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityPureShale.text == "") || (densityPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else {
                let Csh = (neutronAquiferV! - densityAquiferV!) / (neutronPureShaleV! - densityPureShaleV!)
                let correctedDensityPorosity = (densityAquiferV!-(Csh*densityPureShaleV!))/(1-Csh)
                let correctedNuetronPorosity = (neutronAquiferV!-(Csh*neutronPureShaleV!))/(1-Csh)
                let correctedSSporosity = pow(((pow(correctedDensityPorosity,2)) + (pow(correctedNuetronPorosity,2)))/2, 0.5)
                let Rss = (1-Csh)/((1/parallelLaminatedV!)-(Csh/resPureShaleV!))
                let Rw = (Rss*((pow(correctedSSporosity,archie_mV!))/archie_aV!))
                let Sw = pow(((Rw/Rss)*(archie_aV!/(pow(correctedSSporosity,archie_mV!)))),(1/archie_nV!))
                let Shc = (1-Sw)
                let HPVV = (1-Csh)*(correctedSSporosity)*(Shc)
                let rhoB = (densityAquiferV!*1) + (1 - densityAquiferV!)*2.65
                let rhoSh = (densityPureShaleV!*1) + (1 - densityPureShaleV!)*2.65
                let rhoSS = (1/(1-Csh))*(rhoB-(rhoSh*Csh))
                let rhoF = (1/correctedSSporosity)*(rhoSS-(1-correctedSSporosity)*2.65)
                if Sw == 1 {
                    let rhoHC = "Aquifer"
                    let fluid = "water"
                    waterYN.text = "YES"
                    fluidType.text = "\(fluid)"
                    hydrocarbonDensity.text = rhoHC
                }
                else if Sw != 1 {
                    let rhoHC = (1/(1-Sw))*(rhoF-(Sw*1))
                    waterYN.text = "NO"
                    if rhoHC < 0.3 {
                        let fluid = "Light HC"
                        fluidType.text = fluid
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                    else {
                        let fluid = "Oil"
                        fluidType.text = "\(fluid)"
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                }
                concShale.text = "\(String(format: "%.2f",(Csh*100))) %"
                sandPorosity.text = "\(String(format: "%.2f",(correctedSSporosity*100))) %"
                waterSaturation.text = "\(String(format: "%.2f",(Sw*100))) %"
                hydrocarbonSaturation.text = "\(String(format: "%.2f",(Shc*100))) %"
                HPV.text = "\(String(format: "%.2f",(HPVV*100))) %"
                fluidDensity.text = "\(String(format: "%.2f",(rhoF))) g/cc"
            }
        }
        
//        case 3
        else if caseDisplayV == "Case 3" {
            if (parallelLaminated.text == "") || (parallelLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (resPureShale.text == "") || (resPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (resAquifer.text == "") || (resAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_m.text == "") || (archie_m.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_n.text == "") || (archie_n.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_a.text == "") || (archie_a.text == ".") {
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronAquifer.text == "") || (neutronAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronPureShale.text == "") || (neutronPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronLaminated.text == "") || (neutronLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityAquifer.text == "") || (densityAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityPureShale.text == "") || (densityPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityLaminated.text == "") || (densityLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            
            else {
                let Csh = ((parallelLaminatedV!*resPureShaleV!)-(perpLaminatedV!*resPureShaleV!))/((
                2*parallelLaminatedV!*resPureShaleV!)-(pow(resPureShaleV!,2))-(perpLaminatedV!*parallelLaminatedV!))
                let correctedDensityPorosity = (densityLaminatedV!-(Csh*densityPureShaleV!))/(1-Csh)
                let correctedNuetronPorosity = (neutronLaminatedV!-(Csh*neutronPureShaleV!))/(1-Csh)
                let correctedSSporosity = pow(((pow(correctedDensityPorosity,2)) + (pow(correctedNuetronPorosity,2)))/2, 0.5)
                let CshAq = (neutronAquiferV! - densityAquiferV!) / (neutronPureShaleV! - densityPureShaleV!)
                let Rss = (1-Csh)/((1/parallelLaminatedV!)-(Csh/resPureShaleV!))
                let RssAq = (1-CshAq) / ((1/resAquiferV!)-(CshAq/resPureShaleV!))
                let correctedNeutronPorosityAq = (neutronAquiferV! - CshAq*neutronPureShaleV!)/(1-CshAq)
                let correctedDensityPorosityAq = (densityAquiferV! - CshAq*densityPureShaleV!)/(1-CshAq)
                let correctedSSporosityAq = pow(((pow(correctedDensityPorosityAq,2)) + (pow(correctedNeutronPorosityAq,2)))/2, 0.5)
                let Rw = (RssAq*((pow(correctedSSporosityAq,archie_mV!))/archie_aV!))
                let Sw = pow(((Rw/Rss)*(archie_aV!/(pow(correctedSSporosity,archie_mV!)))),(1/archie_nV!))
                let Shc = (1-Sw)
                let HPVV = (1-Csh)*(correctedSSporosity)*(Shc)
                let rhoB = (densityLaminatedV!*1) + (1 - densityLaminatedV!)*2.65
                let rhoSh = (densityPureShaleV!*1) + (1 - densityPureShaleV!)*2.65
                let rhoSS = (1/(1-Csh))*(rhoB-(rhoSh*Csh))
                let rhoF = (1/correctedSSporosity)*(rhoSS-(1-correctedSSporosity)*2.65)
                if Sw == 1 {
                    let rhoHC = "Aquifer"
                    let fluid = "water"
                    waterYN.text = "YES"
                    fluidType.text = "\(fluid)"
                    hydrocarbonDensity.text = rhoHC
                }
                else if Sw != 1 {
                    let rhoHC = (1/(1-Sw))*(rhoF-(Sw*1))
                    waterYN.text = "NO"
                    if rhoHC < 0.3 {
                        let fluid = "Light HC"
                        fluidType.text = fluid
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                    else {
                        let fluid = "Oil"
                        fluidType.text = "\(fluid)"
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                }
                concShale.text = "\(String(format: "%.2f",(Csh*100))) %"
                sandPorosity.text = "\(String(format: "%.2f",(correctedSSporosity*100))) %"
                waterSaturation.text = "\(String(format: "%.2f",(Sw*100))) %"
                hydrocarbonSaturation.text = "\(String(format: "%.2f",(Shc*100))) %"
                HPV.text = "\(String(format: "%.2f",(HPVV*100))) %"
                fluidDensity.text = "\(String(format: "%.2f",(rhoF))) g/cc"
            }
        }
        else if caseDisplayV == "Case 4" {
            if (parallelLaminated.text == "") || (parallelLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (resPureShale.text == "") || (resPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (resAquifer.text == "") || (resAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (gammaPureShale.text == "") || (gammaPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (gammaLaminated.text == "") || (gammaLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (gammaAquifer.text == "") || (gammaAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_m.text == "") || (archie_m.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_n.text == "") || (archie_n.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (archie_a.text == "") || (archie_a.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronAquifer.text == "") || (neutronAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronPureShale.text == "") || (neutronPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (neutronLaminated.text == "") || (neutronLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityAquifer.text == "") || (densityAquifer.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityPureShale.text == "") || (densityPureShale.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            else if (densityLaminated.text == "") || (densityLaminated.text == "."){
                concShale.text = "ERROR"
                sandPorosity.text = "ERROR"
                waterSaturation.text = "ERROR"
                hydrocarbonSaturation.text = "ERROR"
                HPV.text = "ERROR"
                fluidDensity.text = "ERROR"
                hydrocarbonDensity.text = "ERROR"
                fluidType.text = "ERROR"
                waterYN.text = "ERROR"
            }
            
            else {
                let CshAq = (neutronAquiferV! - densityAquiferV!) / (neutronPureShaleV! - densityPureShaleV!)
                let slope = (1-CshAq)/(gammaPureShaleV!-gammaAquiferV!)
                let Csh = slope*(gammaLaminatedV!-gammaPureShaleV!) + 1
                let correctedDensityPorosity = (densityLaminatedV!-(Csh*densityPureShaleV!))/(1-Csh)
                let correctedNuetronPorosity = (neutronLaminatedV!-(Csh*neutronPureShaleV!))/(1-Csh)
                let correctedSSporosity = pow(((pow(correctedDensityPorosity,2)) + (pow(correctedNuetronPorosity,2)))/2, 0.5)
                let correctedNeutronPorosityAq = (neutronAquiferV! - CshAq*neutronPureShaleV!)/(1-CshAq)
                let correctedDensityPorosityAq = (densityAquiferV! - CshAq*densityPureShaleV!)/(1-CshAq)
                let correctedSSporosityAq = pow(((pow(correctedDensityPorosityAq,2)) + (pow(correctedNeutronPorosityAq,2)))/2, 0.5)
                let Rss = (1-Csh)/((1/parallelLaminatedV!)-(Csh/resPureShaleV!))
                let RssAq = (1-CshAq) / ((1/resAquiferV!)-(CshAq/resPureShaleV!))
                let Rw = (RssAq*((pow(correctedSSporosityAq,archie_mV!))/archie_aV!))
                let Sw = pow(((Rw/Rss)*(archie_aV!/(pow(correctedSSporosity,archie_mV!)))),(1/archie_nV!))
                let Shc = (1-Sw)
                let HPVV = (1-Csh)*(correctedSSporosity)*(Shc)
                let rhoB = (densityLaminatedV!*1) + (1 - densityLaminatedV!)*2.65
                let rhoSh = (densityPureShaleV!*1) + (1 - densityPureShaleV!)*2.65
                let rhoSS = (1/(1-Csh))*(rhoB-(rhoSh*Csh))
                let rhoF = (1/correctedSSporosity)*(rhoSS-(1-correctedSSporosity)*2.65)
                if Sw == 1 {
                    let rhoHC = "Aquifer"
                    let fluid = "water"
                    waterYN.text = "YES"
                    fluidType.text = "\(fluid)"
                    hydrocarbonDensity.text = rhoHC
                }
                else if Sw != 1 {
                    let rhoHC = (1/(1-Sw))*(rhoF-(Sw*1))
                    waterYN.text = "NO"
                    if rhoHC < 0.3 {
                        let fluid = "Light HC"
                        fluidType.text = fluid
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                    else {
                        let fluid = "Oil"
                        fluidType.text = "\(fluid)"
                        hydrocarbonDensity.text = "\(String(format: "%.2f",(rhoHC))) g/cc"
                    }
                }
                concShale.text = "\(String(format: "%.2f",(Csh*100))) %"
                sandPorosity.text = "\(String(format: "%.2f",(correctedSSporosity*100))) %"
                waterSaturation.text = "\(String(format: "%.2f",(Sw*100))) %"
                hydrocarbonSaturation.text = "\(String(format: "%.2f",(Shc*100))) %"
                HPV.text = "\(String(format: "%.2f",(HPVV*100))) %"
                fluidDensity.text = "\(String(format: "%.2f",(rhoF))) g/cc"
            }
        }
        
    }

        
    
    
// leaves keyboard when touching outside of text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        parallelLaminated.resignFirstResponder()
        perpLaminated.resignFirstResponder()
        resPureShale.resignFirstResponder()
        resAquifer.resignFirstResponder()
        gammaPureShale.resignFirstResponder()
        gammaLaminated.resignFirstResponder()
        gammaAquifer.resignFirstResponder()
        archie_m.resignFirstResponder()
        archie_n.resignFirstResponder()
        archie_a.resignFirstResponder()
        neutronAquifer.resignFirstResponder()
        neutronPureShale.resignFirstResponder()
        neutronLaminated.resignFirstResponder()
        densityAquifer.resignFirstResponder()
        densityPureShale.resignFirstResponder()
        densityLaminated.resignFirstResponder()
        
        }
        
    public override func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        // tap textfield, becomes 1st responder(awaites user input), untap, is resigned text field
        textField.resignFirstResponder()
        return true
    }
            
        










}
