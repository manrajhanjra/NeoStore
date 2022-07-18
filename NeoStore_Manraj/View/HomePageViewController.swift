//
//  HomePageViewController.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 13/07/22.
//

import UIKit

class HomePageViewController: UIViewController {
    
   
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var navgationView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    var imgArr = Array<UIImage>()
    var productImageName = ["tableicon", "sofaicon", "chairsicon", "cupboardicon"]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupHeader()
        }
    
    func setupCollectionView(){
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.tag = 2
        let collectionViewNIb = UINib(nibName: "HomePageBottomCollectionViewCell", bundle: nil)
        bottomCollectionView.register(collectionViewNIb, forCellWithReuseIdentifier: "cell")
    }
    
    func setupHeader(){
        navgationView.backgroundColor = .bckColor
        topLabel.tintColor = .neoColor
        topCollectionView.tag = 1
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
    }

    }
    
    

extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 2 ? productImageName.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView.tag==2){
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == bottomCollectionView {
//            var side = collectionView.frame.size.width
//            side = (side-12)/2
//            return CGSize(width: side, height: side)
//        }
        if(collectionView.tag==2){
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 15, height: (UIScreen.main.bounds.width / 2) - 20)
        }
        else {
            return CGSize(width: topCollectionView.bounds.width, height: topCollectionView.bounds.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bottomCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomePageBottomCollectionViewCell
        if(collectionView.tag == 2){
        
        let imageName = productImageName[indexPath.item]
        cell.setUpCellImage(imageName: imageName)
    }
        if(collectionView.tag == 1){
         cell.setUpCellImage(imageName: "slider_img1")
    }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let co = ProductViewViewController(navigationName: indexPath.item + 1)
        self.navigationController?.pushViewController(co, animated: true)
    }
}


    
