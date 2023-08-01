//
//  OnboardViewCell.swift
//  ChekPulseTest
//
//  Created by lugin on 31.07.23.
//

import UIKit

class OnboardViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImage: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    static let identifier =  String(describing: OnboardViewCell.self)
    

 
    func setup(_ slide: OnboardingSlide){
        slideImage.image = slide.image
        text.text = slide.title
    }
}
