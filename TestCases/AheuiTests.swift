//
//  AheuiTests.swift
//  AheuiSwift
//
//  Created by wookyoung on 10/14/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

class AheuiTests: XCTestCase {
    
    func test아희() {
        XCTAssertEqual("", 아희(""))
        XCTAssertEqual("", 아희("아희"))
        XCTAssertEqual("", 아희("밯망희"))
        XCTAssertEqual("45", 아희("발밞따망희"))
        XCTAssertEqual("5", 아희("반받다망희"))
    }

    func test헬로우월드() {
        let 밤밣따 :String =
            "밤밣따빠밣밟따뿌\n" +
            "빠맣파빨받밤뚜뭏\n" +
            "돋밬탕빠맣붏두붇\n" +
            "볻뫃박발뚷투뭏붖\n" +
            "뫃도뫃희멓뭏뭏붘\n" +
            "뫃봌토범더벌뿌뚜\n" +
            "뽑뽀멓멓더벓뻐뚠\n" +
            "뽀덩벐멓뻐덕더벅\n"
        XCTAssertEqual("Hello, world!\n", 아희(밤밣따))
    }
    
}
