//
//  URLRequestBuilder.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import Foundation

/// Structure is being used to build the API request
struct URLRequestBuilder {

	private init() {}

	static func buildURLRequest(endpoint: Endpoint) throws -> URLRequest {
		guard var requestURL = endpoint.baseURL else {
			throw AppError.technical
		}

		if let path = endpoint.path {
			requestURL = requestURL.appendingPathComponent(path)
		}

		var request = URLRequest(url: requestURL)

		// Method
		request.httpMethod = endpoint.httpMethod.rawValue

		// Headers
		if let headers = endpoint.headers {
			request.allHTTPHeaderFields = headers
		}

		// JSON
		if let json = endpoint.jsonParameters {
			request.httpBody = try JSONSerialization.data(withJSONObject: json)
			if request.value(forHTTPHeaderField: Constants.kContentType) == nil {
				request.setValue(Constants.contentJSON, forHTTPHeaderField: Constants.kContentType)
			}
		}

		// URL encoded params
        if let urlParameters = endpoint.urlParameters {
            var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: true)
            var items : [URLQueryItem] = []
            urlParameters.forEach { (key, value) in
                items.append(URLQueryItem(name: key, value: value))
            }
            urlComponents?.queryItems = items
            request.url = urlComponents?.url
			}
			if request.value(forHTTPHeaderField: Constants.kContentType) == nil {
				request.setValue(
					Constants.contentURLEncoded,
					forHTTPHeaderField: Constants.kContentType
				)
			}
		
		return request
	}
}

