#> mhdp_monster_dino:core/tick/animation/event/polish/main
#
# アニメーションイベントハンドラ 研ぎ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.polish.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.polish.frame matches 16 run playsound minecraft:item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.polish.frame matches 16..65 run playsound minecraft:block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.polish.frame matches 66 run playsound minecraft:entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.polish.frame matches 16..65 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/polish/m.particle_head with entity @s data.locators.pos_head
    execute if score @s aj.polish.frame matches 78..105 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/polish/m.particle_head_flame with entity @s data.locators.pos_head
    execute if score @s aj.polish.frame matches 115 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.polish.frame matches 66 run function mhdp_monster_dino:core/util/models/rust_end
    execute if score @s aj.polish.frame matches 78 run function mhdp_monster_dino:core/util/models/charge_start

# 終了
    execute if score @s aj.polish.frame matches 127 run function mhdp_monster_dino:core/tick/animation/event/polish/end
