//
//  UsersViewModel.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import Foundation
import Combine
import CoreLocation
import MapKit

@MainActor
final class UsersViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var users = [User]()
    let networkService: NetworkService
    
    @Published var errorMessage = "Unknown Error"
    @Published var isLoading : Bool = false
    @Published var showError = false
    private var cancellables = Set<AnyCancellable>()
    
    var userLimit : Int = 10
    var userSkip : Int = 0
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    //MARK: - PAGINATION
    func loadMoreContent(index:Int) {
        if ((index+1) == self.users.count){
            if !self.isLoading{
                
                self.userSkip += 10
                self.userLimit += 10
                if !(userLimit >= 100){
                    fetchUsers()
                }
                
            }
        }
    }
    
    //MARK: - API CALL
    func fetchUsers(){
        self.isLoading = true
        networkService.getUserList(skip: self.userSkip, limit: self.userLimit)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                print( "\(data)1")
                self.showError = true
                self.isLoading = false
        }, receiveValue: { data in
            print("\(data) result")
            
            self.users.append(contentsOf: data.users ?? [])
            self.isLoading = false
            
        }).store(in: &cancellables)
        
    }
    

    
}
