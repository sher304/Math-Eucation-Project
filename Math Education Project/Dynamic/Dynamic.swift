//
//  Dynamic.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 20/04/2023.
//

import Foundation


class Dynamic<T>{
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(_ listener: Listener?){
        self.listener = listener
    }
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ v: T){
        self.value = v
    }
}
