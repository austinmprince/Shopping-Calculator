//
//  ViewController.swift
//  shoppingCalculator
//
//  Created by Austin Prince on 1/25/17.
//  Copyright © 2017 Austin Prince. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var checkValueDiscount = "0.0"
    var checkValueOriginal = "0.0"
    var checkValueSale = "0.0"
    var isFridayMode = false
    @IBOutlet weak var originalPrice: UITextField!
    
    @IBOutlet weak var discountPercent: UITextField!
    
    
    @IBOutlet weak var salesTax: UITextField!
    
    @IBOutlet weak var finalPrice: UILabel!
    
    
    @IBOutlet weak var blackFridayImage: UIImageView!
    
    @IBAction func turnOnDiscount(_ sender: UISwitch) {
        blackFridayImage.isHidden = !sender.isOn
        isFridayMode = sender.isOn
        changePrice()
        
    }
    func isValid(checkString:String) -> Bool {
        if (Double(checkString) != nil){
            return true
        }
        else { return false }
    }
    func changePrice(){
        if (discountPercent.text != nil && isValid(checkString: discountPercent.text!)){
            checkValueDiscount = discountPercent.text!
        }
        
        if (salesTax.text != nil && isValid(checkString: salesTax.text!)){
            checkValueSale = salesTax.text!
         
        }
        if (originalPrice.text != nil && isValid(checkString: originalPrice.text!)){
            checkValueOriginal = originalPrice.text!
            
        }
        else {
            checkValueOriginal = "0.0"
        }
        
        if (isFridayMode) {
            var extraDiscount = Double(checkValueDiscount)!
            extraDiscount+=30
            checkValueDiscount=String(extraDiscount)
        }
        let finalPriceInt = calculateFinalPrice(salesPercent: Double(checkValueSale)!, price: Double(checkValueOriginal)!, percentOff: Double(checkValueDiscount)!)
        
        let finalPriceText = String(finalPriceInt)
        let displayText = "$\(String(format: "%.2f", finalPriceInt))"
        
        
        finalPrice.text = displayText
        if (finalPriceInt < 0) {
            finalPrice.text = "Discount Percent is too high"
        }
    }
    
    
   
    @IBAction func priceChange(_ sender: UITextField) {
       
        if (discountPercent.text != nil && isValid(checkString: discountPercent.text!)){
            checkValueDiscount = discountPercent.text!
        }
        
        if (salesTax.text != nil && isValid(checkString: salesTax.text!)){
            checkValueSale = salesTax.text!
            
        }
        if (originalPrice.text != nil && isValid(checkString: originalPrice.text!)){
            checkValueOriginal = originalPrice.text!
        
        }
        else {
            checkValueOriginal = "0.0"
        }
        
        if (isFridayMode) {
            var extraDiscount = Double(checkValueDiscount)!
            extraDiscount+=30
            checkValueDiscount=String(extraDiscount)
        }
        let finalPriceInt = calculateFinalPrice(salesPercent: Double(checkValueSale)!, price: Double(checkValueOriginal)!, percentOff: Double(checkValueDiscount)!)
        
        let finalPriceText = String(finalPriceInt)
        let displayText = "$\(String(format: "%.2f", finalPriceInt))"
        

        finalPrice.text = displayText
        if (finalPriceInt < 0) {
            finalPrice.text = "Discount Percent is too high"
        }
    }
    
    
    func calculateFinalPrice(salesPercent:Double, price:Double, percentOff:Double) -> Double {
        
        let withDiscount:Double = price - (price * (percentOff / 100))
        let withTax = withDiscount + (withDiscount * (salesPercent / 100))
        
        return withTax
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

