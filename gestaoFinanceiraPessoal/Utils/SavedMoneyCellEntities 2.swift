//
//  SavedMoneyCellEntities.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import Foundation
import SwiftUI

struct SavedMoneyCellEntities : Identifiable {
    var id: String
    
    var savedMoneyName: String
    var moneyToSave: Double
    var moneyAlreadySaved : Double
    
    
}
