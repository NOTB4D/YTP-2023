//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//


import Foundation
import UIKit

protocol BookDisplayLogic: AnyObject {
    func displayNews(viewModel: Book.Fetch.ViewModel)
}

final class BookViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var interactor: BookBusinessLogic?
    var router: (BookRoutingLogic & BookDataPassing)?
    
    var viewModel: Book.Fetch.ViewModel?

    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
        interactor?.getBooks(request: Book.Fetch.Request(result: "20"))
        collectionView.register(.init(nibName: "BookCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "BookCollectionViewCell")
        collectionView.collectionViewLayout = getCompotionalLayout()
        
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = BookInteractor()
        let presenter = BookPresenter()
        let router = BookRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // fractional -> kendini contain eden - parint view a oranı
    // estimeted -> bir değer veriyoruz ama yapı kendisi oranını ayarlıyor
    // absolute -> sabit değer
    
    private func getCompotionalLayout() -> UICollectionViewLayout {
        
        
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(0.5),
//            heightDimension: .fractionalHeight(1.0)
//        )
//
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let groupLayout = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(0.5)
//        )
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayout, subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout {(section, configuration) -> NSCollectionLayoutSection? in
            switch section {
            case 0: return self.getFirstSectionLayout()
            case 1: return self.getSecondSectionLayout()
            case 2: return self.getThirdSectionLayout()
            default: return nil
            }
        }
        return layout
    }
    
    private func getSecondSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupLayout = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayout, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func getFirstSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupLayout = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayout, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func getThirdSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupLayout = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupLayout, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

// MARK: CollectionViewDelegate
extension BookViewController: UICollectionViewDelegate {

}

// MARK: CollectionViewDataSource
extension BookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.news.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell",
                                                            for: indexPath) as? BookCollectionViewCell, let model = viewModel?.news else {return UICollectionViewCell()}
        cell.setUp(model: model[indexPath.item])
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .blue
        case 1:
            cell.backgroundColor = .systemMint
        default :
            cell.backgroundColor = .darkGray
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
}

//// MARK: CollectionViewDelegateFlowLayout
//extension BookViewController: UICollectionViewDelegateFlowLayout {
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //return CGSize(width: indexPath.item % 3 == 0 ? 200 : 50 , height: 100)
//       // return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//        return CGSize(width: (collectionView.frame.width - 40) / 2, height: (collectionView.frame.height - 40) / 3)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }
////
////
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(50)
//    }
////
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return CGFloat(50)
////    }
//
//
//}

extension BookViewController: BookDisplayLogic {
    //5
    func displayNews(viewModel: Book.Fetch.ViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}
