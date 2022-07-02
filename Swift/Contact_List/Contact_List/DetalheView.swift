

import SwiftUI

struct DetalheView: View {
    
    @State var contacto:Contactos
    @State var aaa = ""
    @State var bbb = ""
    @State var ccc = ""
    
    
    var body: some View {
        VStack{
            TextField(contacto.nome,text:$ccc)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            Form{
                Section{
                    HStack{
                        Text("Telémovel")
                        Spacer()
                        TextField(contacto.tele,text:$aaa)
                            .padding(5)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("Email")
                        Spacer()
                        TextField(contacto.email,text:$bbb)
                            .padding(5)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)                    }
                }
                Section{
                    Button(action: {print("A Enviar Mensagem...")}, label: {
                        Text("Enviar Mensagem")
                    })
                    Button(action: {print("A Telefonar...")}, label: {
                        Text("Telefonar")
                    })
                    Button(action:{ self.save()}, label:{
                        Text("Save")
                    })
                }
                
            }
        }
        

        }
    func save(){
        guard !aaa.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        guard !bbb.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        guard !ccc.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        contacto.nome = ccc
        contacto.tele = aaa
        contacto.email = bbb
    }
    
}

struct DetalheView_Previews: PreviewProvider {
    static var previews: some View {
        DetalheView(contacto: contactos[0])
    }
}
