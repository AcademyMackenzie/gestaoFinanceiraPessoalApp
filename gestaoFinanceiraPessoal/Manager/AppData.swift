//
//  AppData.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 20/01/22.
//

import Foundation
import CloudKit

struct Wallet {
    var walletDescription: String
    var walletName: String
    var walletType: String
    var walletValue: Double
    var record: CKRecord
}

struct Transaction {
    var transactionCategory: String
    var transactionDate: Date
    var transactionDescription: String
    var transactionFrequency: String
    var transactionName: String
    var transactionOrigenOrDestination: String
    var transactionRepetition: Int
    var transactionType: String
    var transactionValue: Double
    var record: CKRecord
    
}

struct WalletViewModel: Identifiable {
    let id: CKRecord.ID
    let wallet: Wallet
    
    var walletName: String {
        return wallet.walletName ?? "Undefined"
    }
}

struct TransactionViewModel: Identifiable {
    let id: CKRecord.ID
    let transaction: Transaction
    
    var transactionName: String {
        return transaction.transactionName ?? "Undefined"
    }
}


class AppData: ObservableObject {
    @Published var listWallets: [WalletViewModel] = []
    @Published var listTransactions: [TransactionViewModel] = []
    var database: CKDatabase!
    
    init() {
        let container = CKContainer.default()
        database = container.privateCloudDatabase
        
        self.readWallets()
    }
    
    
    func insertWallet(name: String, description: String, type: String, value: Double ) {
        let id = CKRecord.ID(recordName: "idWallet-\(UUID())")
        let record = CKRecord(recordType: "Wallet", recordID: id)
        record.setObject(name as NSString, forKey: "walletName")
        record.setObject(description as NSString, forKey: "walletDescription")
        record.setObject(type as NSString, forKey: "walletType")
        record.setObject(value as NSNumber, forKey: "walletValue")
        
        database.save(record, completionHandler: { (recordSaved, error) in
            if error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    let newWallet = Wallet(walletDescription: record["walletDescription"] as! String, walletName: record["walletName"] as! String, walletType: record["walletType"] as! String, walletValue: record["walletValue"] as! Double, record: record)
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
                        let newWallet = Wallet(walletDescription: record["walletDescription"] as! String, walletName: record["walletName"] as! String, walletType: record["walletType"] as! String, walletValue: record["walletValue"] as! Double, record: record)
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
    
    func insertTransaction(value: Double, name: String, description: String, date: Date, category: String, origenDestination: String, frequency: String, repetition: Int, type: String, wallet: CKRecord.ID) {
        
        let id = CKRecord.ID(recordName: "idTransaction-\(UUID())")
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
        
        let reference = CKRecord.Reference(recordID: wallet, action: .deleteSelf)
        record.setObject(reference, forKey: "wallet")
        
        database.save(record, completionHandler: { (recordSaved, error) in
            if error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    let newTransaction = Transaction(transactionCategory: record["transactionCategory"] as! String, transactionDate: record["transactionDate"] as! Date, transactionDescription: record["transactionDescription"] as! String, transactionFrequency: record["transactionFrequency"] as! String, transactionName: record["transactionName"] as! String, transactionOrigenOrDestination: record["transactionOrigenOrDestination"] as! String, transactionRepetition: record["transactionRepetition"] as! Int, transactionType: record["transactionType"] as! String, transactionValue: record["transactionValue"] as! Double, record: record)
                    let newItem = TransactionViewModel(id: record.recordID, transaction: newTransaction)
                    self.listTransactions.append(newItem)
                    self.listTransactions.sort(by: { $0.transactionName < $1.transactionName})
                }
            } else {
                print("Error: record not saved \(error!)")
            }
        })
    }
    
    
    func readTransactions(wallet: CKRecord.ID) {
        let predicate = NSPredicate(format: "wallet = %@", wallet)
        let query = CKQuery(recordType: "Transaction", predicate: predicate)
        database.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            if let list = records, error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    self.listTransactions = []
                    for record in list {
                        let newTransaction = Transaction(transactionCategory: record["transactionCategory"] as! String, transactionDate: record["transactionDate"] as! Date, transactionDescription: record["transactionRecord"] as! String, transactionFrequency: record["transactionFrequency"] as! String, transactionName: record["transactionName"] as! String, transactionOrigenOrDestination: record["transactionOrigenOrDestination"] as! String, transactionRepetition: record["transactionValue"] as! Int, transactionType: record["transactionType"] as! String, transactionValue: record["transactionValue"] as! Double, record: record)
                        let newItem = TransactionViewModel(id: record.recordID, transaction:  newTransaction)
                        self.listTransactions.append(newItem)
                    }
                    self.listTransactions.sort(by: { $0.transactionName < $1.transactionName})
                }
            } else {
                print("Error: records not found \(error!)")
            }
        })
    }
}
