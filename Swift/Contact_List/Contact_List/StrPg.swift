	import SwiftUI

struct StrPg: View {

    @State var text = ""
    @State var num = ""
    @State var email = ""
    
    var body: some View {	    
        NavigationView {
            VStack{
            Section(
                    header: Text("Nomes")){
                        TextField("Nome da Pessoa",text:$text)
                            .padding(5)
                        TextField("Numero",text:$num)
                            .padding(5)
                        TextField("Email",text:$email)
                            .padding(5)
                        
                        Button(action: {
                            self.addtoList()
                        }, label: {
                            Text("Adicionar nome")
                                .frame(width:250 , height: 50, alignment: .center)
                                .background(Color.gray)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        })
                        
                        
                        List{ ForEach(contactos,id:\.self) {contacto in
                        NavigationLink(destination: DetalheView(contacto: contacto)){
                         ContactosRow(contacto: contacto)
                        }
                        }
                        .onDelete(perform:self.delete)
                        .onMove(perform:self.move)
                        
                }
                
            }
            }
            
            .listStyle(GroupedListStyle())
            .navigationTitle("Contactos")
            .navigationBarItems(leading: EditButton())
    }
}
    func delete(indexSet: IndexSet) {
        contactos.remove(atOffsets: indexSet)
    }
    
    func move(indices:IndexSet,newOffset:Int){
        contactos.move(fromOffsets: indices, toOffset: newOffset)
    }

    
    func addtoList(){
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        guard !num.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        
        let newNome = Contactos(nome: text,tele:num,email:email)
        contactos.append(newNome)
        text=""
        num=""
        email=""
    }
}

struct ContactosRow:View{
    
    let contacto:Contactos
    
    var body: some View{
        VStack(alignment:.leading){
            Text(contacto.nome)
            Text(contacto.tele)
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StrPg()
    }
}
