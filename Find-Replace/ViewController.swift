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
    
    private var text: String = ""
    private var wordToFind: String?
    private var wordToReplaceWith: String?
    
    func findAndReplaceIn(_ find: String, _ replace: String, in text: String) -> String {
        var str = text
        var textIsReady = false

        repeat {
            if let findWord = str.range(of: find) {
                str.replaceSubrange(findWord, with: replace)
            } else {
                textIsReady = true
            }
        } while !textIsReady
        return str
    }
    
    private func checkAndCapitalize(_ text: String) -> String {
        let sentences = text.components(separatedBy: ". ").filter { !$0.isEmpty }
        var str = ""
        for sentence in sentences {
            let s = sentence.capitalizingFirstLetter()
            str.append(s)
            if sentence != sentences.last {
                str += ". "
            }
        }
        return str
    }
    
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
        text = findAndReplaceIn(find, replace, in: text)
        
        // Display updated text
        textView.text = checkAndCapitalize(text)
        // Clear the fields
        findTextField.text = ""
        replaceTextField.text = ""
    }
}


// MARK: Extensions

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
