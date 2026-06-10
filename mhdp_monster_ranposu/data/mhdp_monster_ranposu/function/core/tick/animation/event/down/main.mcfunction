#> mhdp_monster_ranposu:core/tick/animation/event/down/main
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.down.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.down.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s aj.down.frame matches 4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# スタン中演出
    function animated_java:ranposu/at_locator {name:"pos_head",command:"function mhdp_monster_ranposu:core/tick/animation/event/down/effect_stun"}
    # execute if entity @s[tag=Mns.State.IsStun] run function animated_java:ranposu/at_locator {name:"pos_head",command:"function mhdp_monster_ranposu:core/tick/animation/event/down/effect_stun"}

# 終了
    execute if score @s aj.down.frame matches 34 run function mhdp_monster_ranposu:core/tick/animation/event/down/end
