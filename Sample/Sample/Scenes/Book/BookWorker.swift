//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import MBNetworking
import Foundation

protocol BookWorkingLogic: AnyObject {
    func getBooks(requst: BookRequestModel, completion: @escaping ((Result<BookResponseModel, Error>) -> Void))
}

final class BookWorker: BookWorkingLogic {
    
    //3
    func getBooks(requst: BookRequestModel, completion: @escaping ((Result<BookResponseModel, Error>) -> Void)){
        API.Book.getBook(result: requst.result ?? "10").fetch(BookResponseModel.self) { result in
            switch result {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
