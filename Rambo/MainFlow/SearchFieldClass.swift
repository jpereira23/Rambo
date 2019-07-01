//
//  SearchFieldClass.swift
//  Rambo
//
//  Created by Jeffery Pereira on 6/27/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class SearchFieldClass: UITextField {

    
    var tableView: UITableView?
    var resultList: [String] = []
    var dataList: [String] = []
    open override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        tableView?.removeFromSuperview()
    }
    
    override open func willMove(toSuperview newSuperview: UIView?){
        super.willMove(toSuperview: newSuperview)
        
        self.addTarget(self, action: #selector(SearchFieldClass.textFieldDidChange), for: .editingChanged)
        self.addTarget(self, action: #selector(SearchFieldClass.textFieldDidBeginEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(SearchFieldClass.textFieldDidEndEditing), for: .editingDidEnd)
        self.addTarget(self, action: #selector(SearchFieldClass.textFieldDidEndEditingOnExit), for: .editingDidEndOnExit)
    }
    
    override open func layoutSubviews(){
        super.layoutSubviews()
        buildSearchTableView()
    }
    
    @objc open func textFieldDidChange(){
        filter()
        updateSearchTableView()
        tableView?.isHidden = false
    }
    
    @objc open func textFieldDidBeginEditing(){
        print("Begin Editing")
    }
    
    @objc open func textFieldDidEndEditing(){
        print("End Editing")
    }
    
    @objc open func textFieldDidEndEditingOnExit(){
        print("End on Exit")
    }
    
    
    fileprivate func filter(){
        resultList = []
        for i in 0..<dataList.count{
            let theRange = (dataList[i] as NSString).range(of: text!, options: .caseInsensitive)
            
            if theRange.location != NSNotFound{
                resultList.append(dataList[i])
            }
        }
        tableView?.reloadData()
    }

}

extension SearchFieldClass: UITableViewDelegate, UITableViewDataSource{
    
    func buildSearchTableView(){
        if let tableView = tableView{
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomSearchTextFieldCell")
            tableView.delegate = self
            tableView.dataSource = self
            self.window?.addSubview(tableView)
        } else {
            tableView = UITableView(frame: CGRect.zero)
        }
        
        updateSearchTableView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSearchTextFieldCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor(red: 12.0/255.0, green: 199.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = resultList[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return cell
    
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.text = resultList[indexPath.row]
        tableView.isHidden = true
        self.endEditing(true)
    }
    
    
    
    func updateSearchTableView(){
        if let tableView = tableView {
            superview?.bringSubviewToFront(tableView)
            var tableHeight: CGFloat = 0
            tableHeight = tableView.contentSize.height
            
            if tableHeight < tableView.contentSize.height{
                tableHeight -= 10
            }
            
            var tableViewFrame = CGRect(x: 0, y: 0, width: frame.size.width - 4, height: tableHeight)
            tableViewFrame.origin = self.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x += 2
            tableViewFrame.origin.y += frame.size.height + 2
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.tableView?.frame = tableViewFrame
            })
            
            tableView.layer.masksToBounds = true
            tableView.separatorInset = UIEdgeInsets.zero
            tableView.layer.cornerRadius = 5.0
            tableView.separatorColor = UIColor.white
            tableView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            tableView.reloadData()
        }
        
    }
    
    
}
