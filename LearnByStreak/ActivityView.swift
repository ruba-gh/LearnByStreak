//
//  ActivityView.swift
//  LearnByStreak
//

import SwiftUI

struct ActivityView: View {
    @State private var goal: LearningGoal? = GoalManager.shared.loadGoal()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 20) {
                    // Header
                    HStack {
                        Text("Activity")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        NavigationLink(destination: CalendarView()) {
                            Image(systemName: "calendar")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        NavigationLink(destination: EditView()) {
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    }
                    .padding(.horizontal)

                    // Calendar card placeholder
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 260)
                        VStack {
                            Text("Learning \(goal?.topic ?? "Swift")")
                                .foregroundColor(.white)
                                .font(.headline)
                            HStack(spacing: 12) {
                                statCard(icon: "flame.fill", label: "Days Learned", count: 2)
                                statCard(icon: "cube.fill", label: "Days Freezed", count: 1)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Big circle button
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 300)
                        Button("Log as Learned") {
                            logProgress(isFreeze: false)
                        }
                    }

                    Button("Log as Freezed") {logProgress(isFreeze: true) }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 50)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Capsule())
                        .foregroundColor(.white)


                    


                    Spacer()
                }
                .padding(.top)
            }
        }
    }
    
    private func logProgress(isFreeze: Bool) {
        guard var goal = goal else { return }
        let today = Calendar.current.startOfDay(for: Date())

        // Prevent logging more than once a day
        if let last = goal.lastLoggedDate,
           Calendar.current.isDate(last, inSameDayAs: today) {
            return
        }

        goal.lastLoggedDate = today

        if isFreeze {
            goal.freezesUsed += 1
        } else {
            goal.streakDays += 1
        }

        GoalManager.shared.saveGoal(goal)
        self.goal = goal
        
        if let last = goal.lastLoggedDate,
           Date().timeIntervalSince(last) > 60 * 60 * 32 { // 32 hours
            goal.streakDays = 0
        }

    }

    // Small stat capsule
    @ViewBuilder
    private func statCard(icon: String, label: String, count: Int) -> some View {
        ZStack {
            Capsule()
                .fill(Color.white.opacity(0.1))
                .frame(width: 150, height: 80)
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .foregroundColor(.orange)
                    .font(.title2)
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(count)")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(label)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
        }
    }
}

#Preview { ActivityView() }
