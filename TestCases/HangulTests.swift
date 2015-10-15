//
//  HangulTests.swift
//  AheuiSwift
//
//  Created by wookyoung on 10/15/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

class HangulTests: XCTestCase {

    func test기능() {
        let 저장 = 스택()
        let (초,중,종,연산) = 기능(저장, 소리: "닫")
        XCTAssertEqual(초, 3)
        XCTAssertEqual(커서이동(내비둠, 좌우: +한칸), 중)
        XCTAssertEqual(종, 3)
        XCTAssertEqual("(Function)", String(연산))
        let m = Mirror(reflecting: 연산)
        XCTAssertEqual("Mirror for (저장공간, protocol<>) -> ()", String(m))
        XCTAssertEqual("(저장공간, protocol<>) -> ()", String(m.subjectType))
        XCTAssertEqual(nil, m.displayStyle)
        XCTAssertEqual(0, m.children.count)
    }
        
    func test없음() {
        let funs :Array<(저장공간, Any)->()> = [없음]
        XCTAssertEqual(1, funs.count)
    }

}
