//
//  UserDetailView.swift
//  UserList
//
//  Created by Vishnu Nair on 09/01/24.
//

import CoreLocation
import MapKit
import SwiftUI

struct UserDetailView: View {
    
    //Properties
    @StateObject var usersVm = UsersViewModel(networkService: NetworkService())
    
    var user : User
    let size: CGFloat = 150
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: user.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: size, alignment: .center)
                } placeholder: {
                    Color.clear
                }
                .frame(width: size, height: size,alignment: .center)
                
                .cornerRadius(size / 2)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: size, height: size)
                )
                .shadow(radius: 10)
                .frame(maxWidth: .infinity,alignment: .center)
                
                Text("User Info")
                    .foregroundStyle(.black)
                    .font(.title)
                
                titleField(fieldName: "Name :", value: generateFullName())
                titleField(fieldName: "Age :", value: String(user.age ?? 0))
                titleField(fieldName: "Gender :", value: (user.gender)?.rawValue ?? "")
                titleField(fieldName: "Email :", value: user.email ?? "")
                titleField(fieldName: "BloodGroup :", value: user.bloodGroup ?? "")
                titleField(fieldName: "Address :", value: self.generateAddress())
                
                VStack(alignment: .leading) {
                    Text("Location")
                        .foregroundStyle(.black)
                        .font(.title)
                    CustomMapView(region: generateRegion(), location: Location(
                        coordinate: CLLocationCoordinate2D(
                            latitude: user.address?.coordinates?.lat ?? 0.00,
                            longitude: user.address?.coordinates?.lng ?? 0.00
                        )
                    ))
                }
            }
            .padding(.horizontal,20)
            
            
        }
        .background(Color.cyan)
        
    }
    
    @ViewBuilder
    func titleField(fieldName: String, value: String) -> some View {
        HStack(alignment: .center, spacing: 15){
            
            Text(fieldName)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 100)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white
                )
        }
        .padding(.vertical,2)
        
        
    }
    
    //RegionUsingLatituseLongitude
    func generateRegion() -> MKCoordinateRegion{
        return .init(center: Location(
            coordinate: CLLocationCoordinate2D(
                latitude: user.address?.coordinates?.lat ?? 0.00,
                longitude: user.address?.coordinates?.lng ?? 0.00
            )
        ).coordinate, span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    //AppendVariousFieldsForFullName
    func generateFullName() -> String{
        let firstName : String = user.firstName ?? ""
        let lastName : String = user.lastName ?? ""
        let fullName = "\(firstName) \(lastName)"
        return fullName
    }
    
    //AppendVariousAddressFields
    func generateAddress() -> String{
        let addr : String = user.address?.address ?? ""
        let state : String = user.address?.state ?? ""
        let city : String = user.address?.city ?? ""
        let postalCode : String = user.address?.postalCode ?? ""
        let address = "\(addr),\(city),\(state),\(postalCode)"
        return address
    }
    
}

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}


//View for Custom Map view
struct CustomMapView: View {
    
    let locationManager = CLLocationManager()
    @State var region: MKCoordinateRegion
    @State var location : Location
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Image(systemName: "mappin")
                    .resizable()
                    .frame(width: 15, height: 39, alignment: .center)
                    .foregroundColor(.red)
            }
        }
        .frame(width: 300,height: 300)
        .frame(maxWidth: .infinity,alignment: .center)
        
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}


