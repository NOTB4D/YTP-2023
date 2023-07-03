//
//  BookDetailsRouter.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookDetailsRoutingLogic: AnyObject {
    
}

protocol BookDetailsDataPassing: class {
    var dataStore: BookDetailsDataStore? { get }
}

final class BookDetailsRouter: BookDetailsRoutingLogic, BookDetailsDataPassing {
    
    weak var viewController: BookDetailsViewController?
    var dataStore: BookDetailsDataStore?
    
}
