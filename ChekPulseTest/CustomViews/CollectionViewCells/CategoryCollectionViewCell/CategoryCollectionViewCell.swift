//
//  CategoryCollectionViewCell.swift
//  ChekPulseTest
//
//  Created by lugin on 8.08.23.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var CategoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLable: UILabel!
    
    func setup(category: DishCategory){
        categoryTitleLable.text = category.name
        CategoryImageView.kf.setImage(with: category.image.asUrl)
        
    }
    
}
