import UIKit
import Foundation

class PersonsView: UIView {
    
    let grayBackround = UIView(color: UIColor(named: "OtherColor")!, radius: 8)
    let personsLogo = UILabel(text: "Persons", fontName: "Avenir Next Bold", size: 12, tamic: false, color: .black)
    let quantityPersonsLogo = UITextField(text: "0", fontName: "Avenir Next Bold", size: 40, color: .black)
    
    let minus = UIButton(titel: "–", titelColor: .systemGray, cornerRadius: .zero, backgroundColor: UIColor(named: "OtherColor")!)
    let plus = UIButton(titel: "+", titelColor: .black, cornerRadius: .zero, backgroundColor: UIColor(named: "OtherColor")!)
    
    var value = 0
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupView()
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
      
        addSubview(grayBackround)
        addSubview(personsLogo)
        addSubview(quantityPersonsLogo)
        addSubview(minus)
        addSubview(plus)
        
        setupButtons()
        
    }
    
    func setupButtons() {
        minus.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 40)
        plus.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 40)
        
        minus.addTarget(self, action: #selector(buttonsTarget), for: .touchUpInside)
        plus.addTarget(self, action: #selector(buttonsTarget), for: .touchUpInside)
        
        
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            grayBackround.leadingAnchor.constraint(equalTo: leadingAnchor),
            grayBackround.trailingAnchor.constraint(equalTo: trailingAnchor),
            grayBackround.bottomAnchor.constraint(equalTo: bottomAnchor),
            grayBackround.heightAnchor.constraint(equalToConstant: 80),
            
            personsLogo.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            personsLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            quantityPersonsLogo.centerXAnchor.constraint(equalTo: grayBackround.centerXAnchor),
            quantityPersonsLogo.centerYAnchor.constraint(equalTo: grayBackround.centerYAnchor),
            
            minus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            minus.centerYAnchor.constraint(equalTo: grayBackround.centerYAnchor),
            
            plus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            plus.centerYAnchor.constraint(equalTo: grayBackround.centerYAnchor),
        ])
        
        
    }
    
    
    
    @objc func buttonsTarget() {
   
        if plus.isTouchInside {
            value += 1
            quantityPersonsLogo.text = "\(value)"
            print(value)
        }
        
        if minus.isTouchInside && quantityPersonsLogo.text != "0"{
            value -= 1
            quantityPersonsLogo.text = "\(value)"
            print(value)
        }
    }
    

    
}



