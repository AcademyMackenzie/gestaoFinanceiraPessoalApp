//
//  NumberFormatter.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import Foundation
import SwiftUI

//let formatter: NumberFormatter = {
//    let formatter = NumberFormatter()
//    formatter.numberStyle = .decimal
//    formatter.locale = Locale(identifier: "pt_BR")
//    formatter.minimumFractionDigits = 2
//    return formatter
//}()

let moneyBRFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.locale = Locale(identifier: "pt_BR")
    formatter.minimumFractionDigits = 2
    return formatter
}()
