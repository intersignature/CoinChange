//
//  CoinChangeViewModel.swift
//  CoinChange
//
//  Created by User23 on 4/7/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import Foundation
import UIKit

enum AllMoneyPriceType: Int {
    
    case p500 = 500
    case p100 = 100
    case p50 = 50
    case p20 = 20
    case p10 = 10
    case p5 = 5
    case p1 = 1
    
    func getTitle() -> String {
        return "ธนบัตร \(self.rawValue)"
    }
    
    static func allValues() -> [AllMoneyPriceType] {
        return [.p500, p100, .p50, .p20, .p10, .p5, .p1]
    }
}

protocol CoinChangeViewModelDelegate: NSObject {
    
    func didSuccessCalculateChangeCoin()
}

class CoinChangeViewModel: NSObject {
    
    var dataSource: CoinChangeDataSource?
    
    weak var delegate: CoinChangeViewModelDelegate?
    
    override init() {
        super.init()
        
        dataSource = .init()
    }
    
    init(delegate: CoinChangeViewModelDelegate) {
        
        self.delegate = delegate
        dataSource = .init()
    }
    
    func calculate(price: Int) {
        
        let allMoneyPriceType: [AllMoneyPriceType] = AllMoneyPriceType.allValues()
        var price = price
        var result: [Int] = []
        
        for moneyType in allMoneyPriceType {
            result.append(price/moneyType.rawValue)
            price = price%moneyType.rawValue
        }
        
        dataSource?.returnCoinData = result
        delegate?.didSuccessCalculateChangeCoin()
    }
}

class CoinChangeDataSource: NSObject, UITableViewDataSource {
    
    var returnCoinData: [Int] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if returnCoinData.count != AllMoneyPriceType.allValues().count { // fail case or something wrong case
            return 0
        }
        
        return returnCoinData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinChangeCell", for: indexPath) as? CoinTableViewCell else { return .init() }
        
        cell.coinTypeLabel.text = AllMoneyPriceType.allValues()[indexPath.row].getTitle()
        cell.returnValueLabel.text = "\(returnCoinData[indexPath.row])"
        
        return cell
    }
}
