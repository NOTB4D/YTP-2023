//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

// swiftlint:disable nesting
enum BookDetail {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            let book: Books?
        }
        
        struct ViewModel {
            var image: String
            var title: String
            var detailDesc:String
        }
        
    }
    
}
// swiftlint:enable nesting
