//
//  ProductPageViewModel.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 17/07/22.
//

import Foundation

protocol ProductPageViewModelType{
    func loadProducts(productDetails: ProductData , completion: @escaping(Bool) -> Void)
    func fetchDataFromArray(index: Int) -> ProductModel
    func totalProductCount() -> Int
}

class ProductPageViewModel: ProductPageViewModelType{
    
    var dataArray = [ProductModel]()
    
    func loadProducts(productDetails: ProductData , completion: @escaping(Bool) -> Void){
        UserService.sharedInstance.getProductList(productId: productDetails.productId, limit: productDetails.limit, page: productDetails.page){ response in
            
            switch response{
            case .success(let value):
                if value.status == 200, let data = value.data{
                    self.dataArray = data
                    completion(true)
                    return
                }
                completion(false)
                return
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
        }
    
    func fetchDataFromArray(index: Int) -> ProductModel{
        return dataArray[index]
    }
    
    func totalProductCount() -> Int{
        return dataArray.count
    }
    }

