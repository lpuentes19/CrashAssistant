//
//  Date+Conversion.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/30/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation

extension NSDate {

    func toString( dateFormat format  : String ) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
    
}
