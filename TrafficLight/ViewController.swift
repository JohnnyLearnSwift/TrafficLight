//
//  ViewController.swift
//  TrafficLight
//
//  Created by Eugenie Tyan on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    enum Color {
        case red
        case yellow
        case green
    }
    
    var currentColor = Color.red
    var isFirstPressed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        fillViewAndRoundCorners(view: redView, color: .red)
        fillViewAndRoundCorners(view: yellowView, color: .yellow)
        fillViewAndRoundCorners(view: greenView, color: .green)
        
        startButton.titleLabel?.font = startButton.titleLabel?.font.withSize(20)
        startButton.layer.cornerRadius = 10
    }
    @IBAction func startButtonPressed() {
        if isFirstPressed {
            startButton.setTitle("Next", for: .normal)
            isFirstPressed = false
        }
        switch currentColor {
        case .red:
            switchColor(currentView: redView, nextView: yellowView)
            currentColor = .yellow
        case .yellow:
            switchColor(currentView: yellowView, nextView: greenView)
            currentColor = .green
        case .green:
            switchColor(currentView: greenView, nextView: redView)
            currentColor = .red
        }
    }
    
    func fillViewAndRoundCorners(view: UIView, color: Color) {
        switch color {
        case .red:
            view.backgroundColor = .red
        case .yellow:
            view.backgroundColor = .yellow
            view.alpha = 0.3
        case .green:
            view.backgroundColor = .green
            view.alpha = 0.3
        }
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    func switchColor(currentView: UIView, nextView: UIView) {
        currentView.alpha = 0.3
        nextView.alpha = 1
    }

}

