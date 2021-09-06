//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI

struct Food: View {
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {

                        Text("Food")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenTitle"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 0)
                            .padding(.bottom, 10)
                        
                        
                        Text("How much food are you going to donate?")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading, 0)
                            .padding(.bottom, 40)
                    }
                }.padding(.bottom, 20)

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
                }.padding(.horizontal, 40)
            }
        .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }


