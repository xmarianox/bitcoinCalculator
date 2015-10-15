//
//  ViewDetailBtcController.swift
//  test
//
//  Created by Mariano Molina on 10/15/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import UIKit

class ViewDetailBtcController: UIViewController {
    
    @IBOutlet weak var inputBitcoinValue: UITextField!
    @IBOutlet weak var btnCalcBtc: UIButton!
    @IBOutlet weak var resultView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add action
        btnCalcBtc.addTarget(self, action: "btnClicked:", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClicked(sender: UIButton) {
        let sumaCalc: String = inputBitcoinValue.text!
        
        guard let _: String = sumaCalc else {
            print("No tiene nada... fijate que hacer")
        }
        
        let cantidadDeBtc = Double.init(sumaCalc)
        let resultado = convertBtcToArs(cantidadDeBtc!, cotizacionUSD: 15.84, cotizacionBTC: 253.32)
        resultView.text = "\(resultado) AR$"
    }
    
    func convertBtcToArs(cantidadDeBtc: Double, cotizacionUSD: Double, cotizacionBTC: Double) -> Double {
        /*
        * 1 BTC   = 253.32 USD
        * 1 USD B = 15.84 ARS
        * 1 USD O = 9.47 ARS
        */
        var result: Double!
        // convertimos los pesos a USD
        let btcToUsd = cantidadDeBtc / cotizacionBTC
      
        // pasamos los USD a BTC
        result = btcToUsd / cotizacionUSD
        // retornamos el resultado de la operacion3
        return result
    }
}