//
//  ViewDetailBtcController.swift
//  test
//
//  Created by Mariano Molina on 10/23/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import UIKit

class ViewDetailBtcController: UIViewController {

    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var inputUsdValue: UITextField!
    var cotizacionActual: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let cotizador = CotizadorService()
            let miCotizacion = cotizador.getCotizacionAtAlias("USD")
            
            dispatch_async(dispatch_get_main_queue()) {
                self.cotizacionActual = miCotizacion
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // se muestra el teclado
        inputUsdValue.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickBtnCalc(sender: UIButton) {
        let suma = inputUsdValue.text!
        
        if let valorNumerico = convertirADouble(suma, utilizaPuntoDeMiles: false) {
            let calculo = valorNumerico * cotizacionActual
            
            resultView.text = "\(calculo) U$D"
        } else {
            resultView.text = "Es necesario ingresar un número"
        }
    
    }
    
    func convertirADouble(valor: String, utilizaPuntoDeMiles: Bool) -> Double? {
        
        let formatter = NSNumberFormatter()
        formatter.usesGroupingSeparator = utilizaPuntoDeMiles
        formatter.locale = NSLocale.currentLocale()
        
        let decimalAsDouble = formatter.numberFromString(valor)?.doubleValue
        
        return decimalAsDouble
    }

}
