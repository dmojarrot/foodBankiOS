//
//  ContentView.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 29/08/21.
//

import SwiftUI



struct ContentView: View {
    var body: some View{
        ResetPassword()
    }
}

struct LandingPage: View{
    var body: some View{
        VStack {
            ZStack{
                Color("greenBackground").ignoresSafeArea()
                Image("logo").resizable().aspectRatio(contentMode: .fill).padding(.bottom, 82.0).frame(width: 280, height: 160, alignment: .center)}
        }
    }
}

struct Login: View{
    @State var mail = ""
    @State var password = ""
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        Text("Bienvenido")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenTitle"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Inicia sesión")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                            .padding(.bottom, 40)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading){
                    VStack(alignment: .leading) {
                        Text("Email:")
                            .font(.subheadline)
                            .fontWeight(.light)
                        TextField("", text: $mail)
                            .padding()
                            .background(Color("squareColors"))
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        Text("Contraseña:")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.top)
                        
                        SecureField("", text: $password)
                            .padding()
                            .background(Color("squareColors"))
 
                            .cornerRadius(20)
                            .padding(.bottom,40)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        Button(action: {}, label: {
                            Text("Entrar".uppercased())
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                            
                        })
                        Button(action: {}, label: {
                            Text("¿Olvidaste tu contraseña?")
                                .underline()
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical,20)
                        })
                        
                        
                        Divider().frame(height: 0.3).background(Color("greenBackground")).padding(.horizontal, 60).padding(.bottom, 20)
                        
                        Button(action: {}, label: {
                            Text("Registrate".uppercased())
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.black))
                                .cornerRadius(20)
                            
                            
                        })
                        
                    }
                    
                }.padding(.horizontal, 40)
                
            }
            
        }
    }
    
}

struct ResetPassword: View {
    @State var mail = ""
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        Text("¿Olvidaste tu contraseña?")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenTitle"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Ingresa tu correo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                            .padding(.bottom, 40)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading){
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.subheadline)
                            .fontWeight(.light)
                        TextField("", text: $mail)
                            .padding()
                            .background(Color("squareColors"))
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                            .padding(.bottom,20)
                        Button(action: {}, label: {
                            Text("Enviar".uppercased())
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                                .padding(.bottom,40)
                            
                        })
                    }
                    
                }.padding(.horizontal, 30)
                
            }
        }
        
    }
}

struct SignUp: View {
    @State var mail = ""
    @State var password = ""
    @State var confirmPassword = ""
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        Text("¿No tienes cuenta?")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenTitle"))
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
                    Text("Email")
                        .font(.subheadline)
                        .fontWeight(.light)
                    TextField("", text: $mail)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                        .padding(.bottom,20)
                    Text("Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    SecureField("", text: $password)
                        .padding()
                        .background(Color("squareColors"))
                        .foregroundColor(.black
                        )
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Text("Confirmar Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    SecureField("", text: $confirmPassword)
                        .padding()
                        .background(Color("squareColors"))
                        .foregroundColor(.black
                        )
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Button(action: {}, label: {
                        Text("Continuar".uppercased())
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
        }
    }
}

struct SignUp2: View {
    @State var name = ""
    @State var lastName = ""
    @State var cellphone = ""
    @State var genre = ""
    @State var birthDate = ""
    
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        Text("Finaliza tu               cuenta")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenTitle"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
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
                                .background(Color("squareColors"))
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
                                .background(Color("squareColors"))
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
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Text("Genero")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $genre)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Text("Fecha de Nacimiento")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $birthDate)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Button(action: {}, label: {
                        Text("Registrarse".uppercased())
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
        }
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUp2()
        }
    }
}

