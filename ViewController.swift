//
//  ViewController.swift
//  DovizPiyasasi
//
//  Created by ozan aydogdu on 15.04.2021.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var CHfLabel: UILabel!
    @IBOutlet weak var GBPLabel: UILabel!
    @IBOutlet weak var JPYLabel: UILabel!
    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var TRYLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    @IBAction func oranlarıGetirClicked(_ sender: Any) {
        
        let url = URL(string:"http://data.fixer.io/api/latest?access_key=19d1347778db69c1d8cde76cefefe7e6")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil {
                    
                    do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                    
                    
                        DispatchQueue.main.sync {
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                               
                                
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.CHfLabel.text = "CHF: \(chf)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.GBPLabel.text = "GBP: \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.JPYLabel.text = "JPY: \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.USDLabel.text = "USD: \(usd)"
                                }
                                
                                
                                if let tr = rates["TRY"] as? Double {
                                    self.TRYLabel.text = "TRY: \(tr)"
                                }
                                
                                
                                
                                
                            }
                    
                    }
        
            
            
                    
                    }catch{
                        print("error")
                    }
                    
                    }
                }
            
        }
            
        
            
        
        task.resume()
           
           
        }
    
        
        
        
        
    }
    
    
    


