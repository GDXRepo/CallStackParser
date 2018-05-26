//
//  NSObject+Logging.swift
//  GDXRepo
//
//  Created by Георгий Малюков on 26.05.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

import Foundation

extension NSObject {
    
    var typenameFull: String {
        return NSStringFromClass(type(of: self))
    }
    
    var typename: String {
        let full = NSStringFromClass(type(of: self))
        return full.regexReplace(pattern: "^[^\\.]+\\.", replace: "")
    }
    
    func d(_ string: String) {
        let dt = Date().description
        for symbol in Thread.callStackSymbols[1...] {
            if let parsed = CallStackParser.classAndMethodForStackSymbol(symbol) {
                print("\(dt) [\(parsed.0)] \(parsed.1) \(string)")
                return
            }
        }
        print("\(dt) [\(typename)] \(string)")
    }
    
}
