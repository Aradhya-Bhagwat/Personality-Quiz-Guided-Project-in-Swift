//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by SDC-USER on 11/09/25.
//

import UIKit

class ResultViewController: UIViewController {

    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) {
            (count, answer) in
            if let existingCount = count[answer.type]{
                count[answer.type] = existingCount + 1
            }
            else {
                count[answer.type] = 1
            }
        }
            let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) in
                return pair1.value > pair2.value
            })
            let mostCommonAnswer = frequencyOfAnswers.sorted{ $0.1 > $1.1}.first!.key
            resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultDefinitionLabel.text = mostCommonAnswer.definition
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
