//
//  Double+Conversion.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 20/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import Foundation

extension Double  {
    
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}
