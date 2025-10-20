//
//  ActivityView.swift
//  LearnByStreak
//
//  Created by Ruba Alghamdi on 27/04/1447 AH.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("activity")
                        .foregroundColor(Color.white)
                        .bold()
                    Spacer()
                    Button("cal") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    Button("edt") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    
                } //navigation hstack
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height:260)
                    VStack{
                        
                        MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
                        //line
                        Text("learning swift")
                        HStack{
                            ZStack{
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width:150,height :80)
                                HStack{
                                    VStack{Image(systemName: "flame.fill")}
                                    VStack(alignment:.leading){
                                        VStack{Text("2")
                                        Text("days learned")}
                                        }
                                }
                                
                            }//streak capsule
                            ZStack{
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width:150,height :80)
                                HStack{
                                    VStack{Image(systemName: "cube.fill")}
                                    VStack(alignment:.leading){
                                        VStack{Text("2")
                                        Text("days freezed")}
                                        }
                                }
                                
                            }//streak capsule
                            
                        }//two capsuls
                        
                    }// elemnts of rectangle vstack
                    
                } //rectangle zstack
                ZStack{
                    Circle()
                        .fill(Color.white)
                        .frame(width:300)
                    Text("log as learned")
                    
                }//circle zstack
                Button("log as freezed") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Text("1 out of 2 freezes used")
            }//big vstack
            .padding()
        }// background zstack
    }
}

#Preview {
    ActivityView()
}
