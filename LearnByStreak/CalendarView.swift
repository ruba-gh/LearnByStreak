//
//  CalendarView.swift
//  LearnByStreak
//
//  Created by Ruba Alghamdi on 27/04/1447 AH.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                Text("all activities")
                    .foregroundColor(Color.white)
                MultiDatePicker("Label", selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                .padding()
            }
            
        }
        
    }
}

#Preview {
    CalendarView()
}
