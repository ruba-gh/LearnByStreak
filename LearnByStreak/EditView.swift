//
//  EditView.swift
//  LearnByStreak
//

import SwiftUI

struct EditView: View {
    @State private var learningTopic = ""
    @State private var selectedDuration = "Week"

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 25) {
                Text("Learning Goal")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()

                VStack {
                    Text("I want to learn")
                        .foregroundColor(.white)
                    TextField("Swift", text: $learningTopic)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 250)
                }

                VStack {
                    Text("I want to learn it in a")
                        .foregroundColor(.white)
                    HStack {
                        ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                            Button(duration) {
                                selectedDuration = duration
                            }
                            .padding()
                            .frame(width: 90)
                            .background(selectedDuration == duration ? Color.orange : Color.gray.opacity(0.3))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview { EditView() }
