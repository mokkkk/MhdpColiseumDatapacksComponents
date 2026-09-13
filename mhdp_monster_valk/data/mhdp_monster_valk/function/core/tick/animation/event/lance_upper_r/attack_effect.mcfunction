#> mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
#
# アニメーションイベントハンドラ 翼槍突き上げ 前方一直線の演出 (attack から positioned で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^0.3 ^ 1 1 1 0.15 5
    particle explosion ^ ^1 ^ 1.2 1.2 1.2 0 8

# 爆発 VFX (assets:object 10046.valk_bomb)
    execute positioned ^ ^0.7 ^ rotated ~ 0 run function api:object/summon.m {ObjectId:10046}

# 赤フラッシュ VFX (assets:object 10047.valk_red_flash, scale 6)
    data modify storage api: Arg.Override set value {Scale:6}
    execute positioned ^ ^1 ^ rotated ~ 0 run function api:object/summon.m {ObjectId:10047}
