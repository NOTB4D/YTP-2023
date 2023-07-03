//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookBusinessLogic: AnyObject {
    func getBooks(request: Book.Fetch.Request)
}

protocol BookDataStore: AnyObject {
    var books: [Books]?{get}
}

final class BookInteractor: BookBusinessLogic, BookDataStore {

    
    var presenter: BookPresentationLogic?
    var worker: BookWorkingLogic = BookWorker()
    
    var books: [Books]?
    
    
    func getBooks(request: Book.Fetch.Request) {
        //2
        worker.getBooks(requst: BookRequestModel(result: request.result)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.books = response.feed?.results
                guard let news = self?.books else { return }
                self?.presenter?.presentNews(response: Book.Fetch.Response(books: news))
            case .failure(let error):
               break
            }
        }
    }
    
    
}
