//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Viacheslav Dulnev on 21.01.2022.
//

import Foundation

class TipCalculator {
    func calculate(total: Double, tipPersantage: Double) throws -> Double {
        if (total < 0) {
            throw TipCalculatorError.invalidInput
        }
        return total * tipPersantage
    }
}
