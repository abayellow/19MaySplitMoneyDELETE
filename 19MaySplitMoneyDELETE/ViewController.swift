
import UIKit

class ViewController: UIViewController {
    
    let mainTitel = UILabel(text: "\"Split Bill\"", fontName: "Avenir Next Bold", size: 39, tamic: false, color: .systemGreen)
    let mainLogo = UIImageView(name: "rich")
    let infoLogo = UILabel(text: "Enter the invoice money and click \"calculate\".", fontName: "Avenir Next Bold", size: 13, tamic: false, color: .black)
    
    let totalBill = TotalBillView()
    let persons = PersonsView()
    let tips = TipsView()
    
    let calculateButton = UIButton(titel: "Calculate", titelColor: .white, cornerRadius: 8, backgroundColor: .systemGreen)
    
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor(named: "backgroundcolor")
        
        setupView()
        setupConstraints()
        someFunc()
    }

    func setupView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        view.addSubview(mainTitel)
        view.addSubview(mainLogo)
        view.addSubview(infoLogo)
        view.addSubview(totalBill)
        view.addSubview(persons)
        view.addSubview(tips)
        view.addSubview(calculateButton)

    }
    
    func someFunc() {
        calculateButton.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside) }
    
    func setupConstraints() {
     
        NSLayoutConstraint.activate([
        
            mainTitel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            mainLogo.topAnchor.constraint(equalTo: mainTitel.bottomAnchor, constant: 5),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.widthAnchor.constraint(equalToConstant: 200),
            mainLogo.heightAnchor.constraint(equalToConstant: 200),
   
            infoLogo.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 3),
            infoLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            totalBill.topAnchor.constraint(equalTo: infoLogo.bottomAnchor, constant: 3),
            totalBill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            totalBill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            totalBill.heightAnchor.constraint(equalToConstant: 100),
            
            persons.topAnchor.constraint(equalTo: totalBill.bottomAnchor, constant: 35),
            persons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            persons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            persons.heightAnchor.constraint(equalToConstant: 100),
            
            tips.topAnchor.constraint(equalTo: persons.bottomAnchor, constant: 35),
            tips.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tips.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tips.heightAnchor.constraint(equalToConstant: 100),
            
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.widthAnchor.constraint(equalToConstant: 300),
        
        ])
        
    }
    
    @objc func buttonTarget() {
        
        if totalBill.totalBillImputValue.isEmpty || persons.value == 0 || tips.tipsValue == 0 {
           
            
            let allert = UIAlertController(title: "Atention", message: "Enter all values befor calculate! ", preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style: .cancel)
            allert.addAction(action)
            
            
            
            present(allert, animated: true)
        } else {
            
            let tipAmount = (Int(totalBill.totalBillImputValue)! * tips.tipsValue) / 100 * persons.value
            
            let allert = UIAlertController(title: nil, message: "Toal tips amount: \(tipAmount)Rub.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style: .cancel)
            allert.addAction(action)
            
            
            
            present(allert, animated: true) }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

