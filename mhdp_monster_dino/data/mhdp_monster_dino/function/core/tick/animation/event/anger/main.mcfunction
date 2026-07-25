#> mhdp_monster_dino:core/tick/animation/event/anger/main
#
# アニメーションイベントハンドラ 怒り開始
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.anger.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 7 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 7 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.anger.frame matches 7 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.anger.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.anger.frame matches 16 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30

    execute if score @s aj.anger.frame matches 97 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 97 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.anger.frame matches 97 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.anger.frame matches 37..47 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.anger.frame matches 44..80 run particle block{block_state:"minecraft:sand"} ^ ^ ^8 2 0.1 2 0 10

    execute if score @s aj.anger.frame matches 25 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.angry master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

    execute if score @s aj.anger.frame matches 39..75 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.3 0.8 0.3
    execute if score @s aj.anger.frame matches 39..75 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.3 0.65 0.3
    execute if score @s aj.anger.frame matches 39..75 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.3 0.5 0.3
    execute if score @s aj.anger.frame matches 39..60 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_air master @s ^ ^1 ^1 0.6 0.8 0.6
    execute if score @s aj.anger.frame matches 39..40 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground_heavy master @s ^ ^1 ^1 0.6 0.6 0.6
    execute if score @s aj.anger.frame matches 39..40 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground_heavy master @s ^ ^1 ^1 0.6 0.5 0.6

    execute if score @s aj.anger.frame matches 8 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/anger/particle_tail"} 
    execute if score @s aj.anger.frame matches 35..45 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/anger/particle_tail"} 
    execute if score @s aj.anger.frame matches 39..75 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/anger/particle_head"} 

# 攻撃
    execute if score @s aj.anger.frame matches 40 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/anger/attack"}

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.anger.frame matches 105 run function mhdp_monster_dino:core/tick/animation/event/anger/end
