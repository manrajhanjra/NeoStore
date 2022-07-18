//
//  ProductViewViewController.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 14/07/22.
//

import UIKit

class ProductViewViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var productId: Int = 1
    lazy var viewModel: ProductPageViewModelType = ProductPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setHeader()
        setUpTableView()
        loadData()
    }
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        let uiNIb = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(uiNIb, forCellReuseIdentifier: "productCell")
    }
    
    func setHeader(){
        switch(productId){
        case 1: headerLbl.text = "Tables"
        case 2: headerLbl.text = "Sofas"
        case 3: headerLbl.text = "Chairs"
        case 4: headerLbl.text = "Cupboards"
        default: headerLbl.text = "Tables"
        }
        headerLbl.tintColor = .neoColor
        headerView.backgroundColor = .bckColor
    }
    
   
    
    init(navigationName: Int) {
        self.productId = navigationName
        super.init(nibName: "ProductViewViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func backBtnTapped(_ sender: Any) {
      navigationController?.popViewController(animated: true)
    }
    
    func loadData(){
        let model = ProductData(productId: self.productId, limit: 10, page: 1)
        viewModel.loadProducts(productDetails: model) { shouldReload in
            if(shouldReload){
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension ProductViewViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalProductCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let data = viewModel.fetchDataFromArray(index: indexPath.row)
        cell.setUpCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
