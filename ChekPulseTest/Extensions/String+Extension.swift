//
//  String+Extension.swift
//  ChekPulseTest
//
//  Created by lugin on 9.08.23.
//

import Foundation

extension String{
    var asUrl: URL? {
        return URL(string: self)
    }
}
