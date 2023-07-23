//
//  ViewController.swift
//  SPMDemo
//
//  Created by Tuan Hoang on 22/07/2023.
//

import UIKit
import MathAlgorithm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let algo = MathAlgorithm()
        let a = algo.customAdd(4, n2: 5)

        print(a)
    }

}

