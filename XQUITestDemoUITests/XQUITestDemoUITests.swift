//
//  XQUITestDemoUITests.swift
//  XQUITestDemoUITests
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import XCTest
import Photos

class XQUITestDemoUITests: XCTestCase {

    /// 开启自动化测试时走该方法, 一般在这里配置一些环境参数
    override func setUp() {
        print("wxq: ", #function)

        // 失败后是否继续
        continueAfterFailure = false
        
        
    }

    /// 一开始创建时, 自带的样例(可删除，自行创建另一个)
    /// 用来测试 App 启动时间的
//    func testLaunchPerformance() {
//        print("wxq: ", #function)
//
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // 性能测试, 启动6次app
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                print("wxq measure: ", #function)
//                // 启动app
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    /// 一开始创建时, 自带的样例(可删除，自行创建另一个)
    /// 运行App，然后该如何如何点击，这些自动化测试就写在这里面
//    func testExample() {
//        print("wxq: ", #function)
//
//        self.testTabbar()
//        self.testNavigation()
//        self.testView()
//        self.testLabel()
//        self.testBtn()
//        self.testTextField()
//        self.testSlider()
//        self.testSwitch()
//        self.testTableView()
//        self.testWebView()
//        self.testRandomTap()
        // 执行完之后, 会自动结束app 
//    }
    
    /// 自动化结束时走该方法
    override func tearDown() {
        print("wxq: ", #function)
    }
    
    // 初始化自己的app
    lazy var app: XCUIApplication = {
        let application = XCUIApplication()
        // 启动app
        application.launch()
        return application
    }()
    
    // 系统的 safari app
    //    let sefariApp = XCUIApplication.init(bundleIdentifier: "com.apple.mobilesafari")
        // 微信app
    //    let wechatApp = XCUIApplication.init(bundleIdentifier: "com.tencent.xin")
    
    /// 测试 tabbar
    func testTabbar() {
        
        // 1秒后再执行, 免得看不清
        // 等待1秒, 不要设置 runningForeground, 不然你会发现停止无用
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 tabbar 上的 button 的标题来取
        let tabbar = app.windows.tabBars.buttons["我的"]
        // 点击视图
        tabbar.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let tabbar1 = app.windows.tabBars.buttons["首页"]
        tabbar1.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 测试 navigation
    func testNavigation() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 如果是title, 则传名称取button
        let btn = app.windows.navigationBars.buttons["更多"]
        btn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 如果是图片, 则图片名称取button
        let btn1 = app.windows.navigationBars.buttons["clock"]
        btn1.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let btn2 = app.windows.navigationBars.buttons["back"]
        btn2.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let btn3 = app.windows.navigationBars.buttons["back"]
        btn3.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 测试 View
    func testView() {
        // 取第一个元素
        //        let btns = app.windows.buttons.firstMatch
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 0)
        // 这样直接取第一个也可以
//        let view = app.windows.cells.firstMatch
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 点击当前控制器的View, 直接这样点就行了
        app.windows.firstMatch.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        /// UIView 显示的类型是 other, 想取出来, 比较困难
        /// 这个时候, 就利用到 accessibilityIdentifier 属性了
        /// 只要项目代码中设置了 id, 那么这边就能直接通过 id 访问
        let v0 = app.windows.otherElements.element(matching: .other, identifier: "view_0")
        v0.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let v1 = app.windows.otherElements.element(matching: .other, identifier: "view_1")
        
        // 双击
        v1.doubleTap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 长按
        v1.press(forDuration: 2)
        
        
        // 扫
        v1.swipeUp()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        v1.swipeDown()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        v1.swipeLeft()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        v1.swipeRight()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 捏合
        v1.pinch(withScale: 1.5, velocity: 1)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 旋转
        v1.rotate(0.5, withVelocity: 1)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let backBtn = app.windows.navigationBars.buttons["首页"]
        backBtn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }
    
    /// 测试 Label
    func testLabel() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 手势都在 view 那边测完了, label 这边没什么好试的...
        
    }
    
    /// 测试 button
    func testBtn() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 2)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 如果只有标题, 则可以根据 button 的标题来取
        let btns = app.windows.buttons["点击背景变白"]
        btns.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 只存在图片
        // 注意, backImage 和 image，同时存在的话，是 Image 优先
        let _ = app.windows.buttons["back"]
        
        // 文字和图片都存在
        let _ = app.windows.buttons["有文字, 图片, 背景图片"]
        
        ///
        /// 总体来说
        /// 文字 > 图片 > 背景图片
        ///
        
        
        
    }

