import UIKit

class TabBarController: UITabBarController {
    private let firstTabName = "Today"
    private let firstImageName = "TabBarToday-Light"
    private let secondTabName = "Forecast"
    private let secondImageName = "TabBarForecast-Light"
    
    let firstViewController: TodayViewController

    init(firstViewController: TodayViewController) {
        self.firstViewController = firstViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupApperance()
        setupVCs()
    }
}

private extension TabBarController {
    func setupApperance() {
        configTabBar()
        configNavigationBar()
    }
    
    func configTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    func configNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.setBackgroundImage(UIImage(), for:.default)
        navigationBarAppearace.shadowImage = UIImage()
    }
    
    func setupVCs() {
        guard let fistImage = UIImage(named: firstImageName),
              let secondImage = UIImage(named: secondImageName) else { return }
        
        viewControllers = [
            createNavController(for: firstViewController,
                                title: firstTabName,
                                image: fistImage),
            createNavController(for: ForecastViewController(),
                                title: secondTabName,
                                image: secondImage)
            
//
//            createNavController(for: firstViewController,
//                                title: firstTabName,
//                                image: UIImage(systemName: "pencil.circle")!),
//            createNavController(for: ForecastViewController(),
//                                title: secondTabName,
//                                image: UIImage(systemName: "pencil.circle")!)
        ]
    }
    
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        //navController.navigationBar.prefersLargeTitles = true
        //rootViewController.navigationItem.title = title
        return navController
    }
}
