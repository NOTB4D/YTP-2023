//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookDetailBusinessLogic: AnyObject {
   func fechBook(request: BookDetail.Fetch.Request)
}

protocol BookDetailDataStore: AnyObject {
    var book : Books? {get set}
}

final class BookDetailInteractor: BookDetailBusinessLogic, BookDetailDataStore {
  
    var presenter: BookDetailPresentationLogic?
    var worker: BookDetailWorkingLogic = BookDetailWorker()
    
    var book: Books?
    
    
    func fechBook(request: BookDetail.Fetch.Request){
        self.presenter?.presentBookDetail(response: .init(book: book))
    }
}