    /// 测试 textField
    func testTextField() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 3)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 可以靠 placeholder, 或者 text 属性取出来..
        // 但还是建议用 accessibilityIdentifier 属性
        let tf = app.textFields.element(matching: .textField, identifier: "test_tf_acc")
        // 需要先点击, 然后再输入
        tf.tap()
        tf.typeText("1232347293847983")
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 注意, 密码是需要取 secureTextField
        let tf1 = app.secureTextFields.element(matching: .secureTextField, identifier: "test_tf_pwd")
        tf1.tap()
        tf1.typeText("123sdjsdjejeew")
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 获取键盘的某个按钮, 并点击
        // 这里有个坑, 就是一些 shift 和 return 这些是 button 来的
        // 而里面的键盘按钮是 key. 所以要注意取的方式有区别
//        let returnBtn = app.keyboards.element(matching: .button, identifier: XCUIKeyboardKey.return.rawValue)
        let returnBtn = app.keyboards.buttons.element(matching: .button, identifier: "Return")
        returnBtn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        // 取出 q 按键
        let qBtn = app.keys["q"]
        qBtn.tap()
        qBtn.tap()
        let _ = app.wait(for: .notRunning, timeout: 1)
        qBtn.tap()
        qBtn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let btn = app.buttons.element(matching: .button, identifier: "test_login")
        btn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        
        
    }
    
    /// 测试 slider
    func testSlider() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 4)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let slider = app.sliders.firstMatch
        // 获取滑条当前的值
        print("wxq: ", slider.normalizedSliderPosition)
        // 拉动滑条
        slider.adjust(toNormalizedSliderPosition: 0.5)
        print("wxq: ", slider.normalizedSliderPosition)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }
    
    /// 测试 switch
    func testSwitch() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 5)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let switches = app.switches.firstMatch
        // 获取当前的值
        print("wxq: ", switches.value ?? "没有value")
        switches.tap()
        print("wxq: ", switches.value ?? "没有value")
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        
    }
    
    /// 测试 tableView
    func testTableView() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 6)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let tables = app.tables.firstMatch
        
        // 删除cell
        tables.xq_swipeLeftDeleteCell(0, deleteButtonTitle: "删除")
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        tables.xq_swipeLeftDeleteCell(3, deleteButtonTitle: "删除")
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 下拉刷新
        tables.swipeDown()
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 滚动到某一行, 并点击
        tables.xq_scrollToElement(element: tables.cells.element(boundBy: 45))
        tables.cells.element(boundBy: 45).tap()
        
        // 其他什么取cell里面的button都差不多
        // 就是根据下标取cell, 或者直接取出tableView里面所有的button这些
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }
    
    /// 测试 webView
    func testWebView() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 7)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 第一次进来，网络请求该如何???
        print("wxq: ", app.debugDescription)
        
        let springboard = XCUIApplication.init(bundleIdentifier: "com.apple.springboard")
        print("wxq: ", springboard.debugDescription)
        
        // 没系统api取 webView 的元素??
        // 那这个干鸡儿, 用起来也太麻烦了吧
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        
    }
    
    /// 测试随机点击
    func testRandomTap() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        app.xq_randoTap()
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }
    
    
    /// Home 键
    func testHome() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 单击 Home 键
        XCUIDevice.shared.press(.home)
        
        // 并没有查到如何双击 Home 键...
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 调节音量
    func testVolume() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 调节音量
        XCUIDevice.shared.press(.volumeUp)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        XCUIDevice.shared.press(.volumeDown)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    
    /// 转移设备方向
    func testDeviceOrientation() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 调节方向
        // 注意, 手机要先允许转向才行
        XCUIDevice.shared.orientation = .landscapeLeft
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 唤醒 Siri
    func testSiri() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 唤醒 Siri, 并输入语句
        // 突然唤醒 Siri, 会说话很大声, 在公司玩耍的话, 建议先调小声 😁
        XCUIDevice.shared.siriService.activate(voiceRecognitionText: "我帅么?");
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 调用系统截图
    func testScreenshot() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        // 截图
        print("wxq: ", app.keys.count, app.keys.debugDescription)
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 保存图片到本地(还不行...)
    func testSaveImage() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        // 截图
        app.screenshot().xq_saveImageToAlbum(app.screenshot().image)
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 获取手机的桌面应用, 这个可以搞一些骚操作
    func testSpringboard() {
        
        // 感觉这个对于一般的自动化测试没什么用, 不过这里就先记录着吧
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let view = app.windows.cells.element(boundBy: 8)
        view.tap()
        
        
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 获取桌面应用
        // 注意. 第一次获取 springboard, 需要比较久的时间(我测的时候是20秒左右)才能反映过来, 并不是卡死了...
        let springboard = XCUIApplication.init(bundleIdentifier: "com.apple.springboard")
        print("wxq: ", springboard.debugDescription)
//        springboard.swipeLeft()
        
        
        // 获取桌面 View
        // 注意, 如果直接在 APP 内获取, 是获取不到桌面 View 的
        // 需要先调用 XCUIDevice.shared.press(.home), 回到桌面后, 然后再取里面的元素
//        springboard.otherElements.element(matching: .other, identifier: "Home screen icons")
        
        // 获取桌面最左边的 widget 应用 view
//        springboard.otherElements.element(matching: .other, identifier: "WGMajorListViewControllerView")
        
        // 获取桌面, 底部滚动圆点, 可以通过 value 这些, 知道当前在第几页
//        springboard.pageIndicators.element(matching: .pageIndicator, identifier: "Page control").value
        
        // 获取桌面, 底部 Dock 栏
//        springboard.otherElements["Dock"]
        
        // 系统左上角, 返回上一个 app 按钮(就是用 scheme 跳转到其他应用时, 会出现的返回按钮)
//        springboard.buttons.element(matching: .button, identifier: "breadcrumb").tap()
        
        // 网络信号强度格子
//        springboard.otherElements["Cellular"].value
        
        // 也可以获取当前网络, 时间, 电量什么的..反正就是界面上的一切都能获取
        
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 获取虚拟 Home 键
    func testAssistiveTouch() {
        
    }
}

