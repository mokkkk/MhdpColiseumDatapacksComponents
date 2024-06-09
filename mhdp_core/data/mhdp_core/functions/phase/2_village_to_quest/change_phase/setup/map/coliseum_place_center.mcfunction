#> mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum_place_center
#
# クエスト開始処理 大闘技場のフィールド初期化処理 モンスター移動用の中心点設置
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum

# 壁埋まり防止
    summon marker -65 66 101 {Tags:["Mk.Field.Back"]}
    summon marker -22 66 126 {Tags:["Mk.Field.Back"]}
    summon marker -33 66 95 {Tags:["Mk.Field.Back"]}
    summon marker -24 66 64 {Tags:["Mk.Field.Back"]}
    summon marker -125 66 127 {Tags:["Mk.Field.Back"]}
    summon marker -92 66 67 {Tags:["Mk.Field.Back"]}
    summon marker -64 66 136 {Tags:["Mk.Field.Back"]}
    summon marker -66 66 67 {Tags:["Mk.Field.Back"]}
