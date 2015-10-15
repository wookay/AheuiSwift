//
//  Aheui.swift
//  AheuiSwift
//
//  Created by wookyoung on 10/14/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import Foundation

func 아희(입력 :String) -> String {
    var 격자 = Dictionary<좌표,Character>()
    let 여러줄 = 입력.componentsSeparatedByString("\n")
    for (행값, 줄) in 여러줄.enumerate() {
        for (렬값, 글자) in 줄.characters.enumerate() {
            격자[좌표(행: 행값, 렬: 렬값)] = 글자
        }
    }
    return 아희(격자)
}

func 아희(입력 :Dictionary<좌표,Character>) -> String {
    if 입력.isEmpty {
        return ""
    }
    let 저장 = 스택()
    var 커서 = 좌표(행: 0, 렬: 0)
    var 계속 :Bool = true
    while 계속 {
        if let 글자 = 입력[커서] as Character! {
            let (초,중,종,연산) = 기능(저장, 소리: 글자)
            switch 초 {
            case 초성_에러:
                계속 = false
                break
            case 초성_ㅎ:
                계속 = false
                break
            default:
              연산(저장, 종)
              커서 = 진행(저장, 커서: 중, 위치: 커서)
            }
        } else {
            break
        }
    }
    var 출력 = ""
    for 아이템 in 저장.출력 {
        출력 += String(아이템)
    }
    return 출력
}

func 진행(저장 :저장공간, 커서 :커서움직임, 위치 :좌표) -> 좌표 {
    if 커서.움직임 {
        return 좌표(행: 위치.행 + 커서.상하, 렬: 위치.렬 + 커서.좌우)
    } else {
        return 위치
    }
}

protocol 저장공간 {
    var 공간 :[Any] {get set}
    var 출력 :[Any] {get set}
}

class 스택 : 저장공간 {
    var 공간 :[Any] = []
    var 출력 :[Any] = []
}
class 큐 : 저장공간 {
    var 공간 :[Any] = []
    var 출력 :[Any] = []
}
class 통로 : 저장공간 {
    var 공간 :[Any] = []
    var 출력 :[Any] = []
}

func 없음(저장 :저장공간, _ :Any) {
}

func isempty(a :[Any]) -> Bool {
    return a.isEmpty
}

func 끝냄(저장 :저장공간, _ :Any) {
    isempty(저장.공간) ? 0 : 뽑(저장)
}

func 덧셈(저장 :저장공간, _ :Any) {
    집어넣기(저장, 값: 뽑(저장)+뽑(저장))
}

func 곱셈(저장 :저장공간, _ :Any) {
    집어넣기(저장, 값: 뽑(저장)*뽑(저장))
}

func 뺄셈(저장 :저장공간, _ :Any) {
    집어넣기(저장, 값: -뽑(저장)+뽑(저장))
}

func 나눗셈(저장 :저장공간, _ :Any) {
    let (갑,을) = (뽑(저장), 뽑(저장))
    집어넣기(저장, 값: 을/갑)
}

func 나머지(저장 :저장공간, _ :Any) {
    let (갑,을) = (뽑(저장), 뽑(저장))
    집어넣기(저장, 값: 을%갑)
}

func 뽑(var 저장 :저장공간) -> Int {
    return 저장.공간.removeLast() as! Int
}

func 집어넣기(var 저장 :저장공간, 값 :Any) {
    let 받침 :Int = 값 as! Int
    switch 받침 {
    case 종성_ㅇ:
        break
    case 종성_ㅎ:
        break
    default:
        저장.공간.append(받침)
    }
}

func 바꿔치기(var 저장 :저장공간, _ :Any) {
    let end = 저장.공간.count - 1
    if end > 0 {
        (저장.공간[end], 저장.공간[end-1]) = (저장.공간[end-1], 저장.공간[end])
    }
}

func 선택(저장 :저장공간, _ :Any) {
}

func 비교(저장 :저장공간, _ :Any) {
    if 뽑(저장) >= 뽑(저장) {
        집어넣기(저장, 값: 1)
    } else {
        집어넣기(저장, 값: 0)
    }
}

func 중복(var 저장 :저장공간, _ :Any) {
    let 값 = 저장.공간[저장.공간.count-1]
    저장.공간.append(값)
}

func 뽑기(var 저장 :저장공간, 값 :Any) {
    if isempty(저장.공간) {
    } else {
        let 받침 = 값 as! Int
        switch 받침 {
        case 종성_ㅎ:
            저장.출력.append(UnicodeScalar(뽑(저장)))
            break
        default:
            저장.출력.append(뽑(저장))
        }
    }
}

func 조건(저장 :저장공간, _ :Any) {
}

func 이동(저장 :저장공간, _ :Any) {
}

let 닿소리표 :Array<(저장공간, Any) -> ()> = [없음, 없음, 나눗셈, 덧셈, 곱셈, 나머지, 뽑기, 집어넣기, 중복, 선택, 이동, 없음, 비교, 없음, 조건, 없음, 뺄셈, 바꿔치기, 끝냄]