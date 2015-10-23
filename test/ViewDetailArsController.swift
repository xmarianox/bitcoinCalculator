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
    var contizacionActual: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let cotizador = CotizadorService()
            let miCotizacion = cotizador.getCotizacionAtAlias("ARS")
            
            dispatch_async(dispatch_get_main_queue()) {
                self.contizacionActual = miCotizacion
            }
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        // mostramos el teclado
        inputPesosValue.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickCalcularBTC(sender: UIButton) {
        
        let sumaACalc = inputPesosValue.text!
        
        if let valorNumerico = convertirADouble(sumaACalc, utilizaPuntoDeMiles: false) {
            let calculo = valorNumerico * contizacionActual
        
            resultView.text = "$ \(calculo) ARS"
        } else {
            resultView.text = "Es necesario ingresar un numero"
        }
        
    }
    
    func convertirADouble(valor: String, utilizaPuntoDeMiles: Bool) -> Double? {
        
        let formatter = NSNumberFormatter()
        formatter.usesGroupingSeparator = utilizaPuntoDeMiles
        formatter.locale = NSLocale.currentLocale()
        
        let decimalAsDouble = formatter.numberFromString(valor)?.doubleValue
        
        return decimalAsDouble
    }
    
    /*
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
    */
    
}