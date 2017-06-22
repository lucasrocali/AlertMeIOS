//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class AlertListViewController: UITableViewController, AlertListViewProtocol {

    var presenter: AlertListPresenterProtocol?

    var events : [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter?.getInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavInfo(title: String?, leftBtnText: String?, rightBtnText: String?) {
        self.title = title

        let leftButton =  UIBarButtonItem(title: leftBtnText, style: .plain, target: self, action: #selector(self.leftBtnClicked(_:)))
        self.navigationItem.leftBarButtonItem = leftButton

        let rightButton =  UIBarButtonItem(title: rightBtnText, style: .plain, target: self, action: #selector(self.rightBtnClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func updateEvents(events:[Event]) {
        self.events = events
        self.tableView.reloadData()
    }

    func leftBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.leftBtnClicked()

    }
    func rightBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.rightBtnClicked()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.events.count
    }


     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : AlertTableViewCell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as! AlertTableViewCell


        cell.setupCell(event: events[indexPath.row])

        return cell
     }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row <= events.count {
            let event = events[indexPath.row]
            presenter?.selectedEvent(event: event)
        }
    }


    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
