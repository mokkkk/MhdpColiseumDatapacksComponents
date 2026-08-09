#> mhdp_monster_dino:core/tick/animation/event/roundforce_interrupt/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.roundforce_interrupt.frame matches 36..42 at @s run tp @s ^ ^ ^-0.4 ~ ~
    execute if score @s aj.roundforce_interrupt.frame matches 43..50 at @s run tp @s ^ ^ ^-0.2 ~ ~

# 演出
    execute if score @s aj.roundforce_interrupt.frame matches 5 run function animated_java_dino:dino/at_locator {name:"pos_tail_2",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce_interrupt/particle_tail_hit"}
    execute if score @s aj.roundforce_interrupt.frame matches 5 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce_interrupt/particle_tail_hit"}
    execute if score @s aj.roundforce_interrupt.frame matches 36 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce_interrupt.frame matches 36 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce_interrupt.frame matches 36 run function animated_java_dino:dino/at_locator {name:"pos_tail_2",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce_interrupt/particle_tail_end"}
    execute if score @s aj.roundforce_interrupt.frame matches 36 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce_interrupt/particle_tail_end"}
    execute if score @s aj.roundforce_interrupt.frame matches 51 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce_interrupt.frame matches 83 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.roundforce_interrupt.frame matches 83 run function mhdp_monster_dino:core/tick/animation/event/roundforce_interrupt/end
