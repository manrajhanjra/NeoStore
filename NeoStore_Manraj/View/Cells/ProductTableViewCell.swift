    //
    //  ProductTableViewCell.swift
    //  NeoStore_Manraj
    //
    //  Created by Neosoft on 14/07/22.
    //

    import UIKit

    class ProductTableViewCell: UITableViewCell {
        
        
     
        @IBOutlet var starArr: [UIImageView]!
        @IBOutlet weak var productImage: UIImageView!
        @IBOutlet weak var productName: UILabel!
        @IBOutlet weak var productPrice: UILabel!
        
        @IBOutlet weak var producerName: UILabel!
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        

            func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }
        func setUpCell(data: ProductModel){
            productName.text = data.name
            productName.textColor = .productColor
            producerName.text = data.producer
            productName.textColor = .productColor
            productPrice.text = "Rs.\(data.cost ?? 0)"
            productPrice.textColor = .priceColor
            if let imgURL = URL(string: data.productImages ?? "0"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imgURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.productImage.image = image
                        }
                    }
        
                }
            }
            if let rating = data.rating{
            for i in 0...rating{
                starArr[i].image = UIImage(named: "star_check")
            }
            }
            
            
        }

}
        
