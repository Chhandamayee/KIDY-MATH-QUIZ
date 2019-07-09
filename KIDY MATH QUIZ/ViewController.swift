//
//  ViewController.swift
//  KIDY MATH QUIZ
//
//  Created by chhandamayee samal on 05/07/19.
//  Copyright © 2019 digilaytech. All rights reserved.
//

import UIKit

extension UITextField{
    
    func addDoneButtonToKeyboard(myAction:Selector?){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: myAction)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var userAnsewrTextfield: UITextField!
    
    var quizList: [Quiz] = []
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quizList.append(Quiz(id: 0, question: "What is 1 + 11?", answer: "12"))
        quizList.append(Quiz(id: 1, question: "5 - 4?", answer: "1"))
        quizList.append(Quiz(id: 2, question: "4 * 3 is?", answer: "12"))
        quizList.append(Quiz(id: 3, question: "What is 11 + 19?", answer: "30"))
        quizList.append(Quiz(id: 4, question: "50 - 9?", answer: "41"))
        quizList.append(Quiz(id: 5, question: "14 * 3 is?", answer: "42"))
        quizList.append(Quiz(id: 6, question: "What is 10 / 2?", answer: "5"))
        quizList.append(Quiz(id: 7, question: "143 - 258?", answer: "-115"))
        quizList.append(Quiz(id: 8, question: "44 * 33 is?", answer: "1452"))
        quizList.append(Quiz(id: 9, question: "What is 1111 + 919?", answer: "2030"))
        quizList.append(Quiz(id: 10, question: "500 - 19?", answer: "481"))
        quizList.append(Quiz(id: 11, question: "14 * 34 is?", answer: "476"))
        quizList.append(Quiz(id: 12, question: "What is 1 - 1?", answer: "0"))
        quizList.append(Quiz(id: 13, question: "0 / 10?", answer: "0"))
        quizList.append(Quiz(id: 14, question: "43 * 31 is?", answer: "1333"))
        quizList.append(Quiz(id: 15, question: "What is 61 + 199?", answer: "260"))
        quizList.append(Quiz(id: 16, question: "50 * 0?", answer: "0"))
        quizList.append(Quiz(id: 17, question: "14 + 16 is?", answer: "30"))
        quizList.append(Quiz(id: 18, question: "What is 12 * 12?", answer: "144"))
        quizList.append(Quiz(id: 19, question: "900 - 99?", answer: "801"))
        quizList.append(Quiz(id: 20, question: "444 * 333 is?", answer: "147852"))
        quizList.append(Quiz(id: 21, question: "What is 911119 + 99199?", answer: "190318"))
        quizList.append(Quiz(id: 22, question: "15 - 9?", answer: "6"))
        quizList.append(Quiz(id: 23, question: "14 * 14 + 14 = ??", answer: "210"))
        quizList.append(Quiz(id: 24, question: "155 - 19 * 13 = ?", answer: "-92"))
        quizList.append(Quiz(id: 25, question: "144 / 144 + 144 = ??", answer: "145"))
        quizList.append(Quiz(id: 26, question: "1551 - 55?", answer: "1496"))
        quizList.append(Quiz(id: 27, question: "24 * 24 = ??", answer: "576"))
        quizList.append(Quiz(id: 28, question: "what is 648 / 9 ?", answer: "72"))
        quizList.append(Quiz(id: 29, question: "789 % 15 = ??", answer: "52"))
        quizList.append(Quiz(id: 30, question: "Last Bonus Q :500 / 500 * 500 + (500 - 500) - 50 = ??", answer: "451"))
        
        
        questionLabel.text = quizList[currentQuestionIndex].question
        userAnsewrTextfield.addDoneButtonToKeyboard(myAction:  #selector(self.userAnsewrTextfield.resignFirstResponder))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial aplha
        nextQuestionLabel.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.userAnsewrTextfield.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        if (userAnsewrTextfield.text == "")
        {
            let alertController = UIAlertController(title: "Enter An Answer KIDO :)", message: "??? Are You Cheating ???", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "NO, I AM A GOOD KID", style: UIAlertActionStyle.default) {
                UIAlertAction in
                
            }
            // Add the actions
            alertController.addAction(okAction)
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            let answer: String = quizList[currentQuestionIndex].answer
            answerLabel.text = answer
            if (userAnsewrTextfield.text == answerLabel.text)
            {
                let alertController = UIAlertController(title: "CORRECT ANSWER :)", message: "Try Next Question", preferredStyle: .alert)
                
                // Create the actions
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    
                }
                // Add the actions
                alertController.addAction(okAction)
                // Present the controller
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                let alertController = UIAlertController(title: "WRONG  ANSWER :(", message: "Check hidden Answer....Try Next Questions With Correct Answers", preferredStyle: .alert)
                
                // Create the actions
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    
                }
                // Add the actions
                alertController.addAction(okAction)
                // Present the controller
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        if (answerLabel.text == "ANSWER HIDDEN HERE")
        {
            let alertController = UIAlertController(title: "CAN'T SKIP", message: "SOLVE THIS QUESTION FIRST", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                
            }
            // Add the actions
            alertController.addAction(okAction)
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            currentQuestionIndex += 1
            if currentQuestionIndex == quizList.count {
                currentQuestionIndex = 0
            }
            
            let question: String = quizList[currentQuestionIndex].question
            nextQuestionLabel.text = question
            answerLabel.text = "ANSWER HIDDEN HERE"
            userAnsewrTextfield.text = ""
            animateLabelTransitions()
        }
        
    }
    
    func animateLabelTransitions() {
        // Animate the alpha
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
                        self.questionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
        },
                       completion: { _ in
                        swap(&self.questionLabel,
                             &self.nextQuestionLabel)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

