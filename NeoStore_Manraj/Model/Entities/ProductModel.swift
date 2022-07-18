//
//  ProductModel.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 15/07/22.
//

import Foundation

struct ProductMainModel: Codable{
    let status: Int?
    let data: [ProductModel]?
    
    enum CodingKeys: String,CodingKey{
        case status
        case data
    }
}

struct ProductModel : Codable{
    let id,productcategory,cost,rating,viewcount: Int?
    let name,producer,description,created,modified,productImages: String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case productcategory = "product_category_id"
        case cost
        case rating
        case viewcount = "view_count"
        case name
        case producer
        case description
        case created
        case modified
        case productImages = "product_images"
    }
}
