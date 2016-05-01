//
//  FlashlightTests.swift
//  FlashlightTests
//
//  Created by Ryan Walsh on 4/29/16.
//  Copyright © 2016 Ryan Walsh. All rights reserved.
//

import XCTest
@testable import Flashlight

class FlashlightTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToggle() {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else {
            XCTAssert(false, "Expected initial view controller to be ViewController class.")
            return
        }
        
        _ = viewController.view
        
        viewController.viewDidLoad()
        
        if viewController.isOn {
            XCTAssert(false, "Expected flashlight to be off by default.")
        }
        
        viewController.buttonTapped(viewController.onOffButton)
        // account for animation delay
        sleep(1)
        checkOnOffButtonLabel(viewController)
        checkvMainViewBackgroundColor(viewController)
        
        
        viewController.buttonTapped(viewController.onOffButton)
        
        sleep(1)
        checkOnOffButtonLabel(viewController)
        checkvMainViewBackgroundColor(viewController)
    }
    
    func checkOnOffButtonLabel( vc: ViewController ) {
        if vc.isOn && vc.onOffButton.titleLabel?.text != "Off" {
            XCTAssert(false, "Expected title label to be \"Off\", instead got \(vc.onOffButton.titleLabel?.text)")
        }
        
        if !vc.isOn && vc.onOffButton.titleLabel?.text == "On" {
            XCTAssert(false, "Expected title label to be \"Off\", instead got \(vc.onOffButton.titleLabel?.text)")
        }
    }
    
    func checkOnOffLabelColor( vc: ViewController ) {
        if vc.isOn && vc.onOffButton.titleLabel?.textColor !== UIColor.blackColor() {
            XCTAssert(false, "Expected the on off button to have a text color of UIColor.blackColor(), instead got \(vc.onOffButton.titleLabel?.textColor)")
        }
        if vc.isOn && vc.onOffButton.titleLabel?.textColor !== UIColor.whiteColor() {
            XCTAssert(false, "Expected the on off button to have a text color of UIColor.blackColor(), instead got \(vc.onOffButton.titleLabel?.textColor)")
        }
    }
    
    func checkvMainViewBackgroundColor( vc: ViewController ) {
        if vc.isOn && vc.mainView.backgroundColor !== UIColor.whiteColor() {
            XCTAssert(false, "Expected background color to be UIColor.whiteColor(), instead got \(vc.mainView.backgroundColor)")
        }
        
        if !vc.isOn && vc.mainView.backgroundColor !== UIColor.blackColor() {
            XCTAssert(false, "Expected background color to be UIColor.blackColor(), instead got \(vc.mainView.backgroundColor)")
        }
    }

}
