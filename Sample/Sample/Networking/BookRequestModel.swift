//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

struct BookRequestModel: Encodable {
    var result: String?
    
    init(result: String) {
        self.result = result
    }
    
}
