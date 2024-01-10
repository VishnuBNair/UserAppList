//
//  AppError.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import Foundation

/// Enum to define app errors
enum AppError: Int, Error {
	case api
	case network
	case technical
	case timeout
	case unknown

	case missingPassword = 400
}
