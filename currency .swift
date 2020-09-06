//
//  currency .swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 8/21/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import Foundation

struct Currency: Codable {
    var rates: cData

   
}

struct cData: Codable {
    
       var EUR: Float // Euro
       var CAD: Float // canadian dollar
       var HKD: Float // Hong Kong DOllar
       var JPY: Float // Japanese Yen
       var CNY: Float // Chinese Yuan
       var AUD: Float // Australian Dollar
       var GBP: Float // British Pound
       var INR: Float // Indian Rupee
       var MXN: Float // Mexican Peso
       var PHP: Float // Philippine Peso
       var CHF: Float // Swiss Franc
       var KRW: Float // Korean Won
    
}
