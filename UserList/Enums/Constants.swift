//
//  Constants.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//
import SwiftUI

/// Enum to defing constants being used throgh out the app
enum Constants {
	static let statusOK = 200
	static let baseURL = "https://dummyjson.com"
	static let kContentType = "Content-Type"
	static let contentJSON = "application/json"
	static let contentURLEncoded = "application/x-www-form-urlencoded; charset=utf-8"
	static let requestTimeout = TimeInterval(10)
}

/// Enum to defing color constants being used in app.
enum AppColor {
	static let primary = Color(red: 0, green: 202/255, blue: 167/255)
}
