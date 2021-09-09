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
    
    var body: some View{
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.white, Color.gray]), startPoint: .bottom,  endPoint: .top).edgesIgnoringSafeArea(.all))
                ScrollView{
                    VStack(alignment : .leading) {
                        Text("¿Cuanta cantidad decomida quieres donar?")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(20.0)
                                .shadow(color: .black, radius: 0.4, y: 0.2)

                            VStack(alignment : .leading) {
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("200g")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 10)
                                    Text("500g")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 10)
                                    Text("1000g")
                                        .foregroundColor(.white)
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
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 20)
                                    Text("Otra cantidad")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal, 20)
                                    Spacer()
                                }.padding(10)
                            }
                        }
                        
                        Text("¿Qué tipo de comida es?")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(20.0)
                                .shadow(color: .black, radius: 0.4, y: 0.2)

                            VStack(alignment : .leading) {
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("Frutas")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 3)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                    Text("Verduras")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(.vertical,10)
                                        .padding(.horizontal, 1)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                    Text("Cereales")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 2)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                        
                                }.padding(10)
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("Red Meat")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    
                                    Text("Otra tipo")
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.gray))
                                        .padding(.horizontal)
                                    Spacer()
                                }.padding(10)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Calle")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            TextField("Escribe la calle y el numero", text: $streetNumber)
                                .padding()
                                .background(Color("squareColors"))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)

                            
                            Text("Ciudad")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            TextField("Escribe la ciudad", text: $city)
                                .padding()
                                .background(Color("squareColors"))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)

                            
                            Text("Colonia")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            TextField("Escribe la colonia", text: $section)
                                .padding()
                                .background(Color("squareColors"))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                                .padding(.bottom, 20)

                        }
                        
                        Button(action: {}, label: {
                            Text("Donate")
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                            
                        }).padding(.bottom)
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
