//
//  TransactionsCellEntities.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 14/01/22.
//

import Foundation
import SwiftUI

struct TransactionsCellEntities : Identifiable {
    var id: String
    
    var transactionName: String
    var transactionColor: String
    var transactionSymbol: String
    var transactionValue: Double
    
    
}
//tipo de transação : Entrada (+, verde)soma , saída (-, vermelho)subtrai, guardado(+, azul)subtrai, retirado(+, verde)soma
