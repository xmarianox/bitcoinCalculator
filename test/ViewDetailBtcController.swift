//
//  ViewDetailBtcController.swift
//  test
//
//  Created by Mariano Molina on 10/15/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import UIKit

class ViewDetailBtcController: UIViewController {
    
    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var inputBTC: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcularBtcValue(sender: UIButton) {
    }
}