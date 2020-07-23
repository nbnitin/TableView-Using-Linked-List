//
//  ViewController.swift
//  App Using Linked List
//
//  Created by Nitin on 10/01/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tbl: UITableView!
    var list : LinkedList!
    var nextPost : Node?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        list = LinkedList()
        getPosts()
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return list.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.list?.searchByPosition(position: indexPath.row)?.data.title
        cell.detailTextLabel?.text = self.list?.searchByPosition(position: indexPath.row)?.data.body
        return cell
    }
    
    
    func getPosts(){
        ApiHandler.shared.sendGetRequest(url: "https://jsonplaceholder.typicode.com/posts", completionHandler: {response,error in
            if ( error != nil ) {
                return
            }
            do {
                for items in (response as? [[String:AnyObject]])! {
                    let data = try JSONSerialization.data(withJSONObject: items, options: [])
                    let model = try JSONDecoder().decode(Posts.self, from: data)
                    self.list.append(value: model)
                }
                self.nextPost = self.list?.head
                self.tbl.reloadData()
                
            }
           
            catch {
                
            }
        })
    }
    
}

