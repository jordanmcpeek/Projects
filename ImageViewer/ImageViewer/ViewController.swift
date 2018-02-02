//
//  ViewController.swift
//  ImageViewer
//
//  Created by Rush on 2/1/18.
//  Copyright © 2018 Jordan McPeek. All rights reserved.
//

import UIKit

class ViewController: UITableViewController
{
    //create an array of strings to add the pictures to
    var pictures = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        
        //lets us work with the filesystem
        let fm = FileManager.default
        
        //creates path set to resource path of app's bundle
        //bundle is a directory (folder) that contains compiled program and all its assets
        let path = Bundle.main.resourcePath!
        
        
        //items that are located at path defined earlier
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items
        {
            if item.hasPrefix("nssl")
            {
                //if the correct prefix is found then add the string to the array
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
