//
//  BookDetailsPresenter.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookDetailsPresentationLogic: AnyObject {
    
}

final class BookDetailsPresenter: BookDetailsPresentationLogic {
    
    weak var viewController: BookDetailsDisplayLogic?
    
}
