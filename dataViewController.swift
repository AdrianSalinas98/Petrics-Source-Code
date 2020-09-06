//
//  dataViewController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 8/4/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

//
//  dataViewContoller.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/19/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.

// app id: ca-app-pub-4761213067746899~2365677492
// ad unit ID: ca-app-pub-4761213067746899/7969180355

import UIKit
import Foundation //for foramatting
import Charts
import GoogleMobileAds


class DataViewController: UIViewController, ChartViewDelegate{
    
    
    @IBOutlet weak var laborStatsChart: LineChartView!
    
    
    
    
    
    @IBOutlet weak var RigCount: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var LastWeekCount: UITextField!
    
    @IBOutlet weak var InternationalRigCount: UITextField!
    @IBOutlet weak var InternationalRigCountChange: UITextField!
    @IBOutlet weak var InternationalDate: UITextField!
    @IBOutlet weak var USLastYearCount: UITextField!
    @IBOutlet weak var USLastYearCountDate: UITextField!
    @IBOutlet weak var LastCountDate: UITextField!
    @IBOutlet weak var LastYearInternational: UITextField!
    @IBOutlet weak var LastYearInternationalDate: UITextField!
    @IBOutlet weak var LastCountIntDate: UITextField!
    @IBOutlet weak var OilCount: UITextField!
    @IBOutlet weak var OilCountChange: UITextField!
    @IBOutlet weak var GasCount: UITextField!
    @IBOutlet weak var GasCountChange: UITextField!
    @IBOutlet weak var MiscCount: UITextField!
    @IBOutlet weak var MiscCountChange: UITextField!
    @IBOutlet weak var IntOilCount: UITextField!
    @IBOutlet weak var IntGasCount: UITextField!
    @IBOutlet weak var IntMiscCount: UITextField!
    @IBOutlet weak var IntOilChange: UITextField!
    @IBOutlet weak var IntGasChange: UITextField!
    @IBOutlet weak var IntMiscChange: UITextField!
    
    
    @IBOutlet weak var WTIPrice: UITextField!
    @IBOutlet weak var BrentPrice: UITextField!
    @IBOutlet weak var NaturalGasPrice: UITextField!
    @IBOutlet weak var OPECPrice: UITextField!
    @IBOutlet weak var WTIChange: UITextField!
    @IBOutlet weak var BrentChange: UITextField!
    @IBOutlet weak var OPECChange: UITextField!
    @IBOutlet weak var NGChange: UITextField!
    

    @IBOutlet weak var bannerView: GADBannerView!
    

    @IBOutlet weak var timer: UILabel!
    var isTimerOn = false
    var duration = 0
    var timerVal = Timer()
    
    @IBOutlet weak var pieViewFluid: PieChartView!
    @IBOutlet weak var PieViewLocation: PieChartView!
    @IBOutlet weak var PiewViewOrientation: PieChartView!
    
    @IBOutlet weak var PiewViewFluidInt: PieChartView!
    @IBOutlet weak var PieViewLocationInt: PieChartView!

    
    
