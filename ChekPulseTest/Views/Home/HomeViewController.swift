//
//  HomeViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 8.08.23.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {

    @IBOutlet weak var categiryCollectionVIew: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var categiries: [DishCategory] = [
        .init(id: "id1", name: "African food", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png"),
        .init(id: "id2", name: "African food 2", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png"),
        .init(id: "id3", name: "African food 3", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png"),
        .init(id: "id4", name: "African food 4", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png"),
        .init(id: "id5", name: "African food 5", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Dashboard"
        
        registerCells()
    }
    
    private func registerCells(){
        categiryCollectionVIew.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil
                                             ), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil
                                             ), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categiries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categiries[indexPath.row])
        return cell
    }
    
}

