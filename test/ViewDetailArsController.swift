//
//  ViewDetailArsController.swift
//  test
//
//  Created by Mariano Molina on 10/14/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import UIKit

class ViewDetailArsController: UIViewController {
    
    @IBOutlet weak var inputPesosValue: UITextField!
    @IBOutlet weak var btnCalc: UIButton!
    @IBOutlet weak var resultView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add action
        btnCalc.addTarget(self, action: "btnClicked:", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClicked(sender: UIButton) {
        // tomamos el valor
        let sumaCalc: String = inputPesosValue.text!
        
        guard let _: String = sumaCalc else {
            print("No tiene nada... fijate que hacer")
        }
        
        let cantidadDePesos = Double.init(sumaCalc)
        let resultado = calcularValorBTC(cantidadDePesos!, cotizacionUSD: 15.84, cotizacionBTC: 253.32)
        resultView.text = "\(resultado) BTC"
        
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
        // retornamos el resultado de la operacion3
        return result
    }
}