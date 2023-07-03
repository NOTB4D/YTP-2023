//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookDetailPresentationLogic: AnyObject {
    func presentBookDetail(response: BookDetail.Fetch.Response)
}

final class BookDetailPresenter: BookDetailPresentationLogic {

    weak var viewController: BookDetailDisplayLogic?
    
    func presentBookDetail(response: BookDetail.Fetch.Response) {
        viewController?.displayBookDetail(
            viewModel: BookDetail.Fetch.ViewModel(
                image: response.book?.artworkUrl100 ?? "",
                title: response.book?.name ?? "",
                detailDesc: response.book?.artistName ?? ""
            )
        )
    }
    
    
}

