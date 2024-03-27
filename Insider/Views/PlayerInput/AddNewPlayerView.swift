//
//  NewPlayerView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//
import SwiftUI

struct AddNewPlayerView: View {
    
    @Binding var isShow: Bool
    @State var name: String
    @Binding var a: Int // para saber la cantidad de jugaodres (por borrar)
    @State var isEditing = false
    @FocusState private var showkeyboard: Bool


    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("Add a new player")
                        .font(.custom("Helvetica", size: 30))
                    Spacer()
                    Button(action: {
                        self.isShow = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .font(.headline)
                    }
                }
                
                TextField("Write the nickname", text: $name, onEditingChanged: { (editingChanged) in
                    self.isEditing = editingChanged
                })
                .focused($showkeyboard)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom)
                .onAppear {
                    self.showkeyboard = true
                }
                
                // Save button for adding the todo item
                Button(action: {
                    if self.name.trimmingCharacters(in: .whitespaces) == "" {
                        return
                    }
                    
                    self.isShow = false
                    self.addPlayer(name: self.name.trimmingCharacters(in: .whitespacesAndNewlines))
                    
                }) {
                    Text("Looks great!")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color("InsiderRed"))
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                
            }
            .padding()
            .background(.white)
            .cornerRadius(10, antialiased: true)
            .shadow(radius: 10)
            .padding()
        }
        //.containerRelativeFrame([.horizontal, .vertical])
        .padding()
        .background {
            Color.black
                .ignoresSafeArea()
        }
        
    }
    
    
    private func addPlayer(name: String) {
        let newItem = NameInputItem(name: name)
        nameListItems.append(newItem)
        Game.shared.players.append(Player(name: name, role: "COMMONS"))
        a += 1
    }
}

#Preview(){
    AddNewPlayerView(isShow: .constant(true), name: "", a: .constant(1))
}
