//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by Team2 on 9/6/21.
//

import SwiftUI
import Firebase

struct Profile: View {
    
    @ObservedObject private var viewModel = UserDataViewModel()
    @State var name: String = ""
    @State var lastName: String = ""

    @EnvironmentObject var viewModelFB: FirebaseAuth
    @State var imagenPerfil: Image? = Image("profileExample")
    @State var isCameraActive = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        VStack{
                            
                            Button(action: {isCameraActive = true}, label: {
                                ZStack {
                                imagenPerfil!
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 118, height: 118)
                                    .clipShape(Circle())
                                    .sheet(isPresented: $isCameraActive, content: {
                                        SUImagePickerView(sourceType: .photoLibrary, image: self.$imagenPerfil, isPresented: $isCameraActive)
                                    })
                                
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                            })
                            
                            Text(name + " " + lastName)
                                .bold()
                                .foregroundColor(.gray).font(.title2)
                            
                            
                        }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                        
                        Text("Ajustes")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(minWidth : 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                        ModuloAjustes()
                        
                    }
                    
                    
                }.navigationTitle("Perfil")
            }.onAppear {
                let db = Firestore.firestore()
                db.collection("users").document((viewModelFB.auth.currentUser?.email)!).getDocument { documentSnapshot, error in
                    if let document = documentSnapshot, error == nil{
                        if let nameFB = document.get("Name") as? String {
                            self.name = nameFB
                        }
                        if let lastnameFB = document.get("LastName") as? String {
                            self.lastName = lastnameFB
                        }
                    }
                }

            }
            
            
        }
    }
}

struct ModuloAjustes:View{
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    @EnvironmentObject var viewModel: FirebaseAuth
    @State var showAlert: Bool = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View{
        VStack(spacing : 3) {
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack {
                    
                    Text("Editar Perfil").foregroundColor(colorScheme == .dark ? Color.white : Color.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background((Color(UIColor.systemBackground)))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {isToggleOn.toggle()}, label: {
                HStack {
                    
                    
                    
                    Text("Notificaciónes").foregroundColor(colorScheme == .dark ? Color.white : Color.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
            }).background(Color(UIColor.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                HStack {
                    
                    Text("Calificar esta aplicación").foregroundColor(colorScheme == .dark ? Color.white : Color.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color(UIColor.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {
                showAlert = true
            }, label: {
                HStack {
                    
                    Text("Cerrar Sesión").foregroundColor(colorScheme == .dark ? Color.white : Color.black).font(.title3).fontWeight(.light)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                    
                }.padding()
            }).background(Color(UIColor.systemBackground))
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
    
    func fetchData(){
        
    }
    
    func signOut(){
        viewModel.signOut()
    }
    
}




//struct HiUser_Previews: PreviewProvider {
//    static var previews: some View {
//        Profile()
//    }
//}





