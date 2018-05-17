
import UIKit

class SecondViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    

    
 
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var selector1: UIPickerView!
    

  
    @IBOutlet weak var from: UILabel!
    
    @IBOutlet weak var valueBox: UITextField!
    
    //the type of conversion the user selected
    var convType = String()
 
    //3d array of each units for each kind of conversion
    var arr = [[["Kilometer","Meter","Centimeter","Millimeter","Mile","Nautical Mile","Foot","Inch","Yard"],["Kilometer","Meter","Centimeter","Millimeter","Mile","Nautical Mile","Foot","Inch","Yard"]],[["Pounds","Kg"],["Pounds","Kg"]],[["Millisecond","Second","Minute","Hour","Week","Day","Month","Year"],["Millisecond","Second","Minute","Hour","Week","Day","Month","Year"]],]
    
    
    //2d array which stores convertion from Length(Meters),Mass(Kg), Time(seconds) to different measurements
    var mHash = [["Kilometer": 0.001,"Centimeter": 100.0,"Millimeter": 1000.0,"Mile": 0.00062,"Nautical Mile":0.00054 ,"Foot": 3.28083,"Inch":39.37006 ,"Yard": 1.09361],["Pounds": 2.20462],["Millisecond": 1000.0,"Minute": 0.0166667,"Hour": 0.00027,"Day": 0.0000115741,"Week": 0.00000165344,"Month":(1/2592000.0),"Year":0.0000000316887]]

    //Dict that maps buttons to a certain number
    let stringIntMapping = ["Length": 0,"Mass": 1,"Time": 2]
    
    
    
    
    //from label
    var uipic1:String = ""
    
    //to label
    var uipic2:String = ""
    
    
    
    public func getHashVal() -> Double
    {
        let va1 = mHash[stringIntMapping[String(convType)]!][uipic1]
        let va2 = mHash[stringIntMapping[String(convType)]!][uipic2]
        
        //From and To labels are of same type
        if(uipic1 == uipic2)
        {
            return 1.0
        }
        
        else
        if(va1 != nil && va2 != nil)
        {
            
            
            var valueTemp:Double  = 1/(mHash[stringIntMapping[String(convType)]!][uipic1]!)
            
            valueTemp *= mHash[stringIntMapping[String(convType)]!][uipic2]!
            
            return valueTemp
            
        }
        
        else
        {
            
        
            if (va1 == nil)
            {
                return mHash[stringIntMapping[String(convType)]!][uipic2]!
            }
            else
            {
                return (1/(mHash[stringIntMapping[String(convType)]!][uipic1]!))
            }
        
        }
        
        
    }

    
    
    
    @IBAction func Compute(_ sender: Any) {
        
        guard var tem:Double = Double(valueBox.text!)else {
            Result.text = "No Value Entered or Illigal value"
            return
        }
        
        tem = tem * getHashVal()
        
        Result.text = "\(tem) \(uipic2)"
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        
      
        
        selector1.dataSource = self
        selector1.delegate = self
        
        uipic1 = String(arr[stringIntMapping[String(convType)]!][0][0])
        uipic2 = String(arr[stringIntMapping[String(convType)]!][1][0])
        
        from.text="From ---> To"
        
    }
   
  
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return arr[stringIntMapping[String(convType)]!][0].count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if(component==0)
        {
            uipic1 = arr[stringIntMapping[String(convType)]!][component][row]
            
        }
        else
        {
            uipic2 = arr[stringIntMapping[String(convType)]!][component][row]
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString?
    {
        
        let attributedString = NSAttributedString(string: arr[stringIntMapping[String(convType)]!][component][row], attributes: [NSForegroundColorAttributeName : UIColor.red])
        
        //let titleData = value[row]
        return attributedString
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
