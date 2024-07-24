//
//  OnboardingViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Views
    let pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal)
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
        pageViewController.view.backgroundColor = .white
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = AccentColors.mainBlue
        pageControl.pageIndicatorTintColor = AccentColors.unselectedIcon
        // turning off switch pages by tapping on circles
        pageControl.isUserInteractionEnabled = false
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -322)
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
        guard let currentPage = pages.firstIndex(of: viewController), currentPage < pages.count - 1 else { return nil }
        return pages[currentPage + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            guard let nextViewController = previousViewControllers.first else { return }
            if let index = pages.firstIndex(of: nextViewController) {
                pageControl.currentPage = index
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let nextViewController = pendingViewControllers.first else { return }
        if let index = pages.firstIndex(of: nextViewController) {
            pageControl.currentPage = index
        }
    }
}
