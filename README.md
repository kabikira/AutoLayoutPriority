# はじめに
前に調べた時情報が見つからなかったのでメモ

NSLayoutConstraintクラスのpriorityプロパティに代入すればできるとアドバイス頂きました。

公式リファレンス
https://developer.apple.com/documentation/uikit/nslayoutconstraint#2882272


# Storyboardを使わないプロジェクトの設定をします
やり方知らないかたは[こちらの記事どうぞ](https://qiita.com/Imael/items/e908aef1e6fc077f29fc).  

# コードです
今回はできるものはオートレイアウトの優先度は関係のないものです
書き方だけ参考になればと思います。

```swift
import UIKit

class ViewController: UIViewController {
    var topView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = .white
        
        topView = UIView()
        topView.backgroundColor = .red
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        
        // オートレイアウトの制約
        let constraint = topView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        // レイアウトの制約を有効化
        constraint.isActive = true
        // オートレイアウトの優勢度
        constraint.priority = .defaultHigh
        // 優先度がの数値を確認
        print(constraint.priority)
        
        
        let constraints: [NSLayoutConstraint] = [
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
        ]
        NSLayoutConstraint.activate(constraints)
       
    }


}
```

#### ここで優先度変えてます。
```swift
// オートレイアウトの制約
        let constraint = topView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        // レイアウトの制約を有効化
        constraint.isActive = true
        // オートレイアウトの優勢度
        constraint.priority = .defaultHigh
        // 優先度がの数値を確認
        print(constraint.priority)
```

#### defaultHighとdefaultLowがあります。
```swift
        // オートレイアウトの優勢度
        constraint.priority = .defaultHigh //750
```
```swift
        // オートレイアウトの優勢度
        constraint.priority = .defaultLow //250
```
#### こうすると好きな数値入れられます。
```swift
        // オートレイアウトの優勢度
        constraint.priority = .init(rawValue: 333)
```
