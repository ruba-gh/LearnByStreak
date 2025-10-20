//
//  GoalManager.swift
//  LearnByStreak
//
//  Created by Ruba Alghamdi on 28/04/1447 AH.
//


import Foundation

// MARK: - Learning Goal Model
struct LearningGoal: Codable, Equatable {
    var topic: String
    var duration: String
    var startDate: Date
    var streakDays: Int
    var freezesUsed: Int
    var lastLoggedDate: Date?
}

// MARK: - Goal Manager
final class GoalManager {
    static let shared = GoalManager()
    private init() {}

    private let currentGoalKey = "currentLearningGoal"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    // Save current goal
    func saveGoal(_ goal: LearningGoal) {
        if let encoded = try? encoder.encode(goal) {
            UserDefaults.standard.set(encoded, forKey: currentGoalKey)
        }
    }

    // Load current goal
    func loadGoal() -> LearningGoal? {
        guard let data = UserDefaults.standard.data(forKey: currentGoalKey),
              let goal = try? decoder.decode(LearningGoal.self, from: data) else {
            return nil
        }
        return goal
    }

    // Clear current goal
    func clearGoal() {
        UserDefaults.standard.removeObject(forKey: currentGoalKey)
    }
}
