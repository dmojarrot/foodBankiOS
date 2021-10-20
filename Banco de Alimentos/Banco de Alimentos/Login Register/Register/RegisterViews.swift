//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI
import Firebase
import CoreMIDI

struct Register: View {
    @State var mail = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var showAlert = false
    @State var isFieldsOk = false
    @State var errString: String?
    @State var messageAlert: String?
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        
                        Text("¿No tienes cuenta?")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenBackground"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Regístrate")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                            .padding(.bottom, 40)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading) {
                    Text("Correo electrónico")
                        .font(.subheadline)
                        .fontWeight(.light)
                    TextField("", text: $mail)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                        .padding(.bottom,20)
                    Text("Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    SecureField("", text: $password)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Text("Confirmar contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    SecureField("", text: $confirmPassword)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    Button {
                        pass2Register(email: mail, password: password, confirmPassword: confirmPassword)
                    } label: {
                        Text("Continuar")
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("greenBackground"))
                            .cornerRadius(20)
                    }
                                        
                    
                }.padding(.horizontal, 40)
            }
            NavigationLink(
                destination: Register2(mail: mail, password: password),
                isActive: $isFieldsOk) {
                    EmptyView()
                }
            
        }.navigationBarTitle(Text(""), displayMode: .inline).alert(isPresented: self.$showAlert){
            Alert(title: Text(self.messageAlert!),
                  message: Text(self.errString ?? "Error"), dismissButton: .default(Text("OK")){
            })
            
        }
    }
    
    func pass2Register(email: String, password: String, confirmPassword: String){
        var isPassword = false
        
        if isValidEmailAddress(emailAddressString: email){
            if password == confirmPassword {
                isPassword = true
            }else{
                showAlert = true
                errString = "Las contraseñas no son las mismas, intente de nuevo"
                messageAlert = "Error"
                return
            }
            if password.count >= 6 && isPassword{
                isFieldsOk = true
            }else{
                showAlert = true
                errString = "La contraseña debe tener como minimo 6 caracteres"
                messageAlert = "Error"
            }

        }else{
            showAlert = true
            errString = "Correo no valido, intente de nuevo"
            messageAlert = "Error"
        }
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
}


struct Register2: View {
    @EnvironmentObject var viewModel: FirebaseAuth
    @State var mail: String
    @State var password: String
    @State var name = ""
    @State var lastName = ""
    @State var cellphone = ""
    @State var genre = ""
    @State var birthDate = ""
    
    @State var selection: String = "Genero"
    let filterOptions: [String] = ["Masculino", "Femenino", "Otro"]
    
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        
                        Text("Finaliza tu                cuenta")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenBackground"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Estás a solo un paso")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                            .padding(.bottom, 40)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Nombre")
                                .font(.subheadline)
                                .fontWeight(.light)
                            TextField("", text: $name)
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                                .padding(.bottom,20)
                        }
                        VStack(alignment: .leading){
                            Text("Apellido")
                                .font(.subheadline)
                                .fontWeight(.light)
                            TextField("", text: $lastName)
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                                .padding(.bottom,20)
                        }
                    }
                    
                    Text("Celular")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $cellphone)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    
                    Text("Género")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $genre)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    //                    Picker(
                    //                        selection: $selection,
                    //                        label:
                    //                            HStack{
                    //                                Text("Genre: ")
                    //                                Text(selection)
                    //                            }
                    //                            .font(.headline)
                    //                            .foregroundColor(.white)
                    //                            .padding()
                    //                            .padding(.horizontal)
                    //                            .background(Color.blue)
                    //                            .cornerRadius(10)
                    //                            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
                    //                        ,
                    //                        content: {
                    //                            ForEach(filterOptions, id: \.self) { option in
                    //                                HStack{
                    //                                    Text(option)
                    //                                }
                    //                                .tag(option)
                    //                            }
                    //
                    //                        })
                    
                    
                    
                    Text("Fecha de Nacimiento")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $birthDate)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Button(action: {
                        guard !name.isEmpty, !lastName.isEmpty, !cellphone.isEmpty, !genre.isEmpty, !birthDate.isEmpty else{
                            return
                        }
                        self.AddInfo(name: self.name, lastName: self.lastName, cellphone: self.cellphone, genre: self.genre, birthDate: self.birthDate)
                        viewModel.signUp(email: mail, password: password)
                        
                    }, label: {
                        Text("Registrarse")
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("greenBackground"))
                            .cornerRadius(20)
                        
                    })
                    
                }.padding(.horizontal, 40)
            }.accentColor(Color("greenBackground"))
        }.navigationBarTitle(Text(""), displayMode: .inline)
    }
    
    func AddInfo(name: String, lastName: String, cellphone: String, genre: String, birthDate: String){
        let db = Firestore.firestore()
        db.collection("users").document().setData(["Name": self.name, "LastName": self.lastName, "Cellphone": self.cellphone, "Genre": self.genre, "Birthdate": self.birthDate])
        
    }
    
}





struct Register2_preview: PreviewProvider {
    static var previews: some View {
        Register2(mail: "", password: "")
        
    }
}
