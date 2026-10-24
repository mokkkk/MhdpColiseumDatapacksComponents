#> mhdp_monster_ranposu:core/tick/animation/event/state_stun/main
#
# アニメーションイベントハンドラ スタン
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s animated_java_ranposu.ranposu.state_stun.frame matches 4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# スタン中演出
    execute if entity @s[tag=Mns.State.IsStun] run function animated_java_ranposu:ranposu/at_locator {name:"pos_head",command:"function mhdp_monster_ranposu:core/tick/animation/event/state_stun/effect_stun"}
    scoreboard players set @s Mns.General.BlinkTimer 3
    
# 終了
    execute if score @s animated_java_ranposu.ranposu.state_stun.frame matches 34 run function mhdp_monster_ranposu:core/tick/animation/event/state_stun/end
