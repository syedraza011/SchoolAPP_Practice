//
//  ContentView.swift
//  Practice
//
//  Created by Syed Raza on 7/31/23.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SchoolViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.allSchools, id: \.dbn) { school in
                        Text(school.name)
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                    }
                }
                .task{
                    await self.viewModel.getSchools()
                }
            }
            .navigationTitle("NYC SCHOOLS") // Add the navigation title
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
