//
//  CotizadorService.swift
//  test
//
//  Created by Mariano Molina on 22/10/15.
//  Copyright © 2015 Mariano Molina. All rights reserved.
//

import Foundation

class CotizadorService {
    
    func getCotizacionAtAlias(alias: String) -> Double {
        
        let urlString = "https://bitpay.com/api/rates/\(alias)"
        let url = NSURL(string: urlString)
        
        if let data = NSData(contentsOfURL: url!) {
            
            do {
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSDictionary
                
                let cotizacion = jsonDictionary.valueForKey("rate") as! Double
            
                return cotizacion
                
            } catch let errorCode {
                // No se pudo parsear el JSON
                print(errorCode)
            }
        } else {
            // No se logro descargar la informacion
        }
        
        return 0.0
    }
    
}