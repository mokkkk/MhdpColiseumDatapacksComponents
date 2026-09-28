#> mhdp_monster_valk:core/tick/effect_anger_wing
#
# tick処理 怒り中演出 翼 (at_locator pos_muzzle_* から実行)
#
# @within function mhdp_monster_valk:core/tick/effect_anger

# 怒りパーティクル
    execute positioned ^ ^ ^ run particle dust{color:[1.000,0.000,0.152],scale:1} ^ ^ ^ 0.5 0.5 0.5 0.15 1
    execute positioned ^ ^ ^ run particle crimson_spore ^ ^ ^ 0.3 0.3 0.3 1 2
