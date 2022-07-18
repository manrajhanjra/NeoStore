//
//  CustomerModel.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 08/07/22.
//

import Foundation

struct CustomerMainModel: Codable{
    let status: Int?
    let data: CustomerModel?
    let message: String?
    let usermsg: String?
    
    enum CodingKeys: String,CodingKey{
        case status
        case data
        case message
        case usermsg = "user_msg"
    }
}

struct CustomerModel: Encodable {
    let id,role : Int?
    let fname,lname,email,username,gender,created,modified,token : String?
    let active: Bool?
    let dob,pic,country: String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case role = "role_id"
        case fname = "first_name"
        case lname = "last_name"
        case email
        case username
        case gender
        case created
        case modified
        case token = "access_token"
        case active =  "is_active"
        case dob
        case pic = "profile_pic"
        case country = "country_id"
    }
}

extension CustomerModel: Decodable {
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        fname = try? value.decodeIfPresent(String.self, forKey: .fname)
        lname = try? value.decodeIfPresent(String.self, forKey: .lname)
        email = try? value.decodeIfPresent(String.self, forKey: .email)
        username = try? value.decodeIfPresent(String.self, forKey: .username)
        gender = try? value.decodeIfPresent(String.self, forKey: .gender)
        created = try? value.decodeIfPresent(String.self, forKey: .created)
        modified = try? value.decodeIfPresent(String.self, forKey: .modified)
        token = try? value.decodeIfPresent(String.self, forKey: .token)
        id = try? value.decodeIfPresent(Int.self, forKey: .id)
        role = try? value.decodeIfPresent(Int.self, forKey: .role)
        active = try? value.decodeIfPresent(Bool.self, forKey: .active)
        dob = try? value.decodeIfPresent(String.self, forKey: .dob)
        pic = try? value.decodeIfPresent(String.self, forKey: .pic)
        country = try? value.decodeIfPresent(String.self, forKey: .country)
    }
}
