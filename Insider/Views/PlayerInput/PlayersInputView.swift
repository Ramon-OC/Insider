//
//  PlayersInputView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//
import SwiftUI

var todoItems: [ToDoItem] = []

struct PlayersInputView: View {
    
    @State private var newItemName: String = ""
    @State private var showNewTask = false
    @State private var noPlayers = todoItems.count
    @State private var showNewButton = false

    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    VStack{
                        Text("Player Names")
                            .foregroundColor(.white)
                            .font(.custom("Helvetica", size: 41))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Number of players: "+String(noPlayers))
                            .foregroundColor(.white)
                            .font(.custom("Helvetica", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    if(noPlayers < 8){
                        Button(action: {
                            self.showNewTask = true
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                        .transition(.opacity)


                    }
                    
                    
                }
                .padding(.all, 20)
                
                List {
                    ForEach(todoItems) { todoItem in
                        ToDoListRow(todoItem: todoItem)
                            .listRowBackground(Color.black)
                    }
                    .onDelete(perform: deleteTask)
                }
                .background(Color.black)
                .listStyle(.plain)
                
            
                
                if noPlayers >= 4 {
                    Button(action: {
                        
                        // Action when the Start button is tapped
                    }) {
                        Text("Start the Game")
                            .font(.custom("Helvetica", size: 17))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("InsiderRed"))
                            .cornerRadius(8)
                        }
                    .transition(.scale) // Add transition animation when the button appears
                }

                
            }
            .rotation3DEffect(Angle(degrees: showNewTask ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .offset(y: showNewTask ? -50 : 0)
            .animation(.easeOut, value: showNewTask)
            
            // If there is no data, show an empty view
            if todoItems.isEmpty {
                NoDataView()
            }
            
            // Display the "Add new todo" view
            if showNewTask {
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showNewTask = false
                    }
                
                NewPlayerView(isShow: $showNewTask, name: "", a: $noPlayers)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0), value: showNewTask)
            }
            
            
            
        }
        .background(.black)
    }
    
    private func deleteTask(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
        noPlayers += -1
    }
}


struct BlankView : View {
    var bgColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NoDataView: View {
    var body: some View {
        VStack{
            Text("Add players names\nusing the plus symbol")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct ToDoListRow: View {
    var todoItem: ToDoItem
    
    var body: some View {
        VStack {
            
            Text(self.todoItem.name)
                .foregroundColor(.white)
                .font(.system(size: 40, design: .rounded))
                .bold()
                .animation(.default)
            
            Spacer()
        }
    }
}

struct ToDoItem: Identifiable {
    let id = UUID()
    let name: String
}

#Preview {
    PlayersInputView()
}
