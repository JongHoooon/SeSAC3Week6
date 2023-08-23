//
//  CinemaViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/23.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

final class CinemaViewController: UIViewController {
    
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    
    // MARK: - UI
    
    private let mapView = MKMapView()

    private let filterBarButton = UIBarButtonItem(
        title: "Filter",
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
    }
}

// MARK: - Pirvate

private extension CinemaViewController {
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.leftBarButtonItem = dismissBarButton
        dismissBarButton.target = self
        dismissBarButton.action = #selector(dismissView)
        
        navigationItem.rightBarButtonItem = filterBarButton
        filterBarButton.target = self
        filterBarButton.action = #selector(filterButtonClicked)
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
        
    }
}
