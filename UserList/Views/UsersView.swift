//
//  UserListView.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//


import SwiftUI

struct UsersView: View {
    
    //MARK:- PROPERTIES
    @StateObject var usersVm = UsersViewModel(networkService: NetworkService())
    @State private var isBottomLoaderVisible = false
    
    //MARK:- BODY
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(0..<$usersVm.users.count, id:\.self) { i in
                        UserView(user: usersVm.users[i])
                            .listRowInsets(EdgeInsets())
                            .background(
                                NavigationLink {
                                    UserDetailView(user: usersVm.users[i])
                                } label: {
                                    
                                })
                            .onAppear(){
                                usersVm.loadMoreContent(index: i)
                                
                            }
                            .padding(.vertical, 5)
                        
                    }
                    
                }
                
                .scrollContentBackground(.hidden)
                .navigationTitle("Users")
            
                
                // Show bottom loader when isBottomLoaderVisible is true
                if usersVm.isLoading{
                    BottomLoaderView()
                      
                }
   
            }
            .padding(EdgeInsets(top:0.00, leading: 0.00, bottom: 1, trailing: 0.00))
            .onAppear(perform: {
                usersVm.fetchUsers()
             
               
                
            })
        }
    }
}

#Preview {
    UsersView(usersVm: UsersViewModel(networkService: NetworkService()))
}

