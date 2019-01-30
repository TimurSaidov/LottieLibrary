//
//  ViewController.swift
//  LottieLibrary
//
//  Created by Timur Saidov on 30/01/2019.
//  Copyright © 2019 Timur Saidov. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationView: LOTAnimationView!
    
    @IBAction func startAnimationPressed(_ sender: UIButton) {
        if !animationView.isAnimationPlaying {
//            animationView.play()
            animationView.play { (finish) in // По завершении анимации выполняется completion. Если есть зацикливание loopAnimation, то completion срабатывает лишь в момент остановки анимации .stop(). Если есть autoReverseAnimation, то срабатывает после него.
                print("End animation")
            }
            sender.setTitle("Stop animation", for: .normal)
            sender.setTitleColor(UIColor(red: 255/255, green: 0, blue: 0, alpha: 1), for: .normal)
        } else {
            animationView.stop()
            sender.setTitle("Start animation", for: .normal)
            sender.setTitleColor(UIColor(red: 14/255, green: 122/255, blue: 254/255, alpha: 1), for: .normal)
        }
    }
    
    private func addWatermelon() {
        animationView.setAnimation(named: "watermelon")
        animationView.contentMode = .scaleAspectFit
//        animationView.animationSpeed = 2 // Скорость анимации изменяется в 2 раза. В 2 раза быстрее.
        animationView.autoReverseAnimation = true // Анимация воспроизводится в обратном порядке.
        animationView.loopAnimation = true // Зацикливание анимации.
    }
    
    private func addSwitch() {
        let mySwitch = LOTAnimatedSwitch(named: "switch")
        mySwitch.center = CGPoint(x: 135, y: 100)
        view.addSubview(mySwitch)
        // Длина анимации 0...1 (выключено - включено - выключено)
        mySwitch.setProgressRangeForOnState(fromProgress: 0, toProgress: 0.45)
        mySwitch.setProgressRangeForOffState(fromProgress: 0.45, toProgress: 1)
        
        mySwitch.addTarget(self, action: #selector(switchToogle(animatedSwitch:)), for: .valueChanged)
    }
    
    @objc func switchToogle(animatedSwitch: LOTAnimatedSwitch) {
        if animatedSwitch.isOn {
            print("The switch is on")
        } else {
            print("The switch is off")
        }
    }
    
    private func addLike() {
        let like = LOTAnimatedSwitch(named: "like")
        like.center = CGPoint(x: 270, y: 100)
        
//        like.translatesAutoresizingMaskIntoConstraints = false
//        let top = like.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
//        let right = like.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 10)
//        let width = like.widthAnchor.constraint(equalToConstant: 50)
//
//        NSLayoutConstraint.activate([top, right, width])
        
        view.addSubview(like)
        
        like.setProgressRangeForOnState(fromProgress: 0, toProgress: 1)
        like.setProgressRangeForOffState(fromProgress: 1, toProgress: 0)
        
        like.addTarget(self, action: #selector(likeSwitchToogle(animatedSwitch:)), for: .valueChanged)
    }
    
    @objc func likeSwitchToogle(animatedSwitch: LOTAnimatedSwitch) {
        if animatedSwitch.isOn {
            print("The like switch is on")
        } else {
            print("The like switch is off")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWatermelon()
        
        addSwitch()
        
        addLike()
    }
}
