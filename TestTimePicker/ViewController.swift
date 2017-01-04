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
    @IBOutlet weak var backView: UIView!
    
    var dateFormatter = DateFormatter()
    var offset:CGFloat = 0.0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        offset = contentView.bounds.height
        
        timePicker.datePickerMode = .time
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "HH:mm:SS"
        
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBackView)))
        
    }
    
    func tapBackView() {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.backView.backgroundColor = UIColor(white: 0.2, alpha: 0.0)
            
            if (self.count == 0) {
                self.contentView.center.y += self.offset
            }
            
        }, completion: { (finished) in
            self.count += 1
        })
    }

    @IBAction func setTimeButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.backView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
            self.contentView.center.y -= self.offset
        }, completion: { (finished) in
            self.count = 0
        })
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.backView.backgroundColor = UIColor(white: 0.2, alpha: 0.0)
            self.contentView.center.y += self.offset
            
        }, completion: { (finished) in
            self.count += 1
        })
    }
    
    @IBAction func timeChanged(_ sender: UIDatePicker) {
        let time = dateFormatter.string(from: timePicker.date)
        print(time)
    }

}

