//
//  countTimer.swift
//  stories_demo
//
//  Created by amr ibrahim on 12/01/2025.
//
import Foundation
import Combine

class CountTimer: ObservableObject {
    @Published var progress: Double
    private var max: Int
    private var interval: TimeInterval
    
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }
    
    func start() {
        self.cancellable = self.publisher.autoconnect().sink { [weak self] _ in
            guard let self = self else { return }
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max {
                newProgress = 0
            }
            self.progress = newProgress
        }
    }
    
    func advancePage(by number: Int) {
        let newProgress = Double(Swift.max(0, (Int(self.progress) + number) % self.max))
        self.progress = newProgress
    }
}
