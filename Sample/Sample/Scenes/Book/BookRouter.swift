//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation
import UIKit

protocol BookRoutingLogic: AnyObject {
  func  routeToNewsDetail(index: Int)
}

protocol BookDataPassing: AnyObject {
    var dataStore: BookDataStore? { get }
}

final class BookRouter: BookRoutingLogic, BookDataPassing {

    weak var viewController: BookViewController?
    var dataStore: BookDataStore?
    
    func routeToNewsDetail(index: Int) {
        let storyBoard = UIStoryboard(name: "BookDetail", bundle: nil)
        let destVC: BookDetailViewController = storyBoard.instantiateViewController(
            identifier: "BookDetailViewController"
        )
        
        destVC.router?.dataStore?.book = dataStore?.books?[index]
        self.viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
