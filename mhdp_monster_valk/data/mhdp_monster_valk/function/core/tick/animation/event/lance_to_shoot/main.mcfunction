#> mhdp_monster_valk:core/tick/animation/event/lance_to_shoot/main
#
# アニメーションイベントハンドラ 変形・彗龍→龍気
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_to_shoot.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_to_shoot.frame matches 8 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_to_shoot.frame matches 8 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_to_shoot.frame matches 8 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.8
    execute if score @s aj.lance_to_shoot.frame matches 8 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
    
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.lance_to_shoot.frame matches 2 run tag @s add Mns.Valk.State.IsShoot

# 終了
    execute if score @s aj.lance_to_shoot.frame matches 30 run function mhdp_monster_valk:core/tick/animation/event/lance_to_shoot/end
