//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import UIKit
import SDWebImage

protocol BookDetailDisplayLogic: AnyObject {
    func displayBookDetail(viewModel:BookDetail.Fetch.ViewModel)
}

final class BookDetailViewController: UIViewController {
    
    var interactor: BookDetailBusinessLogic?
    var router: (BookDetailRoutingLogic & BookDetailDataPassing)?
    
    @IBOutlet weak var bookDetailImage: UIImageView!
    @IBOutlet weak var bookDetailTitleLable: UILabel!
    @IBOutlet weak var bookDetailDecsTextView: UITextView!
    
    
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
        let interactor = BookDetailInteractor()
        let presenter = BookDetailPresenter()
        let router = BookDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        interactor?.fechBook(request: BookDetail.Fetch.Request())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension BookDetailViewController: BookDetailDisplayLogic {
    
    func displayBookDetail(viewModel:BookDetail.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.bookDetailImage.sd_setImage(with: URL(string: viewModel.image))
            self.bookDetailDecsTextView.text = viewModel.detailDesc
            self.bookDetailTitleLable.text = viewModel.title
        }
    }
}
