import UIKit

class ViewController: UIViewController, TimeManagerDelegate {

    let timeManager = TimeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeManager.delegate = self
        timeLabel.text = "00:00:00"
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func threeSecTimerButton(_ sender: Any) {
        timeManager.waitThreeSec()
    }
    
    func timeIsUp(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func updateDisplayTime(time: Float) {
        let milliSecond = Int(time * 100) % 100
        let second = Int(time) % 60
        let minutes = Int(time / 60)
        
        timeLabel.text = String(format: "%02d:%02d:%02d", minutes, second, milliSecond)
    }
}

