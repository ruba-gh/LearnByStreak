//
//  CalendarView.swift
//  LearnByStreak
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDates: Set<DateComponents> = []

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("All Activities")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()

                MultiDatePicker("",
                    selection: $selectedDates)
                .tint(.orange)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(16)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview { CalendarView() }
