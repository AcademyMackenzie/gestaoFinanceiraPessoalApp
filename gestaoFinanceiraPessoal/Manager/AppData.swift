//
//  AppData.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 20/01/22.
//

import Foundation
import CloudKit

struct Wallet {
    let walletDescription: String
    let walletName: String
    let walletType: String
    let walletValue: Double
    let record: CKRecord
}

struct Transaction {
    let transactionCategory: String
    let transactionDate: Date
    let transactionDescription: String
    let transactionFrequency: String
    let transactionName: String
    let transactionOrigenOrDestination: String
    let transactionRepetition: Int
    let transactionType: String
    let transactionValue: Double
    let record: CKRecord
    
}

struct Goal {
    let goalName: String
    let goalValue: Double
    let goalCategory: String
    let goalSaved: Double
    let record: CKRecord
}

struct TransactionGoal {
    let transactionGoalName: String
    let transactionGoalValue: Double
    let transactionGoalDate: Date
    let transactionGoalType: String
    let record: CKRecord
}

struct WalletViewModel: Identifiable {
    let id: CKRecord.ID
    let wallet: Wallet
    
    var walletName: String {
        return wallet.walletName
    }
    
    var walletType: String {
        return wallet.walletType
    }
    
    var walletValue: Double {
        return wallet.walletValue
    }
    
    var walletDescription: String {
        return wallet.walletDescription
    }
    
}

struct TransactionViewModel: Identifiable {
    let id: CKRecord.ID
    let transaction: Transaction
    
    var transactionName: String {
        return transaction.transactionName
    }
    
    var transactionDescription: String {
        return transaction.transactionDescription
    }
    
    var transactionDate: Date {
        return transaction.transactionDate
    }
    
    var transactionCategory: String {
        return transaction.transactionCategory
    }
    
    var transactionFrequency: String {
        return transaction.transactionFrequency
    }
    
    var transactionRepetition: Int {
        return transaction.transactionRepetition
    }
    
    var transactionType: String {
        return transaction.transactionType
    }
    
    var transactionValue: Double {
        return transaction.transactionValue
    }
    
    var transactionOrignOrDestination: String {
        return transaction.transactionOrigenOrDestination
    }
    
}

struct GoalViewModel: Identifiable {
    let id: CKRecord.ID
    let goal: Goal
    
    var goalName: String {
        return goal.goalName
    }
    
    var goalValue: Double {
        return goal.goalValue
    }
    
    var goalCategory: String {
        return goal.goalCategory
    }
    
    var goalSaved: Double {
        return goal.goalSaved
    }
    
}

struct TransactionGoalViewModel: Identifiable {
    let id: CKRecord.ID
    let transactionGoal: TransactionGoal
    
    var transactionGoalName: String {
        return transactionGoal.transactionGoalName
    }
    
    var transactionGoalValue: Double {
        return transactionGoal.transactionGoalValue
    }
    
    var transactionGoalDate: Date {
        return transactionGoal.transactionGoalDate
    }
    
    var transactionGoalType: String {
        return transactionGoal.transactionGoalType
    }
}


class AppData: ObservableObject {
    @Published var listWallets: [WalletViewModel] = []
    @Published var listTransactions: [TransactionViewModel] = []
    @Published var listGoals: [GoalViewModel] = []
    @Published var listTransactionsGoals: [TransactionGoalViewModel] = []
    var database: CKDatabase!
    
