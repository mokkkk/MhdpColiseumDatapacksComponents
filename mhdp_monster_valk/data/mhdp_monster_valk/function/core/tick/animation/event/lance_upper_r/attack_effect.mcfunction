#> mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
#
# アニメーションイベントハンドラ 翼槍突き上げ 前方一直線の演出 (attack から positioned で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^0.3 ^ 1 1 1 0.15 5
    particle explosion ^ ^1 ^ 1.2 1.2 1.2 0 8
    # TODO(Stage6): Bomb / RedFlash VFX。shot/vfx システム実装後に復帰
    # summon text_display ^ ^0.7 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    # summon text_display ^ ^1 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[6f,6f,6f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
