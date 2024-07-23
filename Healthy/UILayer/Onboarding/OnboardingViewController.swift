//
//  OnboardingViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Views
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    let pageControl = UIPageControl()
    // MARK: - Properties
    var pages = [UIViewController]()
    weak var viewOutput: OnboardingOutput!
    
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingOutput!) {
        super.init(nibName: nil, bundle: nil)
        self.pages = pages
        self.viewOutput = viewOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("NSCoder")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
        setupPageControl()
    }


}

private extension OnboardingViewController {
    func setupPageController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

// MARK: - Delegates
extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentPage = pages.firstIndex(of: viewController), currentPage > 0 else { return nil}
        return pages[currentPage - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentPage = pages.firstIndex(of: viewController), currentPage < pages.count - 1 else { return nil}
        return pages[currentPage + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
        }
    }
}
