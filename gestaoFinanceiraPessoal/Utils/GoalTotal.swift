//
//  SavedMoneyCellEntities.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 17/01/22.
//

import Foundation
import SwiftUI

class GoalTotal {
    
    @EnvironmentObject var appData: AppData
    
    var goalTotal: [Double] = []
    
    func GoalTotal() {
        ForEach(appData.listGoals) {_ in
            let goal = appData.listGoals.goalValue
            
            goalTotal.append()
        }
       
        
        
    }
    
}

