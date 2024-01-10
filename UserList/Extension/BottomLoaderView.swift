//
//  BottomLoaderView.swift
//  UserList
//
//  Created by Vishnu Nair on 10/01/24.
//

import SwiftUI

struct BottomLoaderView: View {
    var body: some View {
        VStack {
            Spacer()
            // Customize your loader content
            Text("Loading...")
                .padding()
                .background(Color.secondary)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom, 20)
        }
        .padding()
    }
}


#Preview {
    BottomLoaderView()
}
