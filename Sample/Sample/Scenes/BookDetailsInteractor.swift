//
//  BookDetailsInteractor.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookDetailsBusinessLogic: AnyObject {
    
}

protocol BookDetailsDataStore: AnyObject {
    
}

final class BookDetailsInteractor: BookDetailsBusinessLogic, BookDetailsDataStore {
    
    var presenter: BookDetailsPresentationLogic?
    var worker: BookDetailsWorkingLogic = BookDetailsWorker()
    
}
