//
//  ViewController.swift
//  CoinChange
//
//  Created by User23 on 4/7/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recieveMoneyTextfield: InputTextfield!
    @IBOutlet weak var priceMoneyTextfield: InputTextfield!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var returnCoinTitleLabel: UILabel!
    @IBOutlet weak var returnCoinValueLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CoinChangeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = .init(delegate: self)
        
        configView()
    }

    func configView() {
        
        tableView.delegate = self
        tableView.dataSource = viewModel.dataSource
        tableView.register(UINib.init(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinChangeCell")
        
        recieveMoneyTextfield.keyboardType = .decimalPad
        priceMoneyTextfield.keyboardType = .decimalPad
        
        DispatchQueue.main.async {
            
            self.calculateButton.backgroundColor = .blue
            self.calculateButton.setTitleColor(.white, for: .normal)
            self.calculateButton.setTitle("คำนวณ", for: .normal)
            
            self.recieveMoneyTextfield.title = "รับเงิน"
            self.priceMoneyTextfield.title = "ราคาสินค้า"
            
            self.recieveMoneyTextfield.placeHolder = "รับเงิน (บาท)"
            self.priceMoneyTextfield.placeHolder = "ราคาสินค้า (บาท)"
            
            self.returnCoinTitleLabel.text = "เงินทอน"
            self.returnCoinValueLabel.text = "0"
        }
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        
        if let recieveMoney = Int(recieveMoneyTextfield.value ?? "0"),
            let price = Int(priceMoneyTextfield.value ?? "0"),
            recieveMoney >= price {
            
            returnCoinValueLabel.text = "\(recieveMoney - price)"
            viewModel.calculate(price: recieveMoney - price)
        } else {
            viewModel.calculate(price: 0)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return .init()
    }
}

extension ViewController: CoinChangeViewModelDelegate {
    
    func didSuccessCalculateChangeCoin() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
