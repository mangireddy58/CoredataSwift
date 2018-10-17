//
//  RootViewController.swift
//  CoreDataSwift
//
//  Created by Sai Praveen Kumar on 16/10/18.
//  Copyright © 2018 Mangi. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func isPhoneDevice() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    func isDeviceiPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    func isPadProDevice() -> Bool {
        let SCREEN_WIDTH = Float(UIScreen.main.bounds.size.width)
        let SCREEN_HEIGHT = Float(UIScreen.main.bounds.size.height)
        let SCREEN_MAX_LENGTH: Float = fmax(SCREEN_WIDTH, SCREEN_HEIGHT)
        
        return UIDevice.current.userInterfaceIdiom == .pad && SCREEN_MAX_LENGTH == 1366.0
    }
    
    func isPhoneXDevice() -> Bool {
        let SCREEN_WIDTH = Float(UIScreen.main.bounds.size.width)
        let SCREEN_HEIGHT = Float(UIScreen.main.bounds.size.height)
        let SCREEN_MAX_LENGTH: Float = fmax(SCREEN_WIDTH, SCREEN_HEIGHT)
        
        return UIDevice.current.userInterfaceIdiom == .phone && SCREEN_MAX_LENGTH == 812.0
    }
}
