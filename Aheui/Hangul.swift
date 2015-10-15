//
//  Hangul.swift
//  AheuiSwift
//
//  Created by wookyoung on 10/15/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import Foundation

let 내비둠 = 0
let 한칸  = 1
let 두칸  = 2

let 홀소리표 = [
    커서이동(내비둠, 좌우: +한칸),
    기능없음(),
    커서이동(내비둠, 좌우: +두칸),
    기능없음(),
    커서이동(내비둠, 좌우: -한칸),
    기능없음(),
    커서이동(내비둠, 좌우: -두칸),
    기능없음(),
    커서이동(-한칸, 좌우: 내비둠),
    기능없음(),
    기능없음(),
    기능없음(),
    커서이동(-두칸, 좌우: 내비둠),
    커서이동(+한칸, 좌우: 내비둠),
    기능없음(),
    기능없음(),
    기능없음(),
    커서이동(+두칸, 좌우: 내비둠),
    기능없음(), // ㅡ  FIXME: 방향 바꾸기 처리 추가
    기능없음(), // ㅢ
    기능없음(), // ㅣ
]

let 초성_ㅎ = 18
let 초성_에러 = -1
let 종성_ㅇ = -1
let 종성_ㅎ = -2
let 종성획수표 = [0, 2, 4, 4, 2, 5, 5, 3, 5, 7, 9, 9, 7, 9, 9, 8, 4, 4, 6, 2, 4, 종성_ㅇ, 3, 4, 3, 4, 4, 종성_ㅎ]
let 유니코드_가 = 0xAC00
let 유니코드_히흫 = 0xD7A3
let 초성오프셋 = 21 * 28
let 중성오프셋 = 28

struct 커서움직임 : Equatable {
    var 움직임 :Bool
    var 상하  :Int
    var 좌우  :Int
}

struct 좌표 : Hashable, Equatable {
  var 행 :Int
  var 렬 :Int
    
  var hashValue: Int {
    return "\(행),\(렬)".hashValue
  }
}

func 기능(저장 :저장공간, 소리 :Character) -> (Int!, 커서움직임, Int!, (저장공간, Any) -> ()) {
  let scalars = String(소리).unicodeScalars
  var 값 :Int = Int(scalars[scalars.startIndex].value)
  if 값 >= 유니코드_가 && 값 <= 유니코드_히흫 {
    값 -= 유니코드_가
    let 초성인덱스 = (값 / 초성오프셋)
    값 %= 초성오프셋
    let 중성인덱스 = (값 / 중성오프셋)
    let 종성인덱스 = (값 % 중성오프셋)
    return (초성인덱스, 홀소리표[중성인덱스], 종성획수표[종성인덱스], 닿소리표[초성인덱스])
  } else {
    return (초성_에러, 기능없음(), 0, 없음)
  }
}

func 커서이동(상하 :Int, 좌우 :Int) -> 커서움직임 {
    return 커서움직임(움직임: true, 상하: 상하, 좌우: 좌우)
}

func 기능없음() -> 커서움직임 {
    return 커서움직임(움직임: false, 상하: 0, 좌우: 0)
}

func ==(lhs: 좌표, rhs: 좌표) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

func ==(lhs: 커서움직임, rhs: 커서움직임) -> Bool {
    return lhs.움직임 == rhs.움직임 &&
        lhs.상하 == rhs.상하 &&
        lhs.좌우 == rhs.좌우
}