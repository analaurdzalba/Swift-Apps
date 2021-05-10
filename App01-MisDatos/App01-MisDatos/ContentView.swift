//
//  ContentView.swift
//  App01-MisDatos
//
//  Created by Ana Laura Rodriguez on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var showImage: Bool = false
    
    var body: some View {
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
                VStack {
                    ZStack {
                        Color("abajo")
                        VStack {
                            DataView(texto: "Ana Laura Rodríguez",imagen: "person.crop.circle.fill")
                                .padding(.top,20)
                            DataView(texto: "Ingeniera en Negocios y Tecnologías de Información", imagen: "info.circle.fill")
                            DataView(texto: "analaurdzalba@gmail.com",imagen: "envelope.fill")
                            DataView(texto: "8114663069", imagen:"phone.fill")
                          
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Button(action: {
                    showImage.toggle()
                    print("hola crayola")
                }, label: {
                    Image("tangy")
                        .resizable()
                        .frame(width:200)
                        .frame(height:220)
                })
               
            }
        }
        .sheet(isPresented: $showImage, content: {
            ImageView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
