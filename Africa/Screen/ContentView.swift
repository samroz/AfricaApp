//
//  ContentView.swift
//  Africa
//
//  Created by Samroz Javed on 30/07/2022.
//

import SwiftUI

struct ContentView: View {
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let animals: [animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    
    @State var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
                    //Initialized again
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        
        //updated count by adding into previous count
        gridColumn = gridLayout.count
        print("count : ", gridLayout.count)
        
        //Toolbar image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListRowView(animal: animal)
                            }//: NAVIGATIONLINK to navigate to different pages
                            
                        }//: LOOP
                        CreditsView()
                        
                        //MARK: CUSTOM MODIFIER
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//: NAVIGATIONLINK
                            }//: LOOP
                        }//: GRID
                        .padding()
                        .animation(.easeIn, value: isGridViewActive)
                    }//: SCROLL
                }//: LIST
            }//: GROUP
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        //LIST
                        Button(action: {
                            print("list view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //GRID
                        
                        Button(action: {
                            print("grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            
                            gridSwitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                    }//: HSTACK
                }//: BUTTONS
            }//: TOOLBAR
           
        } //: Navigation
        
        //MARK: LIST STYLE IN IPAD
        //.navigationViewStyle(StackNavigationViewStyle())
         //.listStyle(SidebarListStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
