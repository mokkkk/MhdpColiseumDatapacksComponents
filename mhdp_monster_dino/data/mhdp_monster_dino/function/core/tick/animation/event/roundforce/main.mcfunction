#> mhdp_monster_dino:core/tick/animation/event/roundforce/main
#
# アニメーションイベントハンドラ 大回転斬り
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.roundforce.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/roundforce/turn_start
    execute if score @s aj.roundforce.frame matches 10 run function mhdp_monster_dino:core/tick/animation/event/roundforce/turn_start
    execute if score @s aj.roundforce.frame matches 20 run function mhdp_monster_dino:core/tick/animation/event/roundforce/turn_start
    execute if score @s aj.roundforce.frame matches 30 run function mhdp_monster_dino:core/tick/animation/event/roundforce/turn_start
    execute if score @s aj.roundforce.frame matches 40 run function mhdp_monster_dino:core/tick/animation/event/roundforce/turn_start
    execute if score @s aj.roundforce.frame matches 50 run function mhdp_monster_dino:core/tick/animation/event/roundforce/turn_start
    execute if score @s aj.roundforce.frame matches 1..60 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.roundforce.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.roundforce.frame matches 81..86 at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.roundforce.frame matches 87..96 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.roundforce.frame matches 97..105 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.roundforce.frame matches 106..115 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.roundforce.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.roundforce.frame matches 80 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.roundforce.frame matches 80 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.roundforce.frame matches 81..94 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.roundforce.frame matches 12 run playsound minecraft:item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.roundforce.frame matches 12 run playsound minecraft:item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 12..55 run playsound minecraft:block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 56..76 run playsound minecraft:block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.roundforce.frame matches 12..76 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.2 0.6 0.2
    execute if score @s aj.roundforce.frame matches 16..76 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/roundforce/m.particle_head with entity @s data.locators.pos_head
    execute if score @s aj.roundforce.frame matches 80 run playsound block.chain.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 80 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 80 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce.frame matches 80 run playsound minecraft:entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce.frame matches 80 run playsound minecraft:entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 82 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.roundforce.frame matches 85 run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack
    execute if score @s aj.roundforce.frame matches 80..90 run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.roundforce.frame matches 159 run function mhdp_monster_dino:core/tick/animation/event/roundforce/end
