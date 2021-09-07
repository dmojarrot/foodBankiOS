//
//  Acknowledgment.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct Acknowledgment: View {
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack {
                    Color("background").edgesIgnoringSafeArea(.bottom)
                    VStack(alignment: .leading){
                        Text("Muchas gracias!")
                            .bold()
                            .padding(.leading, 30)
                            .font(.subheadline)
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                            .padding(30)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white))
                            .padding(.horizontal,20)
                        Spacer()
                    }.padding()
                }
            }.navigationTitle("Agradecimientos")
        }
    }
}

struct Acknowledgment_Previews: PreviewProvider {
    static var previews: some View {
        Acknowledgment()
    }
}