extension XCUIElement {
    
    /// 随机点击
    /// - Parameter tapNumber: 随机点击多少次
    func xq_randoTap(_ tapNumber: Int = 20) {
        
        var alreadyTapNumber = tapNumber
        while alreadyTapNumber > 0 {
            // 调用视图的左上角为 (0, 0), 右下角为 (1, 1)
            
            let x = Double(arc4random() % 100)/100.0
            let y = Double(arc4random() % 100)/100.0
            print("wxq: ", x, y)
            let vector = CGVector.init(dx: x, dy: y)
            let uiCoordinate = self.coordinate(withNormalizedOffset: vector)
            uiCoordinate.tap()
            alreadyTapNumber -= 1
        }
        
    }
}

extension XCUIElement {
    
    /// 针对 tableView 的封装
    
    
    
    /// 滚动到某个元素
    /// 默认向下滚动
    /// 这里可以再封装一下的，比如可以向上滚动, 可以无限循环上下滚动等等...
    /// - Parameter element: UI元素
    /// - Parameter isAutoStop: true 滚动到最后一个, 自动停下来
    func xq_scrollToElement(element: XCUIElement, isAutoStop: Bool = true) {
        // 一直滚动到某个元素出现为止
        while !element.xq_visible() {
            
            // 滚动到最后就停下来
            if isAutoStop && self.elementType == .table {
                let lastElement = self.cells.element(boundBy: self.cells.count - 1)
                if lastElement.xq_visible() {
                    break
                }
            }
            
            self.swipeUp()
        }
    }
    
    /// 是否已经显示在当前界面中
    func xq_visible() -> Bool {
        
        guard self.exists && !self.frame.isEmpty else {
            return false
            
        }
        
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }

    
    /// 左滑删除
    /// - Parameter index: cell 的下标
    /// - Parameter deleteButtonTitle: 删除按钮标题
    func xq_swipeLeftDeleteCell(_ index: Int, deleteButtonTitle: String) {
        
        let cell = self.cells.element(boundBy: index)
        cell.swipeLeft()
        
        let deleteBtn = cell.buttons[deleteButtonTitle]
        deleteBtn.tap()
    }
    
}


extension XCUIScreenshot {
    
    /// 保存图片到, 相机胶卷
    @objc func xq_saveImageToAlbum(_ image: UIImage) {
        
        /// 异步执行修改操作
        PHPhotoLibrary.shared().performChanges({
            
            PHAssetChangeRequest.creationRequestForAsset(from: image)
            
        }) { (success, error) in
            if let error = error {
                print("保存失败: ", error)
            } else {
                print("保存成功")
            }
        }
    }
    
}
