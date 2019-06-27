//
//  ViewController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 6/23/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//


import UIKit

class OptionsViewController : GameSessionTrackingViewController, UITableViewDataSource, UITextViewDelegate{
    
    @IBOutlet var collectionOptionTable: UITableView!
    
    var manifestIndexes = Set<Int>()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Shared.CollectionManifest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionOptionTableCell", for: indexPath) as! CollectionOptionTableCell
        cell.viewController = self
        cell.label.text = Shared.CollectionManifest[indexPath.row].name
        cell.manifestIndex = indexPath.row

        // switch defaults to on, so add the index
        manifestIndexes.insert(cell.manifestIndex)

        return cell
    }
    
    func collectionOptionSwitchChanged(manifestIndex: Int, state: Bool){
        if state{
            manifestIndexes.insert(manifestIndex)
        }else{
            manifestIndexes.remove(manifestIndex)
        }
    }
    
    @IBAction func okayButtonPressed(){
        // now set up a new GameSession
        gameSession = GameSession()
        
        for i in manifestIndexes{
            gameSession!.triviaCollections.append( Shared.CollectionManifest[i].factory() )
        }
        
        let newController = self.storyboard?.instantiateViewController(withIdentifier: "InterludeViewController")
        (newController as! InterludeViewController).gameSession = gameSession
        self.present(newController!, animated: true, completion: nil)
    }
}

class CollectionOptionTableCell : UITableViewCell{
    
    @IBOutlet var label: UILabel!
    @IBOutlet var onOffSwitch: UISwitch!
    
    var viewController: OptionsViewController!
    var manifestIndex: Int!
    
    @IBAction func collectionOptionSwitchChanged(){
        viewController.collectionOptionSwitchChanged(manifestIndex: manifestIndex, state: onOffSwitch.isOn)
    }
}
