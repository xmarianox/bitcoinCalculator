//
//  ViewDetailArsController.swift
//  test
//
//  Created by Mariano Molina on 10/14/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import UIKit

class ViewDetailArsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // lallalala
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calcularValorBTC(cantidadARS: Double, cotizacionUSD: Double, cotizacionBTC: Double) -> Double {
        /*
        * 1 BTC   = 253.32 USD
        * 1 USD B = 15.84 ARS
        * 1 USD O = 9.47 ARS
        */
        var result: Double!
        // convertimos los pesos a USD
        let pesosToUSD = cantidadARS / cotizacionUSD
        // pasamos los USD a BTC
        result = pesosToUSD / cotizacionBTC
        // retornamos el resultado de la operacion
        return result
    }
}