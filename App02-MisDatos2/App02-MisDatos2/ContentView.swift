//
//  ContentView.swift
//  App01-MisDatos
//
//  Created by Ana Laura Rodriguez on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var showImage: Bool = false
    @State var showEdit: Bool = false
    @State var name: String = "Ana Laura Rodriguez"
    @State var email: String = "analaurdzalba@gmail.com"
    @State var birthDate: Date = Date()
    @State var height: Double = 1.8045
    @State var weight: Int = 90
    @State var healthIndex: Int = 0
    
    let health = ["buena","regular","mala"]
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy"
        return formatter
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 0) {
                    VStack {
                        ZStack {
                            Color("arriba")
                            Text("Bienvenido a tu perfil:")
                                .font(.Oswald(size: 32))
                                .padding()
                        }
                    }
                    .frame(height:geo.size.height / 3)
                    VStack {
                        ZStack {
                            Color("abajo")
                            VStack {
                                DataView(texto:name,imagen: "person.crop.circle.fill")
                                    .padding(.top,140)
                                DataView(texto:email,imagen: "envelope.fill")
                                DataView(texto: "\(dateFormat.string(from: birthDate))", imagen:"calendar")
                                HStack {
                                    Image(systemName: "heart.fill")
                                        .font(.title)
                                        .foregroundColor(Color(health[healthIndex]))
                                    Spacer()
                                    Text("Altura:\(String(format:"%0.2f",height)) - Peso: \(weight)")
                                        .font(.Merriweather(size: 23))
                                        .padding()
                                    Spacer()
                                    }
                                .padding(.horizontal,20)
                               
                                Spacer()
                                Button(action: {
                                    showEdit.toggle()
                                }, label: {
                                    HStack {
                                        Image(systemName: "pencil.circle")
                                            .foregroundColor(Color("abajo"))
                                        Text("Editar")
                                            .font(.Oswald(size: 24))
                                            .foregroundColor(Color("abajo"))
                                    }
                                    .padding()
                                    .background(Color("arriba"))
                                    .cornerRadius(20)
                                })
                                .padding(.bottom,80)
                                
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    VStack {
                    Button(action: {
                        showImage.toggle()
                        print("hola crayola")
                    }) {
                        Image("tangy")
                            .resizable()
                            .frame(width:200)
                            .frame(height:220)
                    }
                    .frame(height: geo.size.height/3*2)
                        Spacer()
                    
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        
            .sheet(isPresented: $showEdit){
                EditView(name: $name, email: $email, birthDate: $birthDate, height: $height, weight: $weight, healthIndex: $healthIndex, health: ["buena","regular","mala"])
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
