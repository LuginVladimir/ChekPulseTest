//
//  OnboardingViewController.swift
//  ChekPulseTest
//
//  Created by lugin on 31.07.23.
//

import UIKit

class OnboardingViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var curretPage = 0 {
        didSet {
            pageControl.currentPage = curretPage
            if(curretPage == slides.count - 1 ){
                button.setTitle("GET STARTED", for: .normal)
            } else {
                button.setTitle("CONTINUE", for: .normal)
            }
            
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnboardingSlide(title: "First title", descr: "First Descr", image: #imageLiteral(resourceName: "Screen 1")),
            OnboardingSlide(title: "Second title", descr: "First second", image: #imageLiteral(resourceName: "Screen 2")),
            OnboardingSlide(title: "Third title", descr: "First thord", image: #imageLiteral(resourceName: "Screen 3"))
        ]
    }

    @IBAction func continueClicked(_ sender: UIButton) {
        if(curretPage == slides.count - 1){
            let controller = storyboard?.instantiateViewController(identifier: "homeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal 
            present(controller, animated: true)
        } else{
            curretPage += 1
            let indexPath = IndexPath(item:curretPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }

}

extension OnboardingViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
{
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardViewCell.identifier, for: indexPath) as! OnboardViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        curretPage = Int(scrollView.contentOffset.x / width)

    }
    
}
