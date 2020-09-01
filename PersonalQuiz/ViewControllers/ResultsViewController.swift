//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!

    var answersChoosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        showResult()
    }
    
    private func showResult() {
        let resultAnimal = Dictionary(grouping: answersChoosen, by: { $0.type })
        .sorted(by: { $0.value.count > $1.value.count }).first?.key
        
        switch resultAnimal {
        case .cat:
            resultLabel.text = "Вы - " + "🐱"
            resultDescriptionLabel.text = AnimalType.cat.definition
        case .dog:
            resultLabel.text = "Вы - " + "🐶"
            resultDescriptionLabel.text = AnimalType.dog.definition
        case .rabbit:
            resultLabel.text = "Вы - " + "🐰"
            resultDescriptionLabel.text = AnimalType.rabbit.definition
        case .turtle:
            resultLabel.text = "Вы - " + "🐢"
            resultDescriptionLabel.text = AnimalType.turtle.definition
        case .none: break
        }
    }
}
