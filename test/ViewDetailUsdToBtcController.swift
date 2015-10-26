//
//  ViewDetailUsdToBtcController.swift
//  test
//
//  Created by Mariano Molina on 10/26/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import UIKit

class ViewDetailUsdToBtcController: UIViewController {

    @IBOutlet weak var labelResultado: UILabel!
    @IBOutlet weak var inputValue: UITextField!
    var cotizacionActual: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let cotizadorService = CotizadorService()
            let miCotizacion = cotizadorService.getCotizacionAtAlias("USD")
            
            dispatch_async(dispatch_get_main_queue()) {
                self.cotizacionActual = miCotizacion
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        inputValue.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnCalcular(sender: UIButton) {
        let suma = inputValue.text!
        
        if let valorNumerico = convertirADouble(suma, utilizaPuntoDeMiles: false) {
            let calculo = valorNumerico / cotizacionActual
            
            labelResultado.text = "\(calculo) BTC"
        } else {
            labelResultado.text = "Es necesario ingresar un número"
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
