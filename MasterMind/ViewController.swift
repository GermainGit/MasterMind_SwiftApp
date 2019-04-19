//
//  ViewController.swift
//  MasterMind
//
//  Created by Germain PREVOT on 03/04/2019.
//  Copyright © 2019 Germain PREVOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var val1: UITextField!
    @IBOutlet weak var val2: UITextField!
    @IBOutlet weak var val3: UITextField!
    @IBOutlet weak var val4: UITextField!
    var soluce: [String] = [String]()
    @IBOutlet weak var winLan: UILabel!
    @IBOutlet weak var stockLb1: UILabel!
    @IBOutlet weak var stockLb2: UILabel!
    @IBOutlet weak var stockLb3: UILabel!
    @IBOutlet weak var stockLb4: UILabel!
    @IBOutlet weak var stockLb5: UILabel!
    @IBOutlet weak var stockLb6: UILabel!
    @IBOutlet weak var stockLb7: UILabel!
    @IBOutlet weak var stockLb8: UILabel!
    @IBOutlet weak var stockLb9: UILabel!
    @IBOutlet weak var stockLb10: UILabel!
    @IBOutlet weak var mpLb1: UILabel!
    @IBOutlet weak var mpLb2: UILabel!
    @IBOutlet weak var mpLb3: UILabel!
    @IBOutlet weak var mpLb4: UILabel!
    @IBOutlet weak var mpLb5: UILabel!
    @IBOutlet weak var mpLb6: UILabel!
    @IBOutlet weak var mpLb7: UILabel!
    @IBOutlet weak var mpLb8: UILabel!
    @IBOutlet weak var mpLb9: UILabel!
    @IBOutlet weak var mpLb10: UILabel!
    @IBOutlet weak var nbTenta: UILabel!
    @IBOutlet weak var testBtn: UIButton!
    
    
    
    var nbEssai = 0
    let nbEssaiMax = 10
    var repereArray = 0
    var test: Array<String?> = Array(repeating: nil, count: 4)
    var perdu = Bool()
    var gagner = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.soluce = defineSoluce()
        print(soluce)
    }
    
    
    
    func defineSoluce() -> Array<String>{
        var initiation = ["B","R","Y","G"]
        
        var soluce: Array<String?> = Array(repeating: nil, count: 4)
        for x in 0..<4{
            soluce[x] = initiation[Int(arc4random_uniform(UInt32(initiation.count)))]
        }
        return soluce as! Array<String>
    }
    
    
    
    func TestIt(test: Array<String>){
        testBtn.setTitle("TEST",for: .normal)
        gagner = false
        perdu = false
        if nbEssai < 10{
        var testEditable = test
        var soluceEditable = soluce
        var BP = 0
        var MP = 0
        nbTenta.text = "Il vous reste " + String(nbEssaiMax - nbEssai - 1) + " tentatives"
        
        
        // BP
        
        for i in 0..<soluce.count{
            if testEditable[i] == soluceEditable[i]{
                BP += 1;
                soluceEditable[i] = "VALIDE";
                testEditable[i] = "";
            }
        }
        // MP
        for y in 0..<test.count{
            for i in 0..<soluce.count{
                if testEditable[y] == soluceEditable[i]{
                    MP += 1;
                    soluceEditable[i]="zero";
                    break;
                }
            }
        }
        
        //Resultat
        if BP == 4{
            gagner = true
            winLan.text = "BRAVO"
            testBtn.setTitle("AGAIN ?",for: .normal)
            nbEssai = 9
            
        }
            print(MP + BP)
        if MP > 0{
            switch nbEssai{
                case 0: mpLb1.text! += "MP : " + String(MP) + " "
                case 1: mpLb2.text! += "MP : " + String(MP) + " "
                case 2: mpLb3.text! += "MP : " + String(MP) + " "
                case 3: mpLb4.text! += "MP : " + String(MP) + " "
                case 4: mpLb5.text! += "MP : " + String(MP) + " "
                case 5: mpLb6.text! += "MP : " + String(MP) + " "
                case 6: mpLb7.text! += "MP : " + String(MP) + " "
                case 7: mpLb8.text! += "MP : " + String(MP) + " "
                case 8: mpLb9.text! += "MP : " + String(MP) + " "
                case 9: mpLb10.text! += "MP : " + String(MP) + " "
            default:
                mpLb1.text = ""
            }
        }
        if BP > 0{
            switch nbEssai{
                case 0: mpLb1.text! += "BP : " + String(BP)
                case 1: mpLb2.text! += "BP : " + String(BP)
                case 2: mpLb3.text! += "BP : " + String(BP)
                case 3: mpLb4.text! += "BP : " + String(BP)
                case 4: mpLb5.text! += "BP : " + String(BP)
                case 5: mpLb6.text! += "BP : " + String(BP)
                case 6: mpLb7.text! += "BP : " + String(BP)
                case 7: mpLb8.text! += "BP : " + String(BP)
                case 8: mpLb9.text! += "BP : " + String(BP)
                case 9: mpLb10.text! += "BP : " + String(BP)
            default:
                mpLb1.text = ""
            }
        }
        let myTest = test.joined(separator:" - ")
        
        switch nbEssai{
            case 0: stockLb1.text = myTest
            case 1: stockLb2.text = myTest
            case 2: stockLb3.text = myTest
            case 3: stockLb4.text = myTest
            case 4: stockLb5.text = myTest
            case 5: stockLb6.text = myTest
            case 6: stockLb7.text = myTest
            case 7: stockLb8.text = myTest
            case 8: stockLb9.text = myTest
            case 9: stockLb10.text = myTest
        default:
            stockLb1.text = ""
            }
            if nbEssai == 9 && gagner == false{
                perdu = true
                winLan.text = "PERDU ! C'était : " + soluce.joined(separator:" - ")
                testBtn.setTitle("RETRY ?",for: .normal)
            }
        }else{
            winLan.text = ""
            nbTenta.text = "Il vous reste 10 tentatives"
            soluce = defineSoluce()
            print(soluce)
            nbEssai = 0
            stockLb1.text = "";stockLb2.text = "";stockLb3.text = "";stockLb4.text = "";stockLb5.text = "";stockLb6.text = "";stockLb7.text = "";stockLb8.text = "";stockLb9.text = "";stockLb10.text = ""
            mpLb1.text = "";mpLb2.text = "";mpLb3.text = "";mpLb4.text = "";mpLb5.text = "";mpLb6.text = "";mpLb7.text = "";mpLb8.text = "";mpLb9.text = "";mpLb10.text = "";
            nbEssai -= 1
        }
        
        
        
    }
    
    @IBAction func ActTupBlue(_ sender: Any) {
        if repereArray <= 3 && perdu == false && gagner == false{
            print(repereArray)
            test[repereArray] = "B"
            switch repereArray{
            case 0: val1.backgroundColor = UIColor.blue
            case 1: val2.backgroundColor = UIColor.blue
            case 2: val3.backgroundColor = UIColor.blue
            case 3: val4.backgroundColor = UIColor.blue
            default:
                val1.backgroundColor = UIColor.white
            }
            repereArray += 1
        }
    }
    
    @IBAction func btnGreen(_ sender: Any) {
        if repereArray <= 3 && perdu == false && gagner == false{
            print(repereArray)
            test[repereArray] = "G"
            switch repereArray{
            case 0: val1.backgroundColor = UIColor.green
            case 1: val2.backgroundColor = UIColor.green
            case 2: val3.backgroundColor = UIColor.green
            case 3: val4.backgroundColor = UIColor.green
            default:
                val1.backgroundColor = UIColor.white
            }
            repereArray += 1
        }
    }
    
    @IBAction func btnYellow(_ sender: Any) {
        if repereArray <= 3 && perdu == false && gagner == false{
            print(repereArray)
            test[repereArray] = "Y"
            switch repereArray{
            case 0: val1.backgroundColor = UIColor.yellow
            case 1: val2.backgroundColor = UIColor.yellow
            case 2: val3.backgroundColor = UIColor.yellow
            case 3: val4.backgroundColor = UIColor.yellow
            default:
                val1.backgroundColor = UIColor.white
            }
            repereArray += 1
        }
    }
    
    @IBAction func btnRed(_ sender: Any) {
        if repereArray <= 3 && perdu == false && gagner == false{
            print(repereArray)
            test[repereArray] = "R"
            switch repereArray{
            case 0: val1.backgroundColor = UIColor.red
            case 1: val2.backgroundColor = UIColor.red
            case 2: val3.backgroundColor = UIColor.red
            case 3: val4.backgroundColor = UIColor.red
            default:
                val1.backgroundColor = UIColor.white
            }
            repereArray += 1
        }
    }
    
    @IBAction func testBtn(_ sender: Any) {
        if repereArray == 4 || gagner == true || perdu == true {
            TestIt(test: test as! Array<String>)
            nbEssai += 1
            repereArray = 0
            val1.backgroundColor = UIColor.white;val2.backgroundColor = UIColor.white;val3.backgroundColor = UIColor.white;val4.backgroundColor = UIColor.white
        }else{
            print("Remplis ton tableau")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
