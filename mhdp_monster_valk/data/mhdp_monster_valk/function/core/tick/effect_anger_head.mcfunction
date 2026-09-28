#> mhdp_monster_valk:core/tick/effect_anger_head
#
# tick処理 怒り中演出 頭 (at_locator pos_head から実行)
#
# @within function mhdp_monster_valk:core/tick/effect_anger

# 怒りパーティクル
    execute positioned ^ ^ ^ run particle dust{color:[1.000,0.112,0.112],scale:0.6} ^ ^ ^0.3 0.35 0.35 0.35 0.15 1
