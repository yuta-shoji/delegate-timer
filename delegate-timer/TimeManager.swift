import Foundation

protocol TimeManagerDelegate: NSObjectProtocol {
    func timeIsUp(message: String)
    func updateDisplayTime(time: Float)
}

class TimeManager {
    weak var delegate: TimeManagerDelegate? = nil
    var time: Float = 0.0
    var timer: Timer?
    
    func waitThreeSec() {
        self.time = 3
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { time in
            if (self.time > 0.0) {
                self.time -= 0.01
                self.delegate?.updateDisplayTime(time: self.time)
            } else {
                self.delegate?.timeIsUp(message: "3秒経過")
                self.timer?.invalidate()
                self.timer? = Timer()
            }
        }
    }
}
