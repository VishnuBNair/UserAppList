//
//  ContentView.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import SwiftUI


struct UserView: View {
    
    //Properties
    var user : User
    let size: CGFloat = 50
    
    //Body
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            //Image
            AsyncImage(url: URL(string: user.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, alignment: .leading)
            } placeholder: {
                Color.clear
                    .frame(width: 50, alignment: .leading)
            }
            
            .cornerRadius(size / 2)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 4)
                    .frame(width: size, height: size)
            )
            .shadow(radius: 10)
            .padding(EdgeInsets(top: 0.00, leading: 10.00, bottom: 0.00, trailing: 10.00))
        
            
            VStack(alignment: .leading, spacing: 5, content: {
                HStack{
                    Text("First Name :")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text(user.firstName ?? "")
                }
                
                HStack{
                    Text("Last Name :")
                        .fontWeight(.semibold)
                        .bold()
                        .foregroundStyle(.black)
                    Text(user.lastName ?? "")
                }
                
                HStack{
                    Text("Email :")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text(user.email ?? "")
                        .lineLimit(1)
                }
                
            })
            .foregroundColor(.white)
            .padding()
        })
        
        .frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .background(Color.cyan)
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
      
    }
}



