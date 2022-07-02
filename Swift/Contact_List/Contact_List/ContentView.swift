import SwiftUI

struct StrPg: View {
    
    @State var cont:[String]=[
    "Ana","Joe","Candice","John"
    ]
    
    var body: some View {
        NavigationView {
            List{
                Section(
                    header: Text("Nomes")){
                    ForEach(cont,id:\.self){ cont in
                        Text(cont)
                    }
                    .onDelete(perform:delete)
                    .onMove(perform:move)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Contactos")
            .navigationBarItems(leading: EditButton(),trailing:NavigationLink(destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,label: {Text("Adicionar")}))
        }
    }
    
    func delete(indexSet: IndexSet) {
        cont.remove(atOffsets: indexSet)
    }
    
    func move(indices:IndexSet,newOffset:Int){
        cont.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add(){
        cont.append("Maria")
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StrPg()
    }
}
