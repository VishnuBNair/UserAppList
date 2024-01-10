//
//  URLSessionAPIClient.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import Foundation
import Combine

class URLSessionAPIClient: APIClient {
    
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        // set up any other request parameters here
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("\(APIError.invalidResponse) prince")
                    throw APIError.invalidResponse
                }
                let l = data.decode(type: User.self)
                print("\(String(describing: l)) queen")
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
protocol APIClient {
    func request<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error>
}

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}


enum APIError: Error {
    case invalidResponse
    case invalidData
}

protocol NetworkServiceProtocol {
    func getUserList(skip:Int, limit: Int) -> AnyPublisher<UserResponseModel, Error>
}

class NetworkService: NetworkServiceProtocol {
    
    let apiClient = URLSessionAPIClient()
    func getUserList(skip: Int, limit: Int) -> AnyPublisher<UserResponseModel, Error> {
        let endpoint = Endpoint(path: API.listUsers.rawValue , urlParameters : ["limit":String(limit),"skip":String(skip)], httpMethod: .get)
     
        guard let urlRequest = try? URLRequestBuilder.buildURLRequest(endpoint: endpoint) else { return Fail(error: NSError(domain: "Missing Feed URL", code: -10001, userInfo: nil)).eraseToAnyPublisher() }
        
        return apiClient.request(urlRequest: urlRequest)
    }

}
