//
//  HomePageBottomCollectionViewCell.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 14/07/22.
//

import UIKit

class HomePageBottomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCellImage(imageName: String){
       let image = UIImage(named: imageName)
        cellImage.image = image
        
    }

}

