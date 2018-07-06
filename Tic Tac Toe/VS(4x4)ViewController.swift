//
//  VS(4x4)ViewController.swift
//  Tic Tac Toe
//
//  Created by Omar on 21/10/1439 AH.
//  Copyright © 1439 Omar. All rights reserved.
//

import UIKit

class VS_4x4_ViewController: UIViewController {
    
    //--------Outlets--------
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    @IBOutlet weak var gridLabel9: GridLabel!
    @IBOutlet weak var gridLabel10: GridLabel!
    @IBOutlet weak var gridLabel11: GridLabel!
    @IBOutlet weak var gridLabel12: GridLabel!
    @IBOutlet weak var gridLabel13: GridLabel!
    @IBOutlet weak var gridLabel14: GridLabel!
    @IBOutlet weak var gridLabel15: GridLabel!
    
    
    //-----------Variables------------
    var gridArray = [GridLabel]()
    var tapArray = [GridLabel]()
    var grid = [[GridLabel]()]
    var scoreX = 0
    var scoreO = 0
    var turnCount = 0
    
    //-----------Funcs----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        gridArray.append(gridLabel0)
        gridArray.append(gridLabel1)
        gridArray.append(gridLabel2)
        gridArray.append(gridLabel3)
        gridArray.append(gridLabel4)
        gridArray.append(gridLabel5)
        gridArray.append(gridLabel6)
        gridArray.append(gridLabel7)
        gridArray.append(gridLabel8)
        gridArray.append(gridLabel9)
        gridArray.append(gridLabel10)
        gridArray.append(gridLabel11)
        gridArray.append(gridLabel12)
        gridArray.append(gridLabel13)
        gridArray.append(gridLabel14)
        gridArray.append(gridLabel15)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        grid = [ [gridLabel0 , gridLabel4 , gridLabel8 , gridLabel12], [gridLabel1 , gridLabel5 , gridLabel9 , gridLabel13], [gridLabel2 , gridLabel6 , gridLabel10 , gridLabel14], [gridLabel3 , gridLabel7 , gridLabel11 , gridLabel15]]
        tapArray = gridArray
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        
        
        for label in tapArray
        {
            if label.frame.contains(sender.location(in: backgroundView))
            {
                
                if turnCount % 2 == 0
                {
                    label.text = "X"
                }
                else
                {
                    label.text = "O"
                }
                tapArray.remove(at: tapArray.index(of: label)!)
                checkForWinner()
                turnCount += 1
                
            }
        }
    }
    
    func checkForWinner()
    {
        for i in 0..<grid.count
        {
            if  grid[i][0].text! == grid[i][1].text! && grid[i][0].text! == grid[i][2].text! && grid[i][0].text! == grid[i][3].text! && grid[i][0].text! != "" //Checks each columns for a winner
            {
                
                winner(winningChar: grid[i][0].text!)
            }
        }
        
        for x in 0..<grid[0].count
        {
            if  grid[0][x].text! == grid[1][x].text! && grid[0][x].text! == grid[2][x].text! && grid[0][x].text! == grid[3][x].text! && grid[0][x].text! != "" //Checks each row for a winner
            {
                winner(winningChar: grid[0][x].text!)
            }
        }
        
        //check for diagonals
        if grid[0][0].text! == grid[1][1].text! && grid[0][0].text! == grid[2][2].text! && grid[0][0].text! == grid[3][3].text! && grid[0][0].text! != ""
        {
            winner(winningChar: grid[0][0].text!)
        }
        
        if grid[0][3].text! == grid[1][2].text! && grid[0][3].text! == grid[2][1].text! && grid[0][3].text! == grid[3][0].text! && grid[0][3].text! != ""
        {
            winner(winningChar: grid[0][3].text!)
        }
        if tapArray.isEmpty {
            draw()
        }
        
        
    }
    
    func winner(winningChar: String){
        print(winningChar)
        tapArray.removeAll()
        let winAlert = UIAlertController(title: "\(winningChar) won!", message: nil, preferredStyle: .alert)
        let winAlertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.restartGame()
        }
        winAlert.addAction(winAlertAction)
        present(winAlert, animated: true, completion: nil)
        
        if winningChar == "X"
        {
            scoreX += 1
        }
        else
        {
            scoreO += 1
        }
        
        scoreLabel.text = "\(scoreX) : \(scoreO)"
    }
    
    func draw()
    {
        tapArray.removeAll()
        let drawAlert = UIAlertController(title: "Draw!", message: nil, preferredStyle: .alert)
        let drawAlertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.restartGame()
        }
        drawAlert.addAction(drawAlertAction)
        present(drawAlert, animated: true, completion: nil)
    }
    
    func restartGame()
    {
        gridLabel0.text = ""
        gridLabel1.text = ""
        gridLabel2.text = ""
        gridLabel3.text = ""
        gridLabel4.text = ""
        gridLabel5.text = ""
        gridLabel6.text = ""
        gridLabel7.text = ""
        gridLabel8.text = ""
        gridLabel9.text = ""
        gridLabel10.text = ""
        gridLabel11.text = ""
        gridLabel12.text = ""
        gridLabel13.text = ""
        gridLabel14.text = ""
        gridLabel15.text = ""
        tapArray = gridArray
        
    }
    @IBAction func resetButtonTapped(_ sender: Any) {
        restartGame()
        scoreX = 0
        scoreO = 0
        scoreLabel.text = "\(scoreX) : \(scoreO)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
