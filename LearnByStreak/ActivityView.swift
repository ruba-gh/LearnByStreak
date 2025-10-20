//
//  ActivityView.swift
//  LearnByStreak
//

import SwiftUI

struct ActivityView: View {
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
                            Text("Learning Swift")
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
                        Text("Log as Learned")
                            .font(.title2)
                            .bold()
                    }

                    Button("Log as Freezed") { }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 50)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Capsule())
                        .foregroundColor(.white)

                    Text("1 out of 2 freezes used")
                        .foregroundColor(.gray)

                    Spacer()
                }
                .padding(.top)
            }
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
