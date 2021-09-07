//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by user195826 on 9/6/21.
//

import SwiftUI

struct HiUser: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    VStack(alignment: .leading){
                        NavigationLink(
                            destination: Profile(),
                            label: {
                                Label("Your account", systemImage: "person.crop.circle")
                                    .foregroundColor(.blue)
                                    .padding(20)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.white))
                                    .padding(.horizontal, 20)
                                
                            })
                        
                        Label("Help", systemImage: "questionmark.circle")
                            .foregroundColor(.blue)
                            .padding(20)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white))
                            .padding(.horizontal, 20)
                        Spacer()
                    }.padding(.top, 30)
                }.navigationTitle("Bienvenido!")
            }
        }
    }
}

struct HiUser_Previews: PreviewProvider {
    static var previews: some View {
        HiUser()
    }
}
