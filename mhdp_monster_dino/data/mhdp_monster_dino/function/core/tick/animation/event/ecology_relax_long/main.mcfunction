#> mhdp_monster_dino:core/tick/animation/event/ecology_relax_long/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 効果音
    execute if score @s aj.ecology_relax_long.frame matches 25 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.ecology_relax_long.frame matches 113 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.ecology_relax_long.frame matches 178 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

    execute if score @s aj.ecology_relax_long.frame matches 49 run playsound block.chain.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.ecology_relax_long.frame matches 49..50 run playsound block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.ecology_relax_long.frame matches 49..52 run playsound block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.ecology_relax_long.frame matches 65 run playsound block.chain.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.ecology_relax_long.frame matches 65..66 run playsound block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.ecology_relax_long.frame matches 65..72 run playsound block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.ecology_relax_long.frame matches 86 run playsound block.chain.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.ecology_relax_long.frame matches 86..87 run playsound block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.ecology_relax_long.frame matches 86..91 run playsound block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.ecology_relax_long.frame matches 120 run playsound entity.hoglin.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8

    execute if score @s aj.ecology_relax_long.frame matches 50..52 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"particle block{block_state:\"minecraft:sand\"} ~ ~0.5 ~ 1 0.1 1 0 8"}
    execute if score @s aj.ecology_relax_long.frame matches 50..52 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"particle crit ~ ~0.5 ~ 0.6 0.1 0.6 0.1 3"}
    execute if score @s aj.ecology_relax_long.frame matches 66..72 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"particle block{block_state:\"minecraft:sand\"} ~ ~0.5 ~ 1 0.1 1 0 8"}
    execute if score @s aj.ecology_relax_long.frame matches 66..72 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"particle crit ~ ~0.5 ~ 0.6 0.1 0.6 0.1 3"}
    execute if score @s aj.ecology_relax_long.frame matches 87..91 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"particle block{block_state:\"minecraft:sand\"} ~ ~0.5 ~ 1 0.1 1 0 8"}
    execute if score @s aj.ecology_relax_long.frame matches 87..91 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"particle crit ~ ~0.5 ~ 0.6 0.1 0.6 0.1 3"}
    
# 終了
    execute if score @s aj.ecology_relax_long.frame matches 179 run function mhdp_monster_dino:core/tick/animation/event/ecology_relax_long/end
