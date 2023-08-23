//
//  TheaterViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/23.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

final class TheaterViewController: UIViewController {
    
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    private let theaterList = TheaterList()
    
    // MARK: - UI
    
    private let mapView = MKMapView()

    private let filterBarButton = UIBarButtonItem(
        title: "Filter",
        style: .plain,
        target: nil,
        action: nil
    )
    
    private let locationBarButton = UIBarButtonItem(
        image: UIImage(systemName: "scope"),
        style: .plain,
        target: nil,
        action: nil
    )
    
    private let dismissBarButton = UIBarButtonItem(
        image: Example2Images.xmark,
        style: .plain,
        target: nil,
        action: nil
    )
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureNavigationBar()
        configureLayout()
        configureLocationManager()
        addActions()
        
        checkDeviceLocationAuthoriazation()
        
        filterTheaterAnnotation(type: .allCase)
    }
}

// MARK: - Location
extension TheaterViewController: CLLocationManagerDelegate {
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        print("✨========================================✨")
        print(locations)
        print("===========================================")
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setMapRegion(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("🚨========================================🚨")
        print(error)
        print("===========================================")
    }
    
    func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        checkDeviceLocationAuthoriazation()
    }
}

private extension TheaterViewController {
    
    func configureLocationManager() {
        locationManager.delegate = self
    }
    
    func checkDeviceLocationAuthoriazation() {
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            if CLLocationManager.locationServicesEnabled() {
                
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
                print("위치 서비스가 꺼져 있어서 위치 권한요청을 못합니다.")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        
        print("check \(status)")
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            setMapRegion()
            showRequestLocationServiceAlert()
        case .authorizedAlways:
            print("authorization")
        case .authorizedWhenInUse:
            print("authorizationInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        }
    }
    
    func showRequestLocationServiceAlert() {
        let requestLocationServiceAlert = UIAlertController(
            title: "위치정보 이용",
            message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.",
            preferredStyle: .alert
        )
        let goSetting = UIAlertAction(
            title: "설정으로 이동",
            style: .destructive
        ) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(
            title: "취소",
            style: .default
        )
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)
        
        present(requestLocationServiceAlert, animated: true, completion: nil)
    }
}

// MARK: - Map
private extension TheaterViewController {
    
    /// 매개변수 기본값 위치: 청년취업사관학교 영등포 캠퍼스
    func setMapRegion(
        latitude: CLLocationDistance = 37.51779,
        longitude: CLLocationDistance = 126.88630
    ) {
        let center = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        let region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 150.0,
            longitudinalMeters: 150.0
        )
        mapView.setRegion(region, animated: true)
    }
    
    func filterTheaterAnnotation(type: TheaterType) {
        mapView.removeAnnotations(mapView.annotations)
        
        let newAnnotations = theaterList.theaterAnnotations(type: type)
            .map {
                let annotation = MKPointAnnotation()
                annotation.title = $0.location
                annotation.coordinate = CLLocationCoordinate2D(
                    latitude: $0.latitude,
                    longitude: $0.longitude
                )
                return annotation
            }
        
        mapView.addAnnotations(newAnnotations)
    }
}

// MARK: - Pirvate
private extension TheaterViewController {

    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func addActions() {
        dismissBarButton.target = self
        dismissBarButton.action = #selector(dismissView)
        
        filterBarButton.target = self
        filterBarButton.action = #selector(filterButtonClicked)
        
        locationBarButton.target = self
        locationBarButton.action = #selector(locationButtonClicked)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black

        navigationItem.leftBarButtonItem = dismissBarButton
        navigationItem.rightBarButtonItems = [filterBarButton, locationBarButton]
    }
    
    func configureLayout() {
        
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    @objc
    func dismissView() {
        dismiss(animated: true)
    }
    
    @objc
    func filterButtonClicked() {
        let filterAlert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        let theaterActions = TheaterType.allCases
            .map { type in
                return UIAlertAction(
                    title: type.name,
                    style: .default,
                    handler: { [weak self] _ in
                        self?.filterTheaterAnnotation(type: type)
                    }
                )
            }
        let cancelAction = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        (theaterActions + [cancelAction]).forEach { filterAlert.addAction($0) }
        
        present(filterAlert, animated: true)
    }
    
    @objc
    func locationButtonClicked() {
        checkDeviceLocationAuthoriazation()
    }
}
