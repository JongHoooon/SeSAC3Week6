//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit
import CoreLocation // 1. 위치 임포트
import MapKit
import SnapKit

final class LocationViewController: UIViewController {
    
    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당 (CLLocationManager)
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    let cafeButton = UIButton()
    let foodButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20.0)
        }
        view.backgroundColor = .systemBackground
        
        view.addSubview(cafeButton)
        cafeButton.backgroundColor = .red
        cafeButton.addTarget(
            self,
            action: #selector(cafeButtonClicked),
            for: .touchUpInside
        )
        
        cafeButton.snp.makeConstraints {
            $0.top.equalTo(view).offset(100.0)
            $0.size.equalTo(50.0)
            $0.leading.equalTo(view).offset(100.0)
        }
        
        view.addSubview(foodButton)
        foodButton.backgroundColor = .blue
        foodButton.addTarget(
            self,
            action: #selector(foodButtonClieckd),
            for: .touchUpInside
        )
        foodButton.snp.makeConstraints {
            $0.top.equalTo(view).offset(100.0)
            $0.size.equalTo(50.0)
            $0.trailing.equalTo(view).offset(-100.0)
        }
        
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        
//        locationManager.requestWhenInUseAuthorization()
        
        // 알아서 권한 바뀌는거 체크해줌
        // navigation, tab bar안에 들어있을때는 안됨
        // checkDeviceLocationAuthorization()
        
        let center = CLLocationCoordinate2D(
            latitude: 37.517857,
            longitude: 126.886714
        )
        setRegionAndAnnotation(center: center)
        
        setAnnotation(type: 0)
    }
    
    // 등록된거 제거하고 필요한거만 다시 세팅
    @objc
    func cafeButtonClicked() {
        
        setAnnotation(type: 1)  // 1
        
    }
    
    @objc
    func foodButtonClieckd() {
        
    }
    
    func setAnnotation(type: Int) {
        /*
        37.518968, 126.886298 지코바
        37.520218, 126.888603 bbq
         */

        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(
            latitude: 37.518968,
            longitude: 126.886298
        )
        
        mapView.removeAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(
            latitude: 37.520218,
            longitude: 126.888603
        )
        
        mapView.addAnnotations([annotation2])
        
        if type == 0 { // view did load
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {
            
            // mapView.removeAnnotation(annotation1) -> 삭제 되지 않음
            // 위에서 만든 annotation1과 다른 값을 가르키고있어서 삭제 안됨
            
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2])
        }
    }
    
    // Pin == Annotation
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        // 지도 중심 기반으로 보여질 범위 설정
//        let center = CLLocationCoordinate2D(
//            latitude: 37.517857,
//            longitude: 126.886714
//        )
        let region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 300,
            longitudinalMeters: 300
        )
        
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        
        let annotation = MKPointAnnotation()
//        annotation.title = "컴포스 커피"
        annotation.coordinate = center
        
        mapView.addAnnotation(annotation)

    }
    
    func showLocationSettingAlert() {
        
        let alert = UIAlertController(
            title: "위치 정보 이용",
            message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.",
            preferredStyle: .alert
        )
        let goSetting = UIAlertAction(
            title: "설정으로 이동",
            style: .default,
            handler: { _ in
                // 설정에서 직접적으로 앱 설정 화면에 들어간적이 없으면
                // 한번도 설정 앱에 들억지 않았거나, 막 다운받은 앱이라서
                // 설정 페이지로 넘어갈지, 설정 상세 페이지 결정 x
                if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSetting)
                }
            }
        )
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            // iOS 위치 서비스 활성화 체크
            if CLLocationManager.locationServicesEnabled() {
                
                // 현재 사용자의 위치 권한 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
            }
            
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {

        print("check \(status)")
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() // request alert, 업데이트 정확도 확인
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorization")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            // 위치 권한 종류가 더 생길 가능성 대비
            print("default")
            
            /*
             @frozen >>> 더이상 열거형에 절대 추가될 케이스가 없다고 확신힌다.
             컴파일 시점에 default에 대응을안해도 됨
             
             Optional에 붙어있음
             
            let value: Optional<Int> = 1
            switch value {
            case .none:
                break
            case let .some(value):
                break
            }
            */
        }
    }
}

// 4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    // 5. 사용자의 위치를 성공적으로 가지고 온 경우
    // 한번만 실행되지 않는다, iOS 위치 업데이트가 필요한 시점에 알아서 호출
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        print("===", locations)

        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
            // 해당 위치에서 날씨 API 호출
        }
        
        // 한번만 호출하게 업데이트 멈춰줌
        locationManager.stopUpdatingLocation()
    }
    
    // 6. 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print(error)
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // 거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    // iOS14 이상
    func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        print(#function)
        // 어떤 권한으로 변경됐는지는 알 수 없다
        
        checkDeviceLocationAuthorization()
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // iOS14 미만
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        
    }
}

extension LocationViewController: MKMapViewDelegate {
    
    func mapView(
        _ mapView: MKMapView,
        regionDidChangeAnimated animated: Bool
    ) {
        print(#function)
    }
    
    func mapView(
        _ mapView: MKMapView,
        didSelect annotation: MKAnnotation
    ) {
        print(#function)
    }
    
//    func mapView(
//        _ mapView: MKMapView,
//        viewFor annotation: MKAnnotation
//    ) -> MKAnnotationView? {
//        print(#function)
//
}


/*

위치서비스 사용 O: 권한 요청, 접근 가능 / 추후 거부 시 대응
 
위치서비스 사용 X: alert iOS 시스템 설정 유도 /
 
*/

/*
 
 위치 - 권한 필요
 
 지도 - 지도만 사용할 때는 권한 필요X
 
 */
