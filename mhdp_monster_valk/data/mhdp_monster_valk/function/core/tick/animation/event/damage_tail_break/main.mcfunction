#> mhdp_monster_dino:core/tick/animation/event/damage_tail_break/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_tail_break.frame matches 2..8 at @s run tp @s ^ ^ ^0.7 ~2 ~
    execute if score @s aj.damage_tail_break.frame matches 9..15 at @s run tp @s ^ ^ ^0.4 ~5 ~
    execute if score @s aj.damage_tail_break.frame matches 19..29 at @s run tp @s ^0.1 ^ ^ ~1 ~
    execute if score @s aj.damage_tail_break.frame matches 30..39 at @s run tp @s ^0.2 ^ ^ ~ ~
    execute if score @s aj.damage_tail_break.frame matches 51..65 at @s run tp @s ^ ^ ^ ~1 ~
    execute if score @s aj.damage_tail_break.frame matches 66..77 at @s run tp @s ^0.1 ^ ^ ~4 ~
    execute if score @s aj.damage_tail_break.frame matches 78..85 at @s run tp @s ^ ^ ^ ~1 ~

# 効果音
    execute if score @s aj.damage_tail_break.frame matches 2..4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_tail_break.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_tail_break.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.damage_tail_break.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_tail_break.frame matches 18 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.damage_tail_break.frame matches 18 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_tail_break.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_tail_break.frame matches 40 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_tail_break.frame matches 40 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.damage_tail_break.frame matches 50 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_tail_break.frame matches 65 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_tail_break.frame matches 77 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.damage_tail_break.frame matches 77 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_tail_break.frame matches 95..100 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_tail_break.frame matches 95..100 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.damage_tail_break.frame matches 95..96 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_tail_break.frame matches 95..96 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.damage_tail_break.frame matches 119 run function mhdp_monster_dino:core/tick/animation/event/damage_tail_break/end
