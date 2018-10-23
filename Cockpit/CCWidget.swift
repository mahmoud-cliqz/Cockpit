//
//  CCWidget.swift
//  Cockpit
//
//  Created by Tim Palade on 10/23/18.
//  Copyright © 2018 Tim Palade. All rights reserved.
//

import UIKit
import SnapKit

class CCWidget: UIView {
    var imageView: UIImageView? = nil
    var mainLabel: UILabel? = nil
    var auxLabel: UILabel? = nil
}

class CCTimeSavedWidget: CCWidget {
    
    init(quanitity: Int, scale: String) {
        super.init(frame: CGRect.zero)
        
        imageView = UIImageView()
        let labelContainer = UIView()
        mainLabel = UILabel()
        auxLabel = UILabel()
        
        self.addSubview(imageView!)
        self.addSubview(labelContainer)
        labelContainer.addSubview(mainLabel!)
        labelContainer.addSubview(auxLabel!)
        
        imageView!.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
        })
        
        labelContainer.snp.makeConstraints { (make) in
            make.center.equalTo(imageView!.snp.center)
            make.size.equalTo(70)
        }
        
        mainLabel!.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        auxLabel!.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel!.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        imageView?.image = UIImage(named: "CCCircle")
        mainLabel?.text = String(quanitity)
        auxLabel?.text = scale
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CCAdsBlockedWidget: CCWidget {
    
    init(quanitity: Int) {
        super.init(frame: CGRect.zero)
        
        imageView = UIImageView()
        mainLabel = UILabel()
        
        self.addSubview(imageView!)
        self.addSubview(mainLabel!)
        
        imageView!.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
        })
        
        mainLabel!.snp.makeConstraints { (make) in
            make.center.equalTo(imageView!.snp.center)
        }
        
        imageView?.image = UIImage(named: "CCAdBlocking")
        mainLabel?.text = String(quanitity)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CCDataSavedWidget: CCWidget {
    static private let QuantityFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 50, weight: .ultraLight),
                                                 NSAttributedStringKey.foregroundColor: CCUX.CliqzBlueGlow]
    
    static private let ScaleFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 50, weight: .medium),
                                              NSAttributedStringKey.foregroundColor: CCUX.CliqzBlueGlow]
    
    
    init(quanitity: Int, scale: String) {
        super.init(frame: CGRect.zero)
        
        mainLabel = UILabel()
        mainLabel?.textAlignment = .center
        mainLabel?.sizeToFit()
        
        auxLabel = UILabel()
        auxLabel?.textAlignment = .center
        auxLabel?.sizeToFit()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = -40.0
        stackView.addArrangedSubview(mainLabel!)
        stackView.addArrangedSubview(auxLabel!)
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(1.2)
        }
        
        updateView(quanitity: quanitity, scale: scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(quanitity: Int, scale: String) {
        mainLabel?.attributedText = NSAttributedString(string: String(quanitity), attributes: CCDataSavedWidget.QuantityFontAttributes)
        auxLabel?.attributedText = NSAttributedString(string: scale, attributes: CCDataSavedWidget.ScaleFontAttributes)
    }
}

class CCBatterySavedWidget: CCWidget {
    static private let QuantityFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 36), NSAttributedStringKey.foregroundColor: CCUX.CliqzBlueGlow]
    static private let ScaleFontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: CCUX.CliqzBlueGlow]
    
    init(quanitity: Int, scale: String) {
        super.init(frame: CGRect.zero)
        
        imageView = UIImageView(image: UIImage.init(named: "CCBattery"))
        mainLabel = UILabel()
        mainLabel?.textAlignment = .center
        
        self.addSubview(imageView!)
        self.addSubview(mainLabel!)
        
        imageView!.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(1.5)
        })
        
        mainLabel!.snp.makeConstraints { (make) in
            make.centerX.equalTo(imageView!)
            make.top.equalTo(imageView!.snp.bottom)
        }
        updateView(quanitity: quanitity, scale: scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(quanitity: Int, scale: String) {
        let attributedText = NSMutableAttributedString(string: String(quanitity), attributes: CCBatterySavedWidget.QuantityFontAttributes)
        attributedText.append(NSAttributedString(string: scale, attributes: CCBatterySavedWidget.ScaleFontAttributes))
        mainLabel?.attributedText = attributedText
    }
}

class CCAntiPhishingWidget: CCWidget {
    
    init() {
        super.init(frame: CGRect.zero)
        
        imageView = UIImageView(image: UIImage.init(named: "CCHook"))
        self.addSubview(imageView!)
        
        imageView!.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

