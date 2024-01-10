//
//  Users.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userResponseModel = try? JSONDecoder().decode(UserResponseModel.self, from: jsonData)

import Foundation

// MARK: - UserResponseModel
struct UserResponseModel: Codable {
    let users: [User]?
    let total, skip, limit: Int?
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let firstName, lastName, maidenName: String?
    let age: Int?
    let gender: Gender?
    let email, phone, username, password: String?
    let birthDate: String?
    let image: String?
    let bloodGroup: String?
    let height: Int?
    let weight: Double?
    let eyeColor: EyeColor?
    let hair: Hair?
    let domain, ip: String?
    let address: Address?
    let macAddress, university: String?
    let bank: Bank?
    let company: Company?
    let ein, ssn, userAgent: String?
    let crypto: Crypto?
}

// MARK: - Address
struct Address: Codable {
    let address, city: String?
    let coordinates: Coordinates?
    let postalCode, state: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double?
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String?
    let iban: String?
}

// MARK: - Company
struct Company: Codable {
    let address: Address?
    let department, name, title: String?
}

// MARK: - Crypto
struct Crypto: Codable {
    let coin: Coin?
    let wallet: Wallet?
    let network: Network?
}

enum Coin: String, Codable {
    case bitcoin = "Bitcoin"
}

enum Network: String, Codable {
    case ethereumERC20 = "Ethereum (ERC20)"
}

enum Wallet: String, Codable {
    case the0Xb9Fc1004Bfe7702De522516Cf34A5Da41C4Ef2B5 = "0xb9fc1004bfe7702de522516cf34a5da41c4ef2b5"
    case the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A = "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a"
    case the0Xb9Fc4B4B855Bc44Eb30D5E36Fd18F491F44A15B7 = "0xb9fc4b4b855bc44eb30d5e36fd18f491f44a15b7"
    case the0Xb9Fe6979A82Fb43Fdd9Ba9F446846Dc4Dfca3Deb = "0xb9fe6979a82fb43fdd9ba9f446846dc4dfca3deb"
}

enum EyeColor: String, Codable {
    case amber = "Amber"
    case blue = "Blue"
    case brown = "Brown"
    case gray = "Gray"
    case green = "Green"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Hair
struct Hair: Codable {
    let color: HairColor?
    let type: TypeEnum?
}

enum HairColor: String, Codable {
    case auburn = "Auburn"
    case black = "Black"
    case blond = "Blond"
    case brown = "Brown"
    case chestnut = "Chestnut"
}

enum TypeEnum: String, Codable {
    case curly = "Curly"
    case straight = "Straight"
    case strands = "Strands"
    case veryCurly = "Very curly"
    case wavy = "Wavy"
}
