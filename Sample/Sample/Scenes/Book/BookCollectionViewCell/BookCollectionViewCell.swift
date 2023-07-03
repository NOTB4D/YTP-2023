//
//  BookCollectionViewCell.swift
//  Sample
//
//  Created by Eser Kucuker on 3.07.2023.
//

import UIKit
import SDWebImage

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookcoverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(model: Book.Fetch.ViewModel.New) {
        bookcoverImageView.sd_setImage(with: URL(string: model.image ?? ""))
        bookNameLabel.text = model.title
        bookDateLabel.text = model.date
    }

}