    func toggleTimer(on:Bool) {
        self.processData()

//        self.percentChange()
        timerVal = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self](_) in
            guard let strongSelf = self else { return }
            strongSelf.duration += 1
            strongSelf.timer.text = "\(String(strongSelf.duration))s"
            if strongSelf.timer.text == "\(6)s"{
                strongSelf.duration = 0
                strongSelf.timer.text = "\(0)s"
                self?.WTIPrice.text = "..."
                self?.BrentPrice.text = "..."
                self?.RigCount.text = "..."
                self?.month.text = "..."
                self?.LastWeekCount.text = "..."
                self?.NaturalGasPrice.text = "..."
                self?.NGChange.text = "..."
                self?.WTIChange.text = "..."
                self?.BrentChange.text = "..."
                self?.OPECPrice.text = "..."
                self?.OPECChange.text = "..."
                self?.InternationalDate.text = "..."
                self?.InternationalRigCount.text = "..."
                self?.InternationalRigCountChange.text = "..."
                self?.LastCountDate.text = "..."
                self?.USLastYearCount.text = "..."
                self?.USLastYearCountDate.text = "..."
                self?.LastYearInternational.text = "..."
                self?.LastYearInternationalDate.text = "..."
                self?.LastCountIntDate.text = "..."
                self?.OilCount.text = "..."
                self?.OilCountChange.text = "..."
                self?.GasCount.text = "..."
                self?.GasCountChange.text = "..."
                self?.MiscCount.text = "..."
                self?.MiscCountChange.text = "..."
                self?.IntOilCount.text = "..."
                self?.IntOilChange.text = "..."
                self?.IntGasCount.text = "..."
                self?.IntGasChange.text = "..."
                self?.IntMiscCount.text = "..."
                self?.IntMiscChange.text = "..."



                self?.processData()

            }
        })
        
        }

    
    func processData(){
        
        
        func setData() {
        let intTypeurl = URL(string: "https://github.com/AdrianSalinas98/AdrianSalinas98.github.io/blob/master/Data.html")!
        let taskintType = URLSession.shared.dataTask(with: intTypeurl) { (data, resp, error) in
            guard data == data else {
                print("data was nil")
                return
            }
            
            guard let htmlString = String(data: data!, encoding: String.Encoding.utf8) else {
                print("cant cast data to string")
                return
            }
            
            
            let lv_janStat = "[Janemployees]"
            let rv_janStat = "[/Janemployees]"
            let lr_janStat = htmlString.range(of: lv_janStat)
            let rr_janStat = htmlString.range(of: rv_janStat)
            let range_janStat = lr_janStat!.upperBound..<rr_janStat!.lowerBound
            let janStat = htmlString[range_janStat]
            let JanValue = Double(janStat)
            
            let lv_FebStat = "[Febemployees]"
            let rv_FebStat = "[/Febemployees]"
            let lr_FebStat = htmlString.range(of: lv_FebStat)
            let rr_FebStat = htmlString.range(of: rv_FebStat)
            let range_FebStat = lr_FebStat!.upperBound..<rr_FebStat!.lowerBound
            let FebStat = htmlString[range_FebStat]
            let FebValue = Double(FebStat)
            
            let lv_MarStat = "[Maremployees]"
            let rv_MarStat = "[/Maremployees]"
            let lr_MarStat = htmlString.range(of: lv_MarStat)
            let rr_MarStat = htmlString.range(of: rv_MarStat)
            let range_MarStat = lr_MarStat!.upperBound..<rr_MarStat!.lowerBound
            let MarStat = htmlString[range_MarStat]
            let MarValue = Double(MarStat)
            
            let lv_AprStat = "[Apremployees]"
            let rv_AprStat = "[/Apremployees]"
            let lr_AprStat = htmlString.range(of: lv_AprStat)
            let rr_AprStat = htmlString.range(of: rv_AprStat)
            let range_AprStat = lr_AprStat!.upperBound..<rr_AprStat!.lowerBound
            let AprStat = htmlString[range_AprStat]
            let AprValue = Double(AprStat)
            
            let lv_MayStat = "[Mayemployees]"
            let rv_MayStat = "[/Mayemployees]"
            let lr_MayStat = htmlString.range(of: lv_MayStat)
            let rr_MayStat = htmlString.range(of: rv_MayStat)
            let range_MayStat = lr_MayStat!.upperBound..<rr_MayStat!.lowerBound
            let MayStat = htmlString[range_MayStat]
            let MayValue = Double(MayStat)
         
            let lv_juneStat = "[Junemployees]"
            let rv_juneStat = "[/Junemployees]"
            let lr_juneStat = htmlString.range(of: lv_juneStat)
            let rr_juneStat = htmlString.range(of: rv_juneStat)
            let range_juneStat = lr_juneStat!.upperBound..<rr_juneStat!.lowerBound
            let juneStat = htmlString[range_juneStat]
            let junValue = Double(juneStat)
            
            let lv_JulStat = "[Julemployees]"
            let rv_JulStat = "[/Julemployees]"
            let lr_JulStat = htmlString.range(of: lv_JulStat)
            let rr_JulStat = htmlString.range(of: rv_JulStat)
            let range_JulStat = lr_JulStat!.upperBound..<rr_JulStat!.lowerBound
            let JulStat = htmlString[range_JulStat]
            let JulValue = Double(JulStat)
            
            let lv_AugStat = "[Augemployees]"
            let rv_AugStat = "[/Augemployees]"
            let lr_AugStat = htmlString.range(of: lv_AugStat)
            let rr_AugStat = htmlString.range(of: rv_AugStat)
            let range_AugStat = lr_AugStat!.upperBound..<rr_AugStat!.lowerBound
            let AugStat = htmlString[range_AugStat]
            let AugValue = Double(AugStat)
            
            let lv_SepStat = "[Sepemployees]"
            let rv_SepStat = "[/Sepemployees]"
            let lr_SepStat = htmlString.range(of: lv_SepStat)
            let rr_SepStat = htmlString.range(of: rv_SepStat)
            let range_SepStat = lr_SepStat!.upperBound..<rr_SepStat!.lowerBound
            let SepStat = htmlString[range_SepStat]
            let SepValue = Double(SepStat)
            
            let lv_OctStat = "[Octemployees]"
            let rv_OctStat = "[/Octemployees]"
            let lr_OctStat = htmlString.range(of: lv_OctStat)
            let rr_OctStat = htmlString.range(of: rv_OctStat)
            let range_OctStat = lr_OctStat!.upperBound..<rr_OctStat!.lowerBound
            let OctStat = htmlString[range_OctStat]
            let OctValue = Double(OctStat)
            
            let lv_NovStat = "[Novemployees]"
            let rv_NovStat = "[/Novemployees]"
            let lr_NovStat = htmlString.range(of: lv_NovStat)
            let rr_NovStat = htmlString.range(of: rv_NovStat)
            let range_NovStat = lr_NovStat!.upperBound..<rr_NovStat!.lowerBound
            let NovStat = htmlString[range_NovStat]
            let NovValue = Double(NovStat)
            
            let lv_DecStat = "[Decemployees]"
            let rv_DecStat = "[/Decemployees]"
            let lr_DecStat = htmlString.range(of: lv_DecStat)
            let rr_DecStat = htmlString.range(of: rv_DecStat)
            let range_DecStat = lr_DecStat!.upperBound..<rr_DecStat!.lowerBound
            let DecStat = htmlString[range_DecStat]
            let DecValue = Double(DecStat)
        
            
            let yValues: [ChartDataEntry] = [
                
                
                ChartDataEntry(x: 1.0, y: JanValue!),
                ChartDataEntry(x: 2.0, y: FebValue!),
                ChartDataEntry(x: 3.0, y: MarValue!),
                ChartDataEntry(x: 4.0, y: AprValue!),
                ChartDataEntry(x: 5.0, y: MayValue!),
                ChartDataEntry(x: 6.0, y: junValue!),
                ChartDataEntry(x: 7.0, y: JulValue!),
                ChartDataEntry(x: 8.0, y: AugValue!),
                ChartDataEntry(x: 9.0, y: SepValue!),
                ChartDataEntry(x: 10.0, y: OctValue!),
                ChartDataEntry(x: 11.0, y: NovValue!),
                ChartDataEntry(x: 12.0, y: DecValue!)
                
            ]
            
            
            let set1 = LineChartDataSet(entries: yValues, label: "Employees in Thousands")
            set1.drawCirclesEnabled = false
//            set1.mode = .cubicBezier
            set1.lineWidth = 3
            set1.setColor(.systemBlue)
            set1.fill = Fill(color: .systemBlue)
            set1.fillAlpha = 0.8
            set1.drawFilledEnabled = true
            set1.highlightColor = .systemRed
            
            
            let data = LineChartData(dataSet: set1)
            data.setDrawValues(true)
            data.setValueTextColor(.black)

            
            DispatchQueue.main.async {
            self.laborStatsChart.data = data
            }
            
        }
        taskintType.resume()
        }
        setData()
        
        
        func SetupPieChartInt() {
            PiewViewFluidInt.chartDescription?.enabled = false
            PiewViewFluidInt.drawHoleEnabled = true
            PiewViewFluidInt.rotationAngle = -75
            PiewViewFluidInt.legend.enabled = false
            PiewViewFluidInt.rotationEnabled = true
            
            var entriesInt: [PieChartDataEntry] = Array()
            
        func SetupPieChart2Int(){
            PieViewLocationInt.chartDescription?.enabled = false
            PieViewLocationInt.drawHoleEnabled = true
            PieViewLocationInt.rotationAngle = -45
            PieViewLocationInt.legend.enabled = false
            PieViewLocationInt.rotationEnabled = true
            
            var entries2Int: [PieChartDataEntry] = Array()
                
            
            
        func setupPieChart(){
            
            pieViewFluid.chartDescription?.enabled = false
            pieViewFluid.drawHoleEnabled = true
            pieViewFluid.rotationAngle = -75
            pieViewFluid.legend.enabled = false
            pieViewFluid.rotationEnabled = true
            
            var entries: [PieChartDataEntry] = Array()
            
            
        func setupPieChart2(){
            PieViewLocation.chartDescription?.enabled = false
            PieViewLocation.drawHoleEnabled = true
            PieViewLocation.rotationAngle = 270
            PieViewLocation.legend.enabled = false
            PieViewLocation.rotationEnabled = true
        
        var entries2: [PieChartDataEntry] = Array()
           
            
        func setupPieChart3(){
            PiewViewOrientation.chartDescription?.enabled = false
            PiewViewOrientation.drawHoleEnabled = true
            PiewViewOrientation.rotationAngle = 290
            PiewViewOrientation.legend.enabled = false
            PiewViewOrientation.rotationEnabled = true
            
            var entries3: [PieChartDataEntry] = Array()
    
            
    let BHurl = URL(string: "https://github.com/AdrianSalinas98/AdrianSalinas98.github.io/blob/master/Data.html")!
            let task = URLSession.shared.dataTask(with: BHurl) { (data, resp, error) in
                guard data == data else {
                    print("data was nil")
                    return
                }

                guard let htmlString = String(data: data!, encoding: String.Encoding.utf8) else {
                    print("cant cast data to string")
                    return
                }
                
                let lv_year = "[current_year_US]"
                let rv_year = "[/current_year_US]"
                let lr_year = htmlString.range(of: lv_year)
                let rr_year = htmlString.range(of: rv_year)
                let range_year = lr_year!.upperBound..<rr_year!.lowerBound
                let year = String(htmlString[range_year])

                let lv_month = "[current_month_US]"
                let rv_month = "[/current_month_US]"
                let lr_month = htmlString.range(of: lv_month)
                let rr_month = htmlString.range(of: rv_month)
                let range_month = lr_month!.upperBound..<rr_month!.lowerBound
                let month = String(htmlString[range_month])
                
                let lv_day = "[current_day_US]"
                let rv_day = "[/current_day_US]"
                let lr_day = htmlString.range(of: lv_day)
                let rr_day = htmlString.range(of: rv_day)
                let range_day = lr_day!.upperBound..<rr_day!.lowerBound
                let day = String(htmlString[range_day])
                
                

                    DispatchQueue.main.async {
                        self.month.text = " \(day)\(month) \(year)"
                    }
                

                let lv_count = "[total_US]"
                let rv_count = "[/total_US]"
                let lr_count = htmlString.range(of: lv_count)
                let rr_count = htmlString.range(of: rv_count)
                let range_count = lr_count!.upperBound..<rr_count!.lowerBound
                let count = String(htmlString[range_count])
                
                    DispatchQueue.main.async {
                        self.RigCount.text = count
                    }
                
                let lv_month_lastw = "[last_week_count]"
                let rv_month_lastw = "[/last_week_count]"
                let lr_month_lastw = htmlString.range(of: lv_month_lastw)
                let rr_month_lastw = htmlString.range(of: rv_month_lastw)
                let range_month_lastw = lr_month_lastw!.upperBound..<rr_month_lastw!.lowerBound
                let month_lastw = htmlString[range_month_lastw]
                let month_last_formattedw = month_lastw.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789").inverted)

                    DispatchQueue.main.async {
                        self.LastWeekCount.text = month_last_formattedw
                    }
                
                if Int(month_last_formattedw)! < 0{
                    DispatchQueue.main.async {
                        self.LastWeekCount.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        self.LastWeekCount.text = "+\(month_last_formattedw)"
                        self.LastWeekCount.textColor = UIColor.green
                    }
                }
                
                        let lv_yearI = "[lastYear_year_int]"
                        let rv_yearI = "[/lastYear_year_int]"
                        let lr_yearI = htmlString.range(of: lv_yearI)
                        let rr_yearI = htmlString.range(of: rv_yearI)
                        let range_yearI = lr_yearI!.upperBound..<rr_yearI!.lowerBound
                        let yearI = htmlString[range_yearI]
                        
                       
                        let lv_monthI = "[lastYear_month_int]"
                        let rv_monthI = "[/lastYear_month_int]"
                        let lr_monthI = htmlString.range(of: lv_monthI)
                        let rr_monthI = htmlString.range(of: rv_monthI)
                        let range_monthI = lr_monthI!.upperBound..<rr_monthI!.lowerBound
                        let monthI = htmlString[range_monthI]
                        DispatchQueue.main.async {
                            self.LastYearInternationalDate.text = "\(monthI) \(yearI)"
                        }
                        
                        let lv_CountI = "[last_year_count_int]"
                        let rv_CountI = "[/last_year_count_int]"
                        let lr_CountI = htmlString.range(of: lv_CountI)
                        let rr_CountI = htmlString.range(of: rv_CountI)
                        let range_CountI = lr_CountI!.upperBound..<rr_CountI!.lowerBound
                        let CountI = htmlString[range_CountI]
                        let CountIF = CountI.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789").inverted)
                        DispatchQueue.main.async {
                            self.LastYearInternational.text = "\(CountIF)"
                        }
                        if Float(CountIF)! < 0 {
                            DispatchQueue.main.async {
                                self.LastYearInternational.textColor = UIColor.red
                            }
                        }
                        else{
                            DispatchQueue.main.async {
                                self.LastYearInternational.text = "+\(CountIF)"
                                self.LastYearInternational.textColor = UIColor.green
                            }
                            
                        }
                        
                        
                        let lv_monthLY = "[last_month_int]"
                        let rv_monthLY = "[/last_month_int]"
                        let lr_monthLY = htmlString.range(of: lv_monthLY)
                        let rr_monthLY = htmlString.range(of: rv_monthLY)
                        let range_monthLY = lr_monthLY!.upperBound..<rr_monthLY!.lowerBound
                        let monthLY = htmlString[range_monthLY]
                        

                        let lv_monthLYm = "[last_month_year_int]"
                        let rv_monthLYm = "[/last_month_year_int]"
                        let lr_monthLYm = htmlString.range(of: lv_monthLYm)
                        let rr_monthLYm = htmlString.range(of: rv_monthLYm)
                        let range_monthLYm = lr_monthLYm!.upperBound..<rr_monthLYm!.lowerBound
                        let monthLYm = htmlString[range_monthLYm]
                        DispatchQueue.main.async {
                            self.LastCountIntDate.text = "\(monthLYm) \(monthLY)"
                        }
                        
                        
                

                

                
                    
                    let lv_usp = "[last_month]"
                    let rv_usp = "[/last_month]"
                    let lr_usp = htmlString.range(of: lv_usp)
                    let rr_usp = htmlString.range(of: rv_usp)
                    let range_usp = lr_usp!.upperBound..<rr_usp!.lowerBound
                    let month_usp = htmlString[range_usp]
                    
                    
                    let lv_uspy = "[last_count_year]"
                    let rv_uspy = "[/last_count_year]"
                    let lr_uspy = htmlString.range(of: lv_uspy)
                    let rr_uspy = htmlString.range(of: rv_uspy)
                    let range_uspy = lr_uspy!.upperBound..<rr_uspy!.lowerBound
                    let month_uspy = htmlString[range_uspy]
                
                    let lv_uspD = "[last_day]"
                    let rv_uspD = "[/last_day]"
                    let lr_uspD = htmlString.range(of: lv_uspD)
                    let rr_uspD = htmlString.range(of: rv_uspD)
                    let range_uspD = lr_uspD!.upperBound..<rr_uspD!.lowerBound
                    let month_uspD = htmlString[range_uspD]
                
                
                    DispatchQueue.main.async {
                        self.LastCountDate.text = "\(month_uspD)\(month_usp) \(month_uspy)"
                    }

                
                    
                    let lv_intm = "[current_month_int]"
                    let rv_intm = "[/current_month_int]"
                    let lr_intm = htmlString.range(of: lv_intm)
                    let rr_intm = htmlString.range(of: rv_intm)
                    let range_intm = lr_intm!.upperBound..<rr_intm!.lowerBound
                    let month_intm = htmlString[range_intm]
                
                
                    let lv_inty = "[current_year_int]"
                    let rv_inty = "[/current_year_int]"
                    let lr_inty = htmlString.range(of: lv_inty)
                    let rr_inty = htmlString.range(of: rv_inty)
                    let range_inty = lr_inty!.upperBound..<rr_inty!.lowerBound
                    let y =  htmlString[range_inty]
                    DispatchQueue.main.async {
                        self.InternationalDate.text = "\(month_intm) \(y)"
                    }
                
                    let lv_int = "[total_int]"
                    let rv_int = "[/total_int]"
                    let lr_int = htmlString.range(of: lv_int)
                    let rr_int = htmlString.range(of: rv_int)
                    let range_int = lr_int!.upperBound..<rr_int!.lowerBound
                    let month_int = htmlString[range_int]
                    let month_int_formatted = month_int.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789").inverted)
                    
                    DispatchQueue.main.async {
                        self.InternationalRigCount.text = "\(month_int_formatted)"
                    }
                    
                    let lv_intc = "[total_int_change]"
                    let rv_intc = "[/total_int_change]"
                    let lr_intc = htmlString.range(of: lv_intc)
                    let rr_intc = htmlString.range(of: rv_intc)
                    let range_intc = lr_intc!.upperBound..<rr_intc!.lowerBound
                    let month_intc = htmlString[range_intc]
                    let month_int_formattedc = month_intc.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789").inverted)
                    DispatchQueue.main.async {
                        self.InternationalRigCountChange.text = "\(month_int_formattedc)"
                    }
                    if Float(month_int_formattedc)! < 0 {
                        DispatchQueue.main.async {
                            self.InternationalRigCountChange.textColor = UIColor.red
                        }
                    }
                    else{
                        DispatchQueue.main.async {
                            self.InternationalRigCountChange.text = "+\(month_int_formattedc)"
                            self.InternationalRigCountChange.textColor = UIColor.green
                        }
                        
                    }
                    
                        let lv_ycount = "[last_year_count_US]"
                        let rv_ycount = "[/last_year_count_US]"
                        let lr_ycount = htmlString.range(of: lv_ycount)
                        let rr_ycount = htmlString.range(of: rv_ycount)
                        let range_ycount = lr_ycount!.upperBound..<rr_ycount!.lowerBound
                        let month_ycount = htmlString[range_ycount]

                        DispatchQueue.main.async {
                            self.USLastYearCount.text = "\(month_ycount)"
                        }
                        if Float(month_ycount)! < 0 {
                            DispatchQueue.main.async {
                                self.USLastYearCount.textColor = UIColor.red
                            }
                        }
                        else{
                            DispatchQueue.main.async {
                                self.USLastYearCount.text = "+\(month_int_formattedc)"
                                self.USLastYearCount.textColor = UIColor.green
                            }
                            
                        }
                            
                        let lv_ymonth = "[last_year_month]"
                        let rv_ymonth = "[/last_year_month]"
                        let lr_ymonth = htmlString.range(of: lv_ymonth)
                        let rr_ymonth = htmlString.range(of: rv_ymonth)
                        let range_ymonth = lr_ymonth!.upperBound..<rr_ymonth!.lowerBound
                        let month_ymonth = htmlString[range_ymonth]

                        let lv_yyear = "[last_year]"
                        let rv_yyear = "[/last_year]"
                        let lr_yyear = htmlString.range(of: lv_yyear)
                        let rr_yyear = htmlString.range(of: rv_yyear)
                        let range_yyear = lr_yyear!.upperBound..<rr_yyear!.lowerBound
                        let month_yyear = htmlString[range_yyear]
                
                        let lv_yDay = "[last_year_day]"
                        let rv_yDay = "[/last_year_day]"
                        let lr_yDay = htmlString.range(of: lv_yDay)
                        let rr_yDay = htmlString.range(of: rv_yDay)
                        let range_yDay = lr_yDay!.upperBound..<rr_yDay!.lowerBound
                        let month_yDay = htmlString[range_yDay]
                
                
                            DispatchQueue.main.async {
                                self.USLastYearCountDate.text = "\(month_yDay)\(month_ymonth) \(month_yyear)"
                            }

            }
            task.resume()
            
    //        --------------------------------------------------------
            let intTypeurl = URL(string: "https://github.com/AdrianSalinas98/AdrianSalinas98.github.io/blob/master/Data.html")!
            let taskintType = URLSession.shared.dataTask(with: intTypeurl) { (data, resp, error) in
                guard data == data else {
                    print("data was nil")
                    return
                }
                
                guard let htmlString = String(data: data!, encoding: String.Encoding.utf8) else {
                    print("cant cast data to string")
                    return
                }
            //    print(htmlString)
                
                let lv_intOil = "[oil]"
                let rv_intOil = "[/oil]"
                let lr_intOil = htmlString.range(of: lv_intOil)
                let rr_intOil = htmlString.range(of: rv_intOil)
                let range_intOil = lr_intOil!.upperBound..<rr_intOil!.lowerBound
                let intOil = htmlString[range_intOil]
                let PieIntOil = Double(intOil)
                entriesInt.append(PieChartDataEntry(value: PieIntOil!, label: "Oil (\(Int(PieIntOil!)))"))
                DispatchQueue.main.async {
                    self.IntOilCount.text = "\(intOil)"
                }
                
                let lv_changeIntOil = "[change_oil]"
                let rv_changeIntOil = "[/change_oil]"
                let lr_changeIntOil = htmlString.range(of: lv_changeIntOil)
                let rr_changeIntOil = htmlString.range(of: rv_changeIntOil)
                let range_changeIntOil = lr_changeIntOil!.upperBound..<rr_changeIntOil!.lowerBound
                let changeIntOil = htmlString[range_changeIntOil]
                DispatchQueue.main.async {
                    self.IntOilChange.text = "\(changeIntOil)"
                }
                if Float(changeIntOil)! < 0 {
                    DispatchQueue.main.async {
                        self.IntOilChange.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        
                        self.IntOilChange.textColor = UIColor.green
                    }
                    
                }
                
                let lv_intGas = "[gas]"
                let rv_intGas = "[/gas]"
                let lr_intGas = htmlString.range(of: lv_intGas)
                let rr_intGas = htmlString.range(of: rv_intGas)
                let range_intGas = lr_intGas!.upperBound..<rr_intGas!.lowerBound
                let intGas = htmlString[range_intGas]
                let PieIntGas = Double(intGas)
                entriesInt.append(PieChartDataEntry(value: PieIntGas!, label: "Gas (\(Int(PieIntGas!)))"))
                DispatchQueue.main.async {
                    self.IntGasCount.text = "\(intGas)"
                }
                
                let lv_changeIntGas = "[change_gas]"
                let rv_changeIntGas = "[/change_gas]"
                let lr_changeIntGas = htmlString.range(of: lv_changeIntGas)
                let rr_changeIntGas = htmlString.range(of: rv_changeIntGas)
                let range_changeIntGas = lr_changeIntGas!.upperBound..<rr_changeIntGas!.lowerBound
                let changeIntGas = htmlString[range_changeIntGas]
                DispatchQueue.main.async {
                    self.IntGasChange.text = "\(changeIntGas)"
                }
                if Float(changeIntGas)! < 0 {
                    DispatchQueue.main.async {
                        self.IntGasChange.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        
                        self.IntGasChange.textColor = UIColor.green
                    }
                    
                }
                
                let lv_intMisc = "[misc]"
                let rv_intMisc = "[/misc]"
                let lr_intMisc = htmlString.range(of: lv_intMisc)
                let rr_intMisc = htmlString.range(of: rv_intMisc)
                let range_intMisc = lr_intMisc!.upperBound..<rr_intMisc!.lowerBound
                let intMisc = htmlString[range_intMisc]
                let PieIntMisc = Double(intMisc)
                entriesInt.append(PieChartDataEntry(value: PieIntMisc!, label: "Misc. (\(Int(PieIntMisc!)))"))
                DispatchQueue.main.async {
                    self.IntMiscCount.text = "\(intMisc)"
                }
                
                let lv_changeIntMisc = "[change_misc]"
                let rv_changeIntMisc = "[/change_misc]"
                let lr_changeIntMisc = htmlString.range(of: lv_changeIntMisc)
                let rr_changeIntMisc = htmlString.range(of: rv_changeIntMisc)
                let range_changeIntMisc = lr_changeIntMisc!.upperBound..<rr_changeIntMisc!.lowerBound
                let changeIntMisc = htmlString[range_changeIntMisc]
                DispatchQueue.main.async {
                    self.IntMiscChange.text = "\(changeIntMisc)"
                }
                if Float(changeIntMisc)! < 0 {
                    DispatchQueue.main.async {
                        self.IntMiscChange.textColor = UIColor.red
                    }
                }
                else if Float(changeIntMisc)! > 0{
                    DispatchQueue.main.async {
                        
                        self.IntMiscChange.textColor = UIColor.green
                    }
                    
                }
                
                else if Float(changeIntMisc)! == 0{
                    DispatchQueue.main.async {
                        
                        self.IntMiscChange.textColor = UIColor.white
                    }
                    
                }
                
                
                
                let lv_intLand = "[Land]"
                let rv_intLand = "[/Land]"
                let lr_intLand = htmlString.range(of: lv_intLand)
                let rr_intLand = htmlString.range(of: rv_intLand)
                let range_intLand = lr_intLand!.upperBound..<rr_intLand!.lowerBound
                let intLand = htmlString[range_intLand]
                let PieIntLand = Double(intLand)
                entries2Int.append(PieChartDataEntry(value: PieIntLand!, label: "Land (\(Int(PieIntLand!)))"))
                
                
                let lv_intOS = "[Offshore]"
                let rv_intOS = "[/Offshore]"
                let lr_intOS = htmlString.range(of: lv_intOS)
                let rr_intOS = htmlString.range(of: rv_intOS)
                let range_intOS = lr_intOS!.upperBound..<rr_intOS!.lowerBound
                let intOS = htmlString[range_intOS]
                let PieIntOS = Double(intOS)
                entries2Int.append(PieChartDataEntry(value: PieIntOS!, label: "Offshore (\(Int(PieIntOS!)))"))
                
               
    //        ---------------------------------------------------------0-0-0-0-0-0-0-0-0-0-0-0-0-0-

            let OGurl = URL(string: "https://github.com/AdrianSalinas98/AdrianSalinas98.github.io/blob/master/Data.html")!
            let taskRigType = URLSession.shared.dataTask(with: OGurl) { (data, resp, error) in
                guard data == data else {
                    print("data was nil")
                    return
                }
                
                let lv_Oil = "[USoil]"
                let rv_Oil = "[/USoil]"
                let lr_Oil = htmlString.range(of: lv_Oil)
                let rr_Oil = htmlString.range(of: rv_Oil)
                let range_Oil = lr_Oil!.upperBound..<rr_Oil!.lowerBound
                let Oil = htmlString[range_Oil]
                let PieOil = Double(Oil)
                entries.append(PieChartDataEntry(value: PieOil!, label: "Oil (\(Int(PieOil!)))"))
                DispatchQueue.main.async {
                    self.OilCount.text = "\(Oil)"
                }
                
                let lv_changeOil = "[USchange_oil]"
                let rv_changeOil = "[/USchange_oil]"
                let lr_changeOil = htmlString.range(of: lv_changeOil)
                let rr_changeOil = htmlString.range(of: rv_changeOil)
                let range_changeOil = lr_changeOil!.upperBound..<rr_changeOil!.lowerBound
                let changeOil = htmlString[range_changeOil]
                DispatchQueue.main.async {
                    self.OilCountChange.text = "\(changeOil)"
                }
                if Float(changeOil)! < 0 {
                    DispatchQueue.main.async {
                        self.OilCountChange.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        
                        self.OilCountChange.textColor = UIColor.green
                    }
                    
                }
                
                let lv_Gas = "[USgas]"
                let rv_Gas = "[/USgas]"
                let lr_Gas = htmlString.range(of: lv_Gas)
                let rr_Gas = htmlString.range(of: rv_Gas)
                let range_Gas = lr_Gas!.upperBound..<rr_Gas!.lowerBound
                let Gas = htmlString[range_Gas]
                let PieGas = Double(Gas)
                entries.append(PieChartDataEntry(value: PieGas!, label: "Gas (\(Int(PieGas!)))"))
                DispatchQueue.main.async {
                    self.GasCount.text = "\(Gas)"
                }
                
                let lv_changeGas = "[USchange_gas]"
                let rv_changeGas = "[/USchange_gas]"
                let lr_changeGas = htmlString.range(of: lv_changeGas)
                let rr_changeGas = htmlString.range(of: rv_changeGas)
                let range_changeGas = lr_changeGas!.upperBound..<rr_changeGas!.lowerBound
                let changeGas = htmlString[range_changeGas]
                DispatchQueue.main.async {
                    self.GasCountChange.text = "\(changeGas)"
                }
                if Float(changeGas)! < 0 {
                    DispatchQueue.main.async {
                        self.GasCountChange.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        
                        self.GasCountChange.textColor = UIColor.green
                    }
                    
                }
                
                let lv_Misc = "[USmisc]"
                let rv_Misc = "[/USmisc]"
                let lr_Misc = htmlString.range(of: lv_Misc)
                let rr_Misc = htmlString.range(of: rv_Misc)
                let range_Misc = lr_Misc!.upperBound..<rr_Misc!.lowerBound
                let Misc = htmlString[range_Misc]
                let PieMisc = Double(Misc)
                entries.append(PieChartDataEntry(value: PieMisc!, label: "Misc. (\(Int(PieMisc!)))"))
                DispatchQueue.main.async {
                    self.MiscCount.text = "\(Misc)"
                }
                
                let lv_changeMisc = "[USchange_misc]"
                let rv_changeMisc = "[/USchange_misc]"
                let lr_changeMisc = htmlString.range(of: lv_changeMisc)
                let rr_changeMisc = htmlString.range(of: rv_changeMisc)
                let range_changeMisc = lr_changeMisc!.upperBound..<rr_changeMisc!.lowerBound
                let changeMisc = htmlString[range_changeMisc]
                DispatchQueue.main.async {
                    self.MiscCountChange.text = "\(changeMisc)"
                }
                if Float(changeMisc)! < 0 {
                    DispatchQueue.main.async {
                        self.MiscCountChange.textColor = UIColor.red
                    }
                }
                else {
                    DispatchQueue.main.async {
                        
                        self.MiscCountChange.textColor = UIColor.green
                    }
                    
                }
                
                
                
                let lv_Land = "[USLand]"
                let rv_Land = "[/USLand]"
                let lr_Land = htmlString.range(of: lv_Land)
                let rr_Land = htmlString.range(of: rv_Land)
                let range_Land = lr_Land!.upperBound..<rr_Land!.lowerBound
                let Land = htmlString[range_Land]
                let PieLand = Double(Land)
                entries2.append(PieChartDataEntry(value: PieLand!, label: "Land (\(Int(PieLand!)))"))
                
                let lv_OS = "[USOffshore]"
                let rv_OS = "[/USOffshore]"
                let lr_OS = htmlString.range(of: lv_OS)
                let rr_OS = htmlString.range(of: rv_OS)
                let range_OS = lr_OS!.upperBound..<rr_OS!.lowerBound
                let OS = htmlString[range_OS]
                let PieOS = Double(OS)
                entries2.append(PieChartDataEntry(value: PieOS!, label: "Offshore (\(Int(PieOS!)))"))
                
                let lv_HorDir = "[USHD]"
                let rv_HorDir = "[/USHD]"
                let lr_HorDir = htmlString.range(of: lv_HorDir)
                let rr_HorDir = htmlString.range(of: rv_HorDir)
                let range_HorDir = lr_HorDir!.upperBound..<rr_HorDir!.lowerBound
                let HorDir = htmlString[range_HorDir]
                let PieHorDir = Double(HorDir)
                entries3.append(PieChartDataEntry(value: PieHorDir!, label: "Horiz./Direc (\(Int(PieHorDir!)))"))
                
                let lv_Vertical = "[USVertical]"
                let rv_Vertical = "[/USVertical]"
                let lr_Vertical = htmlString.range(of: lv_Vertical)
                let rr_Vertical = htmlString.range(of: rv_Vertical)
                let range_Vertical = lr_Vertical!.upperBound..<rr_Vertical!.lowerBound
                let Vertical = htmlString[range_Vertical]
                let PieVertical = Double(Vertical)
                entries3.append(PieChartDataEntry(value: PieVertical!, label: "Vertical (\(Int(PieVertical!)))"))
    
    //        --------------------------------------------------------
            let OPurl = URL(string: "https://oilprice.com/oil-price-charts")!
            let taskOPWTI = URLSession.shared.dataTask(with: OPurl) { (data, resp, error) in
            guard data == data else {
                print("data was nil")
                return
            }

            guard let htmlStringOP = String(data: data!, encoding: String.Encoding.utf8) else {
                print("cant cast data to string")
                return
            }
            //    print(htmlStringOP)
                let leftSideValOP = """
            </td><td>WTI Crude<i
            """
                let rightSideValOP = """
            data-id='46'
            """

                guard let leftRangeOP = htmlStringOP.range(of: leftSideValOP) else {
                    print("cant find left range4")
                    return
                }

                guard let rightRangeOP = htmlStringOP.range(of: rightSideValOP) else{
                    print("cant find right range")
                    return
                }
                let rangeofValOP = leftRangeOP.upperBound..<rightRangeOP.lowerBound
                let outpOP = String(htmlStringOP[rangeofValOP])
            //    print(outpOP)
                let trimmedOP = String(outpOP.unicodeScalars.filter(CharacterSet.whitespacesAndNewlines.inverted.contains))
    //            print(trimmedOP)

                let lv_price = "last_price'data-price="
                let rv_price = "'>"
                let lr_price = trimmedOP.range(of: lv_price)
                let rr_price = trimmedOP.range(of: rv_price)
                let range_price = lr_price!.upperBound..<rr_price!.lowerBound
                let Price = trimmedOP[range_price]
                let PriceFormatted = Price.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)
             
                    DispatchQueue.main.async {
                        self.WTIPrice.text = "\(PriceFormatted)"
                    }
                
                let lv_priceWTIc = "flat_change_cell'>"
                let rv_priceWTIc = "percent_change_cell'"
                guard let lr_priceWTIc = trimmedOP.range(of: lv_priceWTIc) else {
                    DispatchQueue.main.async {
                        self.NGChange.text = "--.--"
                    }
                return
                }
                guard let rr_priceWTIc = trimmedOP.range(of: rv_priceWTIc) else {
                    DispatchQueue.main.async {
                        self.NGChange.text = "--.--"
                    }
                return
                }
                let range_priceWTIc = lr_priceWTIc.upperBound..<rr_priceWTIc.lowerBound
                let PriceWTIc = trimmedOP[range_priceWTIc]
                let PriceFormattedWTIc = PriceWTIc.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)

                    DispatchQueue.main.async {
                        self.WTIChange.text = "\(PriceFormattedWTIc)%"
                    }

                if Float(PriceFormattedWTIc)! < 0{
                    DispatchQueue.main.async {
                        self.WTIChange.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        self.WTIChange.text = "+\(PriceFormattedWTIc)%"
                        self.WTIChange.textColor = UIColor.green
                    }
                }

            }
            taskOPWTI.resume()

            let OPurlBrent = URL(string: "https://oilprice.com/oil-price-charts")!
            let taskOPBrent = URLSession.shared.dataTask(with: OPurlBrent) { (data, resp, error) in
            guard data == data else {
                print("data was nil")
                return
            }

            guard let htmlStringOPBrent = String(data: data!, encoding: String.Encoding.utf8) else {
                print("cant cast data to string")
                return
            }
//                print(htmlStringOPBrent)
                let leftSideValOPBrent = """
            </td><td>Brent Crude<i
            """
                let rightSideValOPBrent = """
            data-id='50'
            """

                guard let leftRangeOPBrent = htmlStringOPBrent.range(of: leftSideValOPBrent) else {
                    print("cant find left range5")
                    return
                }

                guard let rightRangeOPBrent = htmlStringOPBrent.range(of: rightSideValOPBrent) else{
                    print("cant find right rangEE")
                    return
                }
                let rangeofValOPBrent = leftRangeOPBrent.upperBound..<rightRangeOPBrent.lowerBound
                let outpOPBrent = String(htmlStringOPBrent[rangeofValOPBrent])
            //    print(outpOP)
                let trimmedOPBrent = String(outpOPBrent.unicodeScalars.filter(CharacterSet.whitespacesAndNewlines.inverted.contains))
    //            print(trimmedOPBrent)

                let lv_priceBrent = "last_price'data-price="
                let rv_priceBrent = "'>"
                let lr_priceBrent = trimmedOPBrent.range(of: lv_priceBrent)
                let rr_priceBrent = trimmedOPBrent.range(of: rv_priceBrent)
                let range_priceBrent = lr_priceBrent!.upperBound..<rr_priceBrent!.lowerBound
                let PriceBrent = trimmedOPBrent[range_priceBrent]
                let PriceFormattedBrent = PriceBrent.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)

                    DispatchQueue.main.async {
                        self.BrentPrice.text = "\(PriceFormattedBrent)"
                }
                let lv_priceBrentc = "flat_change_cell'>"
                let rv_priceBrentc = "percent_change_cell'"
                guard let lr_priceBrentc = trimmedOPBrent.range(of: lv_priceBrentc) else {
                    DispatchQueue.main.async {
                        self.BrentChange.text = "--.--"
                    }
                return
                }
                guard let rr_priceBrentc = trimmedOPBrent.range(of: rv_priceBrentc) else {
                    DispatchQueue.main.async {
                        self.BrentChange.text = "--.--"
                    }
                return
                }
                let range_priceBrentc = lr_priceBrentc.upperBound..<rr_priceBrentc.lowerBound
                let PriceBrentc = trimmedOPBrent[range_priceBrentc]
                let PriceFormattedBrentc = PriceBrentc.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)

                    DispatchQueue.main.async {
                        self.BrentChange.text = "\(PriceFormattedBrentc)%"
                }
                if Float(PriceFormattedBrentc)! < 0{
                    DispatchQueue.main.async {
                        self.BrentChange.textColor = UIColor.red
                    }
                }
                else{
                    DispatchQueue.main.async {
                        self.BrentChange.text = "+\(PriceFormattedBrentc)%"
                        self.BrentChange.textColor = UIColor.green
                    }
                }
                
                }
            taskOPBrent.resume()
//        --------------------------------------------------------
          let OPurlopec = URL(string: "https://oilprice.com/oil-price-charts")!
                let taskOPopec = URLSession.shared.dataTask(with: OPurlopec) { (data, resp, error) in
                guard data == data else {
                    print("data was nil")
                    return
                }

                guard let htmlStringOPopec = String(data: data!, encoding: String.Encoding.utf8) else {
                    print("cant cast data to string")
                    return
                }
                //    print(htmlStringOPopec)
                    let leftSideValOPopec = """
                </td><td>Opec Basket<i
                """
                    let rightSideValOPopec = """
                data-id='68'
                """
                    
                    guard let leftRangeOPopec = htmlStringOPopec.range(of: leftSideValOPopec) else {
                        print("cant find left rang6")
                        return
                    }
                    
                    guard let rightRangeOPopec = htmlStringOPopec.range(of: rightSideValOPopec) else{
                        print("cant find right rangEE")
                        return
                    }
                    let rangeofValOPopec = leftRangeOPopec.upperBound..<rightRangeOPopec.lowerBound
                    let outpOPopec = String(htmlStringOPopec[rangeofValOPopec])
//                    print(outpOPopec)
                    let trimmedOPopec = String(outpOPopec.unicodeScalars.filter(CharacterSet.whitespacesAndNewlines.inverted.contains))
//                    print(trimmedOPopec)
                    

                    
                    let lv_priceopec = "last_price'data-price="
                    let rv_priceopec = "'>"
                    let lr_priceopec = trimmedOPopec.range(of: lv_priceopec)
                    let rr_priceopec = trimmedOPopec.range(of: rv_priceopec)
                    let range_priceopec = lr_priceopec!.upperBound..<rr_priceopec!.lowerBound
                    let Priceopec = trimmedOPopec[range_priceopec]
                    let PriceFormattedopec = Priceopec.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)
//                    print(PriceFormattedopec)
                    DispatchQueue.main.async {
                            self.OPECPrice.text = "\(PriceFormattedopec)"
                    }
                    
                    let lv_priceopecC = "<tdclass='change"
                    let rv_priceopecC = "<spanclass='blend_update_text'>"
                    guard let lr_priceopecC = trimmedOPopec.range(of: lv_priceopecC) else {
                        DispatchQueue.main.async {
                            self.OPECChange.text = "--.--"
                        }
                        return
                    }
                    guard let rr_priceopecC = trimmedOPopec.range(of: rv_priceopecC) else {
                        DispatchQueue.main.async {
                            self.OPECChange.text = "--.--"
                        }
                        return
                    }
                    let range_priceopecC = lr_priceopecC.upperBound..<rr_priceopecC.lowerBound
                    let priceopecC = trimmedOPopec[range_priceopecC]
                    let PriceFormattedopecC = priceopecC.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)
//                    print(PriceFormattedopecC)
                    DispatchQueue.main.async {
                        self.OPECChange.text = "\(PriceFormattedopecC)%"
                    }
                    if Float(PriceFormattedopecC)! < 0 {
                        DispatchQueue.main.async {
                            self.OPECChange.textColor = UIColor.red
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            self.OPECChange.text = "+\(PriceFormattedopecC)%"
                            self.OPECChange.textColor = UIColor.green
                        }
                    }
                }
                taskOPopec.resume()
                
//        --------------------------------------------------------

    let OPurlNG = URL(string: "https://oilprice.com/oil-price-charts")!
    let taskNG = URLSession.shared.dataTask(with: OPurlNG) { (data, resp, error) in
    guard data == data else {
        print("data was nil")
        return
    }
     

    guard let htmlStringNG = String(data: data!, encoding: String.Encoding.utf8) else {
        print("cant cast data to string")
        return
    }
    //    print(htmlStringOP)
        let leftSideValNG = """
    ></td><td>Natural Gas<i
    """
        let rightSideValNG = """
    data-id='52'
    """
    //    print(htmlStringOP)
        
        guard let leftRangeNG = htmlStringNG.range(of: leftSideValNG) else {
            print("cant find left range7")
            return
        }
        
        guard let rightRangeNG = htmlStringNG.range(of: rightSideValNG) else{
            print("cant find right range")
            return
        }
        let rangeofValNG = leftRangeNG.upperBound..<rightRangeNG.lowerBound
        let outpNG = String(htmlStringNG[rangeofValNG])
    //    print(outpNG)
        let trimmedNG = String(outpNG.unicodeScalars.filter(CharacterSet.whitespacesAndNewlines.inverted.contains))
    //    print(trimmedNG)
        
        let lv_priceNG = "last_price'data-price="
        let rv_priceNG = "'>"
        let lr_priceNG = trimmedNG.range(of: lv_priceNG)
        let rr_priceNG = trimmedNG.range(of: rv_priceNG)
        let range_priceNG = lr_priceNG!.upperBound..<rr_priceNG!.lowerBound
        let PriceNG = trimmedNG[range_priceNG]
        let PriceFormattedNG = PriceNG.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)

            DispatchQueue.main.async {
                self.NaturalGasPrice.text = "\(PriceFormattedNG)"
                self.NGChange.text = self.NaturalGasPrice.text
            
        }

        let lv_priceNGc = "flat_change_cell'>"
        let rv_priceNGc = "percent_change_cell'"
        guard let lr_priceNGc = trimmedNG.range(of: lv_priceNGc) else {
                DispatchQueue.main.async {
                    self.NGChange.text = "--.--"
                }
            return
            }
        
        guard let rr_priceNGc = trimmedNG.range(of: rv_priceNGc) else {
                DispatchQueue.main.async {
                self.NGChange.text = "--.--"
                
            }
            return
                }
        let range_priceNGc = lr_priceNGc.upperBound..<rr_priceNGc.lowerBound
            
        let PriceNGc = trimmedNG[range_priceNGc]
           
        let PriceFormattedNGc = PriceNGc.trimmingCharacters(in: CharacterSet(charactersIn: "-0123456789.").inverted)

            DispatchQueue.main.async {
                self.NGChange.text = "\(PriceFormattedNGc)%"
            }
        
        if Float(PriceFormattedNGc)! < 0{
            DispatchQueue.main.async {
                self.NGChange.textColor = UIColor.red
            }
        }
        else{
            DispatchQueue.main.async {
            self.NGChange.text = "+\(PriceFormattedNGc)%"
            self.NGChange.textColor = UIColor.green
            }
        }
    }
    taskNG.resume()
            
            let dataSet2 = PieChartDataSet(entries: entries2, label: "")
            let darkBlue = NSUIColor(hex: 0x0000B4)
            let orange = NSUIColor(hex: 0xFF6931)
            
            dataSet2.colors = [orange,darkBlue]
            dataSet2.drawValuesEnabled = false
            DispatchQueue.main.async {
                self.PieViewLocation.data = PieChartData(dataSet: dataSet2)
                }
                
                let dataSet3 = PieChartDataSet(entries: entries3, label: "")
                let pink = NSUIColor(hex: 0xC05BFF)
                let teal = NSUIColor(hex: 0x00A4A6)
                
                dataSet3.colors = [pink,teal]
                dataSet3.drawValuesEnabled = false
                DispatchQueue.main.async {
                    self.PiewViewOrientation.data = PieChartData(dataSet: dataSet3)
                }
                

            let dataSet = PieChartDataSet(entries: entries, label: "")
            let red = NSUIColor(hex: 0xFF0000)
            let green = NSUIColor(hex: 0x00B300)
            let silver = NSUIColor(hex: 0xC0C0C0)
            
            dataSet.colors = [green, red, silver]
            dataSet.drawValuesEnabled = false
                DispatchQueue.main.async {
                self.pieViewFluid.data = PieChartData(dataSet: dataSet)
                }
                
            let dataSetInt = PieChartDataSet(entries: entriesInt, label: "")
            let redInt = NSUIColor(hex: 0xFF0000)
            let greenInt = NSUIColor(hex: 0x00B300)
            let silverInt = NSUIColor(hex: 0xC0C0C0)
            
            dataSetInt.colors = [greenInt, redInt, silverInt]
            dataSetInt.drawValuesEnabled = false
                DispatchQueue.main.async {
                self.PiewViewFluidInt.data = PieChartData(dataSet: dataSetInt)
                }
            
            let dataSetInt2 = PieChartDataSet(entries: entries2Int, label: "")
            let darkBlue2 = NSUIColor(hex: 0x0000B4)
            let orange2 = NSUIColor(hex: 0xFF6931)
            
            dataSetInt2.colors = [orange2, darkBlue2]
            dataSetInt2.drawValuesEnabled = false
                DispatchQueue.main.async {
                self.PieViewLocationInt.data = PieChartData(dataSet: dataSetInt2)
                }
                
                }
                    taskRigType.resume()
                }
                    taskintType.resume()
                }
                    setupPieChart3()
                }
                    setupPieChart2()
        }
        setupPieChart()
            
        }
        SetupPieChart2Int()
                
        }
        SetupPieChartInt()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Do any additional setup after loading the view.
        
       
        laborStatsChart.rightAxis.enabled = false
        laborStatsChart.backgroundColor = .white
        laborStatsChart.animate(xAxisDuration: 1.5)
        laborStatsChart.leftAxis.axisMinimum = 150
        laborStatsChart.legend.textColor = .black
        
        
        let yAxis = laborStatsChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(8, force: false)
        yAxis.labelTextColor = .black
        yAxis.axisLineColor = .black
        
        let xAxis = laborStatsChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.setLabelCount(12, force: true)
        xAxis.labelTextColor = .white
        xAxis.axisLineColor = .black
        
        
        
        
        
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        
//        real ID vvv
//        bannerView.adUnitID = "ca-app-pub-9327866905939676/5704402687"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
        
        isTimerOn.toggle()
        toggleTimer(on: isTimerOn)
        
        

        RigCount.delegate = self
        LastWeekCount.delegate = self
        WTIPrice.delegate = self
        BrentPrice.delegate = self
        NaturalGasPrice.delegate = self
        WTIChange.delegate = self
        BrentChange.delegate = self
        NGChange.delegate = self
        InternationalRigCount.delegate = self
        InternationalRigCountChange.delegate = self
        InternationalDate.delegate = self
        USLastYearCount.delegate = self
        USLastYearCountDate.delegate = self
        LastCountDate.delegate = self
        LastYearInternational.delegate = self
        LastYearInternationalDate.delegate = self
        LastCountIntDate.delegate = self
        OilCount.delegate = self
        OilCountChange.delegate = self
        GasCount.delegate = self
        GasCountChange.delegate = self
        MiscCount.delegate = self
        MiscCountChange.delegate = self
        OPECPrice.delegate = self
        OPECChange.delegate = self
        IntOilCount.delegate = self
        IntOilChange.delegate = self
        IntGasCount.delegate = self
        IntGasChange.delegate = self
        IntMiscCount.delegate = self
        IntMiscChange.delegate = self


        bannerView.delegate = self
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    
    
    
    
    

}

extension UIViewController: GADBannerViewDelegate {
    
    
    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("recieved ad")
    }
    
    public func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
    
}






