//
//  Extension.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
extension Data {
    func printString(){
        
        print(String(bytes: self, encoding: .utf8))
    }
}
