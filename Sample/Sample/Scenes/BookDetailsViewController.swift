//
//  BookDetailsViewController.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import UIKit

protocol BookDetailsDisplayLogic: AnyObject {
    
}

final class BookDetailsViewController: UIViewController {
    
    var interactor: BookDetailsBusinessLogic?
    var router: (BookDetailsRoutingLogic & BookDetailsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = BookDetailsInteractor()
        let presenter = BookDetailsPresenter()
        let router = BookDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension BookDetailsViewController: BookDetailsDisplayLogic {
    
}
