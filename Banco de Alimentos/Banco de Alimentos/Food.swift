//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI

struct Food: View {
    var body: some View{
        ScrollView{
            VStack(alignment : .leading) {
                Text("How much food are you going to donate?")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                
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


