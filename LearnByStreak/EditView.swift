//
//  EditView.swift
//  LearnByStreak
//
//  Created by Ruba Alghamdi on 27/04/1447 AH.
//

import SwiftUI

struct EditView: View {
        var body: some View {
            ZStack {
                // Background to see the frosted effect against
                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    
                    VStack{
                        Text("Learning goal")
                            .foregroundColor(Color.white)
                            .bold()
                    } //1st vstack
                    VStack{
                        Text("i want to learn")
                            .foregroundColor(Color.white)
                        TextField("Swift", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)

                        
                    } //2nd vstack
                    VStack{
                        Text("i want to learn it in a ")
                            .foregroundColor(Color.white)
                        HStack{
                            Button("week") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            Button("month") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            Button("year") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                        } //duration hstack
                        
                    } //3rd vstack
                    Spacer()
                    
                    
                } // big vstack
                .padding()
            } //big background zstack
        }
    }


#Preview {
    EditView()
}
