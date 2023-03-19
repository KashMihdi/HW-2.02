//
//  ViewController.swift
//  HW 2.02
//
//  Created by Kasharin Mikhail on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    private var viewColor: ColorView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        roundCornersOfView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 14
    }
    
    
    @IBAction func startButtonTapped() {
        if startButton.titleLabel?.text == "START" {
            startButton.setTitle("NEXT", for: .normal)
            viewColor = .red
        }
        // startButton.setTitle("NEXT", for: .normal)
        switch viewColor {
        case .red:
            greenLightView.alpha = 0.3
            redLightView.alpha = 1
            viewColor = .yellow
        case .yellow:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            viewColor = .green
        case .green:
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            viewColor = .red
        default:
            return
        }
    }
    
    
    
    private func roundCornersOfView() {
        let radiusOfCorner = redLightView.bounds.width / 2
        redLightView.layer.cornerRadius = radiusOfCorner
        yellowLightView.layer.cornerRadius = radiusOfCorner
        greenLightView.layer.cornerRadius = radiusOfCorner
    }
    
}

extension ViewController {
    private enum ColorView {
        case red, yellow, green
    }
}
