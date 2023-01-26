//
//  Observable.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

final class Observable<T> {
    private var listener: ((T?) -> Void)?
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T?) -> Void ) {
        self.listener = listener
        listener(value)
    }
    
}
