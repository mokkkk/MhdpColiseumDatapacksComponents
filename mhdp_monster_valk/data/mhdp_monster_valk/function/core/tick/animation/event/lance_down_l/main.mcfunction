#> mhdp_monster_valk:core/tick/animation/event/lance_down_l/main
#
# アニメーションイベントハンドラ ダウン (左)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_down_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_down_l.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# スタン中演出
    execute if entity @s[tag=Mns.State.IsStun] run function animated_java_valk:valk/at_locator {name:"pos_head",command:"function mhdp_monster_valk:core/tick/animation/event/lance_down_l/effect_stun"}

# 終了
    execute if score @s aj.lance_down_l.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/lance_down_l/end
