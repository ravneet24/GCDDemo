//
//  SecondViewController.swift
//  Concurrency
//
//  Created by Ravneet Arora on 26/08/23.
//

import UIKit


class SecondViewController: UIViewController {
    @IBOutlet weak var balanceLeftLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    
    var products: [[String: Any]] = [["name": "A", "price": 40],["name": "B", "price": 30], ["name": "C", "price": 40]]
    
    var balance: Int = 50
    var cartPrice: Int = 0
    
    let semaphore = DispatchSemaphore(value: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
//    deinit {
//        semaphore.signal()
//    }
    
    @IBAction func purchaseProducts(_ sender: Any) {
        for product in products {
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                self?.addItemToCart(product: product)
            }
        }
    }
    
    func addItemToCart(product: [String: Any]) {
        semaphore.wait()
        let productPrice = product["price"] as? Int ?? 0
        if balance > productPrice {
            sleep(1) // actual purchase happens here. added sleep for testing
            print("Item Purchase on price -- \(productPrice)")
            self.cartPrice += productPrice
            self.balance  -= productPrice
            
            DispatchQueue.main.async { [weak self] in
                self?.balanceLeftLabel.text = "Balance - Rs \(self?.balance ?? 0)"
                self?.cartPriceLabel.text = "Cart Price - Rs \(self?.cartPrice ?? 0)"
                self?.semaphore.signal()
            }
        } else {
            print("Low balance")
        }
        
    }
    
}
