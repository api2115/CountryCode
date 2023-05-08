import UIKit

class TableViewController: UITableViewController {

    var dataClosure: ((String) -> Void)?
    var jsonData: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Make a network request to fetch JSON data from a URL
        guard let url = URL(string: "https://gist.githubusercontent.com/DmytroLisitsyn/1c31186e5b66f1d6c52da6b5c70b12ad/raw/2bc71083a77106afec2ec37cf49d05ee54be1a22/country_dial_info.json") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let jsonData = data else {
                return
            }

            do {
                // Parse the JSON data into an array of dictionaries
                if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
                    self.jsonData = jsonArray

                    // Reload table view data on the main thread
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Error parsing JSON data: \(error)")
            }
        }

        task.resume()

        // Register table view cell class
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Set table view delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.backgroundColor = .white
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = jsonData[indexPath.row]
        cell.textLabel?.text = "\(item["flag"]!) \(item["name"]!) \(item["dial_code"]!)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = jsonData[indexPath.row]
        let dialCode = item["dial_code"] as? String ?? ""
        
        dataClosure?(dialCode)
        self.dismiss(animated: true, completion: nil)
        
    }

}