    init() {
        let container = CKContainer.default()
        database = container.privateCloudDatabase
        
        self.readWallets()
        self.readTransactions()
        self.readGoals()
        
    }
    
    
    func insertWallet(name: String, description: String, type: String, value: Double ) {
        let id = CKRecord.ID(recordName: "idwallet-\(UUID())")
        let record = CKRecord(recordType: "Wallet", recordID: id)
        record.setObject(name as NSString, forKey: "walletName")
        record.setObject(description as NSString, forKey: "walletDescription")
        record.setObject(type as NSString, forKey: "walletType")
        record.setObject(value as NSNumber, forKey: "walletValue")
        
        database.save(record, completionHandler: { (recordSaved, error) in
            if error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    let newWallet = Wallet(
                        walletDescription: record["walletDescription"] as! String,
                        walletName: record["walletName"] as! String,
                        walletType: record["walletType"] as! String,
                        walletValue: record["walletValue"] as! Double,
                        record: record)
                    let newItem = WalletViewModel(id: record.recordID, wallet: newWallet)
                    self.listWallets.append(newItem)
                    self.listWallets.sort(by: {$0.walletName < $1.walletName })
                    
                }
            } else {
                print("Error: record not saved \(error!)")
            }
        })
    }
    
    func readWallets() {
        let predicate = NSPredicate(format: "TRUEPREDICATE")
        let query = CKQuery(recordType: "Wallet", predicate: predicate)
        database.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            if let list = records, error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    self.listWallets = []
                    for record in list {
                        let newWallet = Wallet(
                            walletDescription: record["walletDescription"] as! String,
                            walletName: record["walletName"] as! String, walletType: record["walletType"] as! String,
                            walletValue: record["walletValue"] as! Double,
                            record: record)
                        let newItem = WalletViewModel(id: record.recordID, wallet: newWallet)
                        self.listWallets.append(newItem)
                    }
                    self.listWallets.sort(by: {$0.walletName < $1.walletName })
                }
            } else {
                print("Error: records not found \(error!)")
            }
            
        })
    }
    
    func insertTransaction(value: Double, name: String, description: String, date: Date, category: String, origenDestination: String, frequency: String, repetition: Int, type: String) {
        
        let id = CKRecord.ID(recordName: "idtransaction-\(UUID())")
        let record = CKRecord(recordType: "Transaction", recordID: id)
        record.setObject(value as NSNumber, forKey: "transactionValue")
        record.setObject(name as NSString, forKey: "transactionName")
        record.setObject(description as NSString, forKey: "transactionDescription")
        record.setObject(date as NSDate, forKey: "transactionDate")
        record.setObject(category as NSString, forKey: "transactionCategory")
        record.setObject(origenDestination as NSString, forKey: "transactionOrigenOrDestination")
        record.setObject(frequency as NSString, forKey: "transactionFrequency")
        record.setObject(repetition as NSNumber, forKey: "transactionRepetition")
        record.setObject(type as NSString, forKey: "transactionType")
        
        
        database.save(record, completionHandler: { (recordSaved, error) in
            if error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    let newTransaction = Transaction(
                        transactionCategory: record["transactionCategory"] as! String,
                        transactionDate: record["transactionDate"] as! Date,
                        transactionDescription: record["transactionDescription"] as! String,
                        transactionFrequency: record["transactionFrequency"] as! String,
                        transactionName: record["transactionName"] as! String,
                        transactionOrigenOrDestination: record["transactionOrigenOrDestination"] as! String,
                        transactionRepetition: record["transactionRepetition"] as! Int,
                        transactionType: record["transactionType"] as! String,
                        transactionValue: record["transactionValue"] as! Double,
                        record: record)
                    let newItem = TransactionViewModel(id: record.recordID, transaction: newTransaction)
                    self.listTransactions.append(newItem)
                    self.listTransactions.sort(by: { $0.transactionName < $1.transactionName})
                }
            } else {
                print("Error: record not saved \(error!)")
            }
        })
    }
    
    
    func readTransactions() {
        let predicate = NSPredicate(format: "TRUEPREDICATE")
        let query = CKQuery(recordType: "Transaction", predicate: predicate)
        database.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            if let list = records, error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    self.listTransactions = []
                    for record in list {
                        let newTransaction = Transaction(
                            transactionCategory: record["transactionCategory"] as! String,
                            transactionDate: record["transactionDate"] as! Date,
                            transactionDescription: record["transactionDescription"] as! String,
                            transactionFrequency: record["transactionFrequency"] as! String ,
                            transactionName: record["transactionName"] as! String,
                            transactionOrigenOrDestination: record["transactionOrigenOrDestination"] as! String ,
                            transactionRepetition: record["transactionRepetition"] as! Int,
                            transactionType: record["transactionType"] as! String ,
                            transactionValue: record["transactionValue"] as! Double,
                            record: record)
                        let newItem = TransactionViewModel(id: record.recordID, transaction: newTransaction)
                        self.listTransactions.append(newItem)
                    }
                    self.listTransactions.sort(by: { $0.transactionName < $1.transactionName})
                }
            } else {
                print("Error: records not found \(error!)")
            }
        })
    }
    
    
    func insertGoals(name: String, value: Double, category: String, savedMoney: Double) {
        let id = CKRecord.ID(recordName: "idgoal-\(UUID())")
        let record = CKRecord(recordType: "Goal", recordID: id)
        record.setObject(name as NSString, forKey: "goalName")
        record.setObject(value as NSNumber, forKey: "goalValue")
        record.setObject(category as NSString, forKey: "goalCategory")
        record.setObject(savedMoney as NSNumber, forKey: "goalSaved")
        
        database.save(record, completionHandler: { (recordSaved, error) in
            if error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    let newGoal = Goal(
                        goalName: record["goalName"] as! String,
                        goalValue: record["goalValue"] as! Double,
                        goalCategory: record["goalCategory"] as! String,
                        goalSaved: record["goalSaved"] as! Double,
                        record: record)
                    let newItem = GoalViewModel(id: record.recordID, goal: newGoal)
                    self.listGoals.append(newItem)
                    self.listGoals.sort(by: { $0.goalName < $1.goalName })
                }
            } else {
                print("Error: record not saved \(error!)")
            }
        })
    }
    
    func readGoals() {
        let predicate = NSPredicate(format: "TRUEPREDICATE")
        let query = CKQuery(recordType: "Goal", predicate: predicate)
        database.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            if let list = records, error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    self.listGoals = []
                    for record in list {
                        let newGoal = Goal(
                            goalName: record["goalName"] as! String,
                            goalValue: record["goalValue"] as! Double,
                            goalCategory: record["goalCategory"] as! String,
                            goalSaved: record["goalSaved"] as! Double,
                            record: record)
                        let newItem = GoalViewModel(id: record.recordID, goal: newGoal)
                        self.listGoals.append(newItem)
                    }
                    self.listGoals.sort(by: {$0.goalName < $1.goalName })
                }
            } else {
                print("Error: records not found \(error!)")
            }
            
        })
    }
    
    
    func insertTransactionsGoals(name: String, value: Double, date: Date, type: String, goal: CKRecord.ID) {
        let id = CKRecord.ID(recordName: "idtransactionGoal-\(UUID())")
        let record = CKRecord(recordType: "TransactionGoal", recordID: id)
        record.setObject(name as NSString, forKey: "transactionGoalName")
        record.setObject(value as NSNumber, forKey: "transactionGoalValue")
        record.setObject(date as NSDate, forKey: "transactionGoalDate")
        record.setObject(type as NSString, forKey: "transactionGoalType")
        
        
        let reference = CKRecord.Reference(recordID: goal, action: .deleteSelf)
        record.setObject(reference, forKey: "goal")
        
        database.save(record, completionHandler: { (recordSaved, error) in
            if error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    let newTransactionGoal = TransactionGoal(
                        transactionGoalName: record["transactionGoalName"] as! String,
                        transactionGoalValue: record["transactionGoalValue"] as! Double,
                        transactionGoalDate: record["transactionGoalDate"] as! Date,
                        transactionGoalType: record["transactionGoalType"] as! String,
                        record: record)
                    let newItem = TransactionGoalViewModel(id: record.recordID, transactionGoal: newTransactionGoal)
                    self.listTransactionsGoals.append(newItem)
                    self.listTransactionsGoals.sort(by: { $0.transactionGoalName < $1.transactionGoalName })
                }
            } else {
                print("Error: record not saved \(error!)")
            }
        })
    }
    
    func readTransactionsGoals(goal: CKRecord.ID) {
        let predicate = NSPredicate(format: "goal = %@", goal)
        let query = CKQuery(recordType: "TransactionGoal", predicate: predicate)
        database.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            if let list = records, error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    self.listTransactionsGoals = []
                    for record in list {
                        let newTransactionGoal = TransactionGoal(
                            transactionGoalName: record["transactionGoalName"] as! String,
                            transactionGoalValue: record["transactionGoalValue"] as! Double,
                            transactionGoalDate: record["transactionGoalDate"] as! Date,
                            transactionGoalType: record["transactionGoalType"] as! String,
                            record: record)
                        let newItem = TransactionGoalViewModel(id: record.recordID, transactionGoal: newTransactionGoal)
                        self.listTransactionsGoals.append(newItem)
                    }
                    self.listTransactionsGoals.sort(by: { $0.transactionGoalName < $1.transactionGoalName })
                }
            } else {
                print("Error: records not found \(error!)")
            }
        })
    }
    
}
