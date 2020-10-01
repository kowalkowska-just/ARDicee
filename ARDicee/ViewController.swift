//
//  ViewController.swift
//  ARDicee
//
//  Created by Justyna Kowalkowska on 27/09/2020.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //Create a new scene
        
        let diceScene = SCNScene(named: "art.scnassets/diceCollada copy.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        
        diceNode.position = SCNVector3(x: 0.0, y: 0.0, z: -0.1)
        
        sceneView.scene.rootNode.addChildNode(diceNode)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        //Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Pause the view's session
        sceneView.session.pause()
    }
}
