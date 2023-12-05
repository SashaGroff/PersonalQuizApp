//
//  ResultViewController.swift
//  PersonalQuizApp
//
//  Created by Александр Гончаров on 02.12.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
     // MARK: - IB Outlets
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var aboutAnimalLabel: UILabel!
    
     // MARK: - Public Properties
    var answersChosen: [Answer]!
    
     // MARK: - View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        getResult()
    }
    
     // MARK: - IB Action
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func getResult() {
        var animalCount: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        for animal in animals {
            animalCount[animal] = (animalCount[animal] ?? 0) + 1
        }
        
        let sortedAnimalCount = animalCount.sorted { $0.value > $1.value }
        guard let sortedAnimal = sortedAnimalCount.first?.key else { return }
        
        resultAnimalLabel.text = "Вы - \(sortedAnimal.rawValue)"
        aboutAnimalLabel.text = " \(sortedAnimal.defenition)"
    }
}
