//
//  ViewController.swift
//  Find-Replace
//
//  Created by Daniel Yamrak on 30.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var findTextField: UITextField!
    @IBOutlet weak var replaceTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var replaceButton: UIButton!
    
    var text: String = ""
    var wordToFind: String?
    var wordToReplaceWith: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        replaceButton.layer.cornerRadius = 8
        replaceButton.clipsToBounds = true
    }


    @IBAction func replaceDidTap(_ sender: UIButton) {
        // Copy text to a string (if there is one)
        text = textView.text
        
        // Read and copy find field and replace field to a string
        guard let find = findTextField.text,
              let replace = replaceTextField.text else {
            return
        }
        
        // Process the text
        var textIsReady = false

        repeat {
            if let findWord = text.range(of: find) {
                text.replaceSubrange(findWord, with: replace)
            } else {
                textIsReady = true
            }
        } while !textIsReady
        
        // Display updated text
        textView.text = text
        // Clear the fields
        findTextField.text = ""
        replaceTextField.text = ""
    }
}

