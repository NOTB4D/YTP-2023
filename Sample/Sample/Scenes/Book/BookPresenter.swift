//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

protocol BookPresentationLogic: AnyObject {
    func presentNews(response: Book.Fetch.Response)

}

final class BookPresenter: BookPresentationLogic {
    
    weak var viewController: BookDisplayLogic?
    
    //4
    func presentNews(response: Book.Fetch.Response) {
        var news: [Book.Fetch.ViewModel.New] = []
       response.books.forEach{
            news.append(Book.Fetch.ViewModel.New(date: $0.releaseDate,
                                                 title: $0.name,
                                                 image: $0.artworkUrl100))
        }
        viewController?.displayNews(viewModel: Book.Fetch.ViewModel(news: news))
    }
    

}
