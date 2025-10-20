//
//  EditView.swift
//  LearnByStreak
//

import SwiftUI

struct EditView: View {
    @State private var learningTopic = ""
    @State private var selectedDuration = "Week"
    @State private var showConfirmation = false
    @State private var navigateToActivity = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 25) {
                    Text("Learning Goal")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding(.top, 10)

                    VStack {
                        Text("I want to learn")
                            .foregroundColor(.white)
                        TextField("Swift", text: $learningTopic)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
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
            // MARK: - Toolbar Buttons
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showConfirmation = true }) {
                        ZStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 36, height: 36)
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Learning Goal")
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

            // MARK: - Confirmation Dialog
            .confirmationDialog(
                "Update Learning goal",
                isPresented: $showConfirmation
            ) {
                Button("Dismiss", role: .cancel) { }
                Button("Update") {
                    let newGoal = LearningGoal(
                        topic: learningTopic.isEmpty ? "Swift" : learningTopic,
                        duration: selectedDuration,
                        startDate: Date(),
                        streakDays: 0,
                        freezesUsed: 0,
                        lastLoggedDate: nil
                    )
                    GoalManager.shared.saveGoal(newGoal)

                    // ✅ Go back to ActivityView after saving
                    navigateToActivity = true
                }
            } message: {
                Text("If you update now, your streak will start over.")
            }
            .onAppear {
                if let goal = GoalManager.shared.loadGoal() {
                    learningTopic = goal.topic
                    selectedDuration = goal.duration
                }
            }
        }
    }
}

#Preview { EditView() }
