import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    let menuIconArray = [#imageLiteral(resourceName: "box"), #imageLiteral(resourceName: "agenda"), #imageLiteral(resourceName: "notification-1"), #imageLiteral(resourceName: "help-button-speech-bubble-with-question-mark"), #imageLiteral(resourceName: "information"), #imageLiteral(resourceName: "policy (1)"), #imageLiteral(resourceName: "accept"), #imageLiteral(resourceName: "logout")]
    let menuTextArray = ["My Orders", "My Addresses", "My Notificatons", "FAQs", "Help Center", "Privacy Policy", "Terms and Conditions", "Logout"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return menuIconArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuShowData: menuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "menuTableView") as! menuTableViewCell
            menuShowData.menuIcon.image = menuIconArray[indexPath.row]
            menuShowData.menuLabel.text = menuTextArray[indexPath.row]
        return menuShowData
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
          print("Press My Orders")
          break
        case 1:
            print("Pressed My Addresses")
            break
        case 2:
            print("Pressed My Notifications")
            break
        case 3:
            print("Pressed My FAQs")
            break
        case 4:
            print("Pressed Help Center")
            break
        case 5:
            print("Pressed Privacy Policy")
            break
        case 6:
            print("Pressed Terms and Conditions")
            break
        case 7:
            print("Pressed Logout")
            break
        default:
           break
        }
    }
    
}
