//
//  ViewController.swift
//  LemonadeStandSimulator
//
//  Created by Samuel Bétrisey on 15.09.14.
//  Copyright (c) 2014 Samuel Bétrisey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var argent = 10
    var citron = 1
    var glacon = 1
    var citronPanier = 0
    var glaconPanier = 0
    var melangeCitron = 0
    var melangeGlacon = 0

    @IBOutlet weak var lblArgent: UILabel!
    @IBOutlet weak var lblCitron: UILabel!
    @IBOutlet weak var lblGlacon: UILabel!
    @IBOutlet weak var lblAchatCitron: UILabel!
    @IBOutlet weak var lblAchatGlacon: UILabel!
    @IBOutlet weak var lblMelangeCitron: UILabel!
    @IBOutlet weak var lblMelangeGlacon: UILabel!
    @IBOutlet weak var imgMeteo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mettreAJourLabels() {
        lblArgent.text = "\(argent)CHF"
        lblCitron.text = "\(citron) citrons"
        lblGlacon.text = "\(glacon) glaçons"
        lblAchatCitron.text = "\(citronPanier)"
        lblAchatGlacon.text = "\(glaconPanier)"
        lblMelangeCitron.text = "\(melangeCitron)"
        lblMelangeGlacon.text = "\(melangeGlacon)"
    }

    @IBAction func btnSimulatorPressed(sender: UIButton) {
        let ratio:Float = Float(melangeCitron)/Float(melangeGlacon)
        
        citronPanier = 0
        glaconPanier = 0
        melangeCitron = 0
        melangeGlacon = 0
        
        
        var nbrClients = Int(arc4random_uniform(UInt32(100))) + 1
        
        imgMeteo.hidden = false
        let meteo = Int(arc4random_uniform(UInt32(3)))
        switch meteo {
        case 0:
            nbrClients -= 3
            imgMeteo.image = UIImage(named: "cold.png")
        case 2:
            nbrClients += 4
            imgMeteo.image = UIImage(named: "warm")
        default:
            nbrClients += 0
            imgMeteo.image = UIImage(named: "mild.png")
        }
        
        var clients:[Client] = []
        for var i = 0; i < nbrClients; i++ {
            clients.append(Client())
            
            
            if clients[i].gout == ratio {
                argent++
                println("payé")
            }
            else {
                println("pas payé")
            }
        }
        
        mettreAJourLabels()
    }
    @IBAction func btnAchatCitronPlusPressed(sender: UIButton) {
        if argent >= 2 {
            argent -= 2
            citronPanier++
            citron++
        }
        mettreAJourLabels()
    }
    @IBAction func btnAchatCitronMoinsPressed(sender: UIButton) {
        if citronPanier >= 1 {
            argent += 2
            citronPanier--
            citron--
        }
        mettreAJourLabels()
    }
    @IBAction func btnAchatGlaconPlusPressed(sender: UIButton) {
        if argent >= 1 {
            argent -= 1
            glaconPanier++
            glacon++
        }
        mettreAJourLabels()
    }
    @IBAction func btnAchatGlaconMoinsPressed(sender: UIButton) {
        if glaconPanier >= 1 {
            argent += 1
            glaconPanier--
            glacon--
        }
        mettreAJourLabels()
    }
    @IBAction func btnMelangeCitronPlusPressed(sender: UIButton) {
        if citron > 0 {
            citron--
            melangeCitron++
        }
        mettreAJourLabels()
    }
    @IBAction func btnMelangeCitronMoinsPressed(sender: UIButton) {
        if melangeCitron > 0 {
            citron++
            melangeCitron--
        }
        mettreAJourLabels()
    }
    @IBAction func btnMelangeGlaconPlusPressed(sender: UIButton) {
        if glacon > 0 {
            glacon--
            melangeGlacon++
        }
        mettreAJourLabels()
    }
    @IBAction func btnMelangeGlaconMoinsPressed(sender: UIButton) {
        if melangeGlacon > 0 {
            glacon++
            melangeGlacon--
        }
        mettreAJourLabels()
    }
    
}

