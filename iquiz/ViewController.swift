//
//  ViewController.swift
//  iquiz
//
//  Created by Ryan Oh on 5/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var quizTableView: UITableView!
    
    @IBAction func didTapSettings(_ sender: Any) {
        showAlert()
    }
    var quizList = [Quiz]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initList()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Settings go here", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("tapped ok")
        }))
        
        present(alert, animated: true)
    }
    
    func initList() {
        let math = Quiz(title: "Math:\nTest your algebra!", imageName: "math.jpeg")
        quizList.append(math)
        
        let marvel = Quiz(title: "Marvel:\nSuper hero trivia!", imageName: "marvel.png")
        quizList.append(marvel)
        
        let science = Quiz(title: "Science:\nExperiment knowledge!", imageName: "science.jpeg")
        quizList.append(science)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
        
        let thisQuiz = quizList[indexPath.row]
        
        tableViewCell.quizName.text = thisQuiz.title
        tableViewCell.quizImage.image = UIImage(named: thisQuiz.imageName)
        
        return tableViewCell
    }


}

