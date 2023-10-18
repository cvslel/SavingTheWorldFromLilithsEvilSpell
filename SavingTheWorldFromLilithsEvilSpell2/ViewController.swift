import GoogleMobileAds
import UIKit
import SnapKit

class ViewController: UIViewController {

    var bannerView : GADBannerView?

  override func viewDidLoad() {
    super.viewDidLoad()
      createUI()
  }
    func createUI() {
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Banner Ad Screen"
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
        button.setTitle("GO TO THE INTERSTITIAL AD SCREEN", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
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
        bannerView = GADBannerView()
        bannerView?.rootViewController = self
        bannerView?.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView?.load(GADRequest())
        view.addSubview(bannerView!)
        bannerView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(200)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(60)
        })
    }
    @objc func buttonTapped(_ sender : UIButton) {
        let secondVC = SecondVC()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
    }
}
