//
//  DataExtension.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import Foundation

extension Data {
    func decode<T: Decodable>(type: T.Type) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(type, from: self)
    }
}
