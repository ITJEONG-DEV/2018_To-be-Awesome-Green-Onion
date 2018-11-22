local itemData = {}

--[[
***************item-list***************
-----------포션-----------
- item_1: 비료
- item_2: 비타민
- item_3: 영양제
- item_4: 간식

-----------패시브 아이템-----------
- item_5: 동료의 응원
- item_6: 근육의 몸부림
- item_7: 100년 묵은 산삼

-----------착용 아이템-----------
- item_8: 참기름
- item_9: 양파검
- item_10: 금가루

-----------디버프 아이템-----------
- item_11: 제초제
- item_12: 악몽

-----------퀘스트 아이템-----------
- item_13: 열쇠뭉치
- item_14: 쥐들의 영리항
- item_15: 당근의 달달함
- item_16: 쇠똥구리의 차분함
- item_17: 브로콜리의 벽치기
- item_18: 새의 버스
]]

function itemData.getItemName(item)
  if item == 1 then return "비료"
  elseif item == 2 then return "비타민"
  elseif item == 3 then return "영양제"
  elseif item == 4 then return "간식"
  elseif item == 5 then return "동료의 응원"
  elseif item == 6 then return "근육의 몸부림"
  elseif item == 7 then return "100년 묵은 산삼"
  elseif item == 8 then return "참기름"
  elseif item == 9 then return "양파검"
  elseif item == 10 then return "금가루"
  elseif item == 11 then return "제초제"
  elseif item == 12 then return "악몽"
  elseif item == 13 then return "열쇠뭉치"
  elseif item == 14 then return "쥐들의 영리함"
  elseif item == 15 then return "당근의 당당함"
  elseif item == 16 then return "쇠똥구리의 차분함"
  elseif item == 17 then return "브로콜리의 벽치기"
  elseif item == 18 then return "새의 버스"
  else
    --print "아이템의 이름을 불러올 수 없습니다 / [" .. item .. "번아이템]"
    return ""
  end
end

function itemData.getItemText(item)
  if item == 1 then return "유모의 따스함이 느껴진다"
  elseif item == 2 then return "\n  동국대의 기술이 집약된\n\t\t  최첨단 비타민제\n  (MADE IN 일산 캠퍼스)"
  elseif item == 3 then return "어느 제약회사의 영양제. 딱 내 스타일"
  elseif item == 4 then return "내가 먹어도 좋고 다른 친구들에게도\n\t\t\t  나눠주고 싶은 맛이다"
  elseif item == 5 then return "죽음에 가까웠으나 동료의 의지로\n\t\t\t\t  다시 일어선다"
  elseif item == 6 then return "헬스의 힘으로 기존 속도보다 빨라진다"
  elseif item == 7 then return "신토불이의 힘으로 최대 생명력을\n\t\t\t\t   2배 늘려준다"
  elseif item == 8 then return "1회에 한하여 적들의 공격을\n\t\t  무효화 할 수 있다"
  elseif item == 9 then return "자신의 한쪽 팔을 검으로 만드는 비법을\n   터득하여 적에게 매운 맛을 보여준다"
  elseif item == 10 then return "우연히 창고에서 발견하게된 금가루.\n\t\t  몸에 두르기에 안성맞춤이다"
  elseif item == 11 then return "DNA를 파괴하는 죽음의 물질"
  elseif item == 12 then return "동료들이 잡아먹히는\n    악몽을 꾸게 된다"
  elseif item == 13 then return "열쇠가 많다"
  elseif item == 14 then return "\n쥐의 아이큐는 10이다\n양파의 아이큐는 0이다\n따라서 쥐는 영리하다"
  elseif item == 15 then return "당(근)당(근)"
  elseif item == 16 then return "CarMinuteHam"
  elseif item == 17 then return "=3"
  elseif item == 18 then return "킹갓제네럴엠페럴충무공마제스티하이퍼울트라판타스틱익스트림지니어스화룔점정마스터 버드"
  else
    --print "아이템의 설명을 불러올 수 없습니다 / [" .. item .. "번아이템]"
    return ""
  end
end

function itemData.getItemEffect(item)
  if item == 1 then return "하트 1 회복"
  elseif item == 2 then return "\n하트 2 회복"
  elseif item == 3 then return "하트 2 회복"
  elseif item == 4 then return "하트 1 회복"
  elseif item == 5 then return "1회 부활 (최대 생명력으로)"
  elseif item == 6 then return "속도 30% 증가"
  elseif item == 7 then return "최대 생명력 2배"
  elseif item == 8 then return "피격 1회 무효"
  elseif item == 9 then return "적 5초간 기절 (주방장 제외)"
  elseif item == 10 then return "사람이 양파를 인식할 수 없게 함\n\t\t (주장장 제외, 최초 1명)"
  elseif item == 11 then return "최대생명력 절반으로 감소"
  elseif item == 12 then return "속도 20% 감소"
  elseif item == 13 then return "????"
  elseif item == 14 then return "\n마로의 탈출 경로를 10초간 보여준다"
  elseif item == 15 then return "10초간 이동속도 20% 증가"
  elseif item == 16 then return "쇠똥구리가 탈출 경로로\n\t   10초간 이끌어줌"
  elseif item == 17 then return "한 화면 내에서 탈출 경로를\n\t  다이렉트로 뚫어준다"
  elseif item == 18 then return "미로 끝으로 데려가준다"
  else
    --print "아이템의 이름을 불러올 수 없습니다 / [" .. item .. "번아이템]"
    return ""
  end
end

function itemData.getTextColor(item)
  if item == 1 or item == 2 or item == 3 or item == 4 then return "ff0084"
  elseif item == 5 or item == 6 or item == 7 then return "ffc528"
  elseif item == 8 or item == 9 or item == 10 then return "2d55ff"
  elseif item == 11 or item == 12 then return "ff0084"
  elseif item == 13 or item == 14 or item == 15 or item == 16 or item == 17 or item == 18 then return "00ff3c"
  else
    --print "아이템의 분류 색깔을 불러올 수 없습니다 / [" .. item .. "번아이템]"
    return ""
  end
end

function itemData.getImage(item)
  if item == 1 then
    return "/_ITEM_/쿼터-비료.png"
  elseif item == 2 then
    return "/_ITEM_/쿼터-비타민.png"
  elseif item == 3 then
    return "/_ITEM_/쿼터-영양제.png"
  elseif item == 4 then
    return "/_ITEM_/쿼터-간식.png"
  else
     return "Icon.png"
  end

end

return itemData
