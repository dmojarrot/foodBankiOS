//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by Team2 on 9/6/21.
//

import SwiftUI

struct HiUser: View {
    
    @State var profilePicture:UIImage = UIImage(named: "profileExample")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.white, Color.gray]), startPoint: .bottom,  endPoint: .top).edgesIgnoringSafeArea(.all))
                ScrollView{
                    VStack{
                        VStack{
                            
                            Image(uiImage: profilePicture)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118.0, height: 118.0)
                                .clipShape(Circle())
                            
                            Text("Mark Zuckerberg")
                                .bold()
                                .foregroundColor(.white).font(.title2)
                            
                            
                        }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                        
                        //                        Text("Ajustes")
                        //                            .font(.title)
                        //                            .fontWeight(.bold)
                        //                            .foregroundColor(.black)
                        //                            .frame(minWidth : 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                        ModuloAjustes()
                        
                    }
                    
                    
                }.navigationTitle("Bienvenido")
            }
            
        }
        
    }
}

struct ModuloAjustes:View{
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    @EnvironmentObject var viewModel: LoginRegisterViewModel

    
    var body: some View{
        VStack(spacing : 3) {
            Button(action: {}, label: {
                HStack {
                    
                    Text("Cuenta").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {isToggleOn.toggle()}, label: {
                HStack {
                    
                    
                    
                    Text("Notificaciónes").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
            }).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack {
                    
                    Text("Editar Perfil").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {
                viewModel.signOut()
            }, label: {
                HStack {
                    
                    Text("Cerrar Sesión").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            NavigationLink(
                destination: Profile(),
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
            
        }.cornerRadius(20).padding()
    }
}




struct HiUser_Previews: PreviewProvider {
    static var previews: some View {
        HiUser()
    }
}





