//
//  SecondVC.swift
//  SavingTheWorldFromLilithsEvilSpell2
//
//  Created by Cenker Soyak on 18.10.2023.
//

import UIKit
import GoogleMobileAds

class SecondVC: UIViewController, GADFullScreenContentDelegate {
    
    var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    func createUI() {
        view.backgroundColor = .systemRed
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: request) { ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.interstitial = ad
            self.interstitial?.fullScreenContentDelegate = self
            self.interstitial?.present(fromRootViewController: self)
        }
        let label = UILabel()
        label.text = "INTERSTITIAL AD SHOWN"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        let button = UIButton(type: .system)
        button.setTitle("GO TO THE REWARDED AD SCREEN", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
    }
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    // Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    // Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    @objc func buttonTapped(_ sender : UIButton) {
        let thirdVC = ThirdVC()
        thirdVC.modalPresentationStyle = .fullScreen
        present(thirdVC, animated: true)
    }
}
