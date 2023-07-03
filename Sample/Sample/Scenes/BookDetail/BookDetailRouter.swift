//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookDetailRoutingLogic: AnyObject {
    
}

protocol BookDetailDataPassing: AnyObject {
    var dataStore: BookDetailDataStore? { get }
}

final class BookDetailRouter: BookDetailRoutingLogic, BookDetailDataPassing {
    
    weak var viewController: BookDetailViewController?
    var dataStore: BookDetailDataStore?
    
}
