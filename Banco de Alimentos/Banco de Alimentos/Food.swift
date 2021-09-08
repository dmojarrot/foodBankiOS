//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI

	

struct Food: View {
    @State var streetNumber: String =  ""
    @State var city: String =  ""
    @State var section: String =  ""
    
    var fillInfo: some View {
        Group {
            Text("Street Number")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.top, 15)
                .padding(.bottom, 5)
            TextField("Enter Street and Number", text: $streetNumber)
                .padding(.vertical, 10)
            
            Text("City")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.top, 15)
                .padding(.bottom, 5)
            TextField("Enter City", text: $city)
                .padding(.vertical, 10)
            
            Text("Section")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.top, 15)
                .padding(.bottom, 5)
            TextField("Enter Section", text: $city)
                .padding(.vertical, 10)
        }
    }
    
    var body: some View{
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    VStack(alignment : .leading) {
                        Text("How much food are you going to donate?")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(20.0)
                            VStack(alignment : .leading) {
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("200g")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 10)
                                    Text("500g")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 10)
                                    Text("1000g")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 10)
                                    Spacer()
                                        
                                }.padding(10)
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("2000g")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 20)
                                    Text("Other amount")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 20)
                                    Spacer()
                                }.padding(10)
                            }
                        }
                        
                        Text("What type of food is it?")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.top, 15)
                            .padding(.bottom, 5)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(20.0)
                            VStack(alignment : .leading) {
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("Fruits")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 3)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                    Text("Vegetable")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(.vertical,10)
                                        .padding(.horizontal, 2)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                    Text("Cereals")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 3)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                        
                                }.padding(10)
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("Red Meat")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    
                                    Text("Another")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                }.padding(10)
                            }
                        }
                        
                        fillInfo
                        
                        Button(action: {}, label: {
                            Text("Donate")
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                            
                        })
                    }.padding(.horizontal)
                }.navigationBarTitle("Food")
            }
        }
    }
}




struct Food_Previews: PreviewProvider {
    static var previews: some View {
        Food()
    }
}
