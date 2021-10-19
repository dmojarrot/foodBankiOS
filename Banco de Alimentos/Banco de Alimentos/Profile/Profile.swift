//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by Team2 on 9/6/21.
//

import SwiftUI

struct Profile: View {
    
    @State var profilePicture:UIImage = UIImage(named: "profileExample")!
    @ObservedObject private var viewModel = UserDataViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        VStack{
                            
                            Image(uiImage: profilePicture)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118.0, height: 118.0)
                                .clipShape(Circle())
                            
                            Text("Ken Bauer Favel")
                                .bold()
                                .foregroundColor(.gray).font(.title2)
                            
                            
                        }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                        
                        Text("Ajustes")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(minWidth : 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                        ModuloAjustes()
                        
                    }
                    
                    
                }.navigationTitle("Perfil")
            }//.onAppear(){
            //self.viewModel.fetchData()
            //}
            
        }
        
    }
}

struct ModuloAjustes:View{
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    @EnvironmentObject var viewModel: FirebaseAuth
    @State var showAlert: Bool = false

    
    var body: some View{
        VStack(spacing : 3) {
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack {
                    
                    Text("Editar Perfil").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
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
            
            Button(action: {}, label: {
                HStack {
                    
                    Text("Calificar esta aplicación").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {
                showAlert = true
            }, label: {
                HStack {
                    
                    Text("Cerrar Sesión").foregroundColor(.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            NavigationLink(
                destination: EditProfile(),
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
            
        }.cornerRadius(20).padding(.horizontal)
            .alert(isPresented: self.$showAlert){
                Alert(
                    title: Text("¿Deseas cerrar sesión?"),
                    primaryButton: .destructive(Text("Cerrar sesión"), action: {
                        signOut()
                        
                    }),
                    secondaryButton: .cancel(Text("Cancelar"), action: { // 1

                        
                    })
                )
                
            }
    }
    
    func signOut(){
        viewModel.signOut()
    }
    
}




struct HiUser_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}





