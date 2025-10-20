//
//  ContentView.swift
//  LearnByStreak
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDuration = "Week"
    @State private var learningTopic = ""
    @State private var showActivity = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 30) {
                    // Fire icon
                    ZStack {
                        Circle()
                            .fill(Color.orange.opacity(1))
                            .glassEffect()
                            .frame(width: 130)
                        Image(systemName: "flame.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }

                    // Greeting
                    VStack {
                        Text("Hello Learner")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        Text("This app will help you learn everyday!")
                            .foregroundColor(.gray)
                    }

                    // Input: Topic
                    VStack {
                        Text("I want to learn")
                            .foregroundColor(.white)
                        TextField("Swift", text: $learningTopic)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 250)
                    }

                    // Duration
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

                    // Navigation to ActivityView
                    NavigationLink(destination: ActivityView(), isActive: $showActivity) { EmptyView() }

                    Button("Start Learning") {
                        showActivity = true
                    }
                    .font(.headline)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview { ContentView() }
