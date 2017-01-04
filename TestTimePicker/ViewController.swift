//
//  ViewController.swift
//  TestTimePicker
//
//  Created by Suyogya Ratna Tamrakar on 1/3/17.
//  Copyright © 2017 ebpearls. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var dateFormatter = DateFormatter()
    
    //setup before the view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.center.y += self.view.frame.height/2
        // Do any additional setup after loading the view, typically from a nib.
        //contentView.isHidden = true
        timePicker.datePickerMode = .time
        
        
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "HH:mm:ss"
        
        
        //self.view.addSubview(contentView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setTimeButtonPressed(_ sender: UIButton) {
        
        //contentView.isHidden = false
        UIView.animate(withDuration: 0.7) {
            self.contentView.center.y -= self.view.frame.height/2
        }
        
        
        //contentView.isHidden = false
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.7) {
            self.contentView.center.y += self.view.frame.height/2
        }
        
        
        //contentView.isHidden = true
        print("CancelButton")
    }
    
    @IBAction func timeChanged(_ sender: UIDatePicker) {
        let time = dateFormatter.string(from: timePicker.date)
        
        print(time)
    }

}

