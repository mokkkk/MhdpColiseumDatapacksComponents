#> mhdp_monsters:core/util/tick/event/start_attack.m
# 
# 汎用処理 攻撃開始処理
#
# @within function mhdp_monsters:/**

# 部位ID設定
    $data modify storage mhdp_core:temp Temp.Part set value "$(AttackPart)"

# 分岐処理実行
    function mhdp_monsters:core/switch/start_attack
