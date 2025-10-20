//
//  ContentView.swift
//  LearnByStreak
//
//  Created by Ruba Alghamdi on 27/04/1447 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background to see the frosted effect against
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 30) {
                ZStack{
                    Circle()
                        .fill(Color.orange.opacity(1))
                        .glassEffect()
                        .frame(width: 130)
                    Image(systemName: "flame.fill")
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                   
                } //circke zstack
                VStack{
                    Text("hello learner")
                        .foregroundColor(Color.white)
                        .bold()
                    Text("this app will help you learn everyday")
                        .foregroundColor(Color.gray)
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
                Button("start learning") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
            } // big vstack
            .padding()
        } //big background zstack
    }
}

#Preview {
    ContentView()
}
