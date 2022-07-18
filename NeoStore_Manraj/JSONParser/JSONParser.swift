//
//  JSONParser.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 11/07/22.
//

import Foundation

struct JSONParser {
    /*
    * Method name: processResponse
    * Description: This function is process the response received from the api.
    * Parameters: result refer Data, type refer type of object
    * Return:  T refers to type of object
    */
    static func processResponse<T:Codable>(result:Data?, type:T.Type) -> T? {
        if let response = result {
            do {
                return try type.decode(data: response)
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
}

extension Decodable {
    /*
    * Method name: decode
    * Description: This function is decode the api response.
    * Parameters: data refer type Data
    * Return:  Decodable type object
    */
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}

//: Encodable Extension
extension Encodable {
    /*
    * Method name: encode
    * Description: This function is encode the api response.
    * Parameters: nil
    * Return:  Data
    */
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}
