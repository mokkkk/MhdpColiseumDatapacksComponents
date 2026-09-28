#> mhdp_monster_valk:core/tick/animation/event/ecology_relax/main
#
# アニメーションイベントハンドラ 生態行動 (未発見時)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 効果音
    execute if score @s aj.ecology_relax.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.ecology_relax.frame matches 20 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.ecology_relax.frame matches 20 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.ecology_relax.frame matches 100 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

    execute if score @s aj.ecology_relax.frame matches 47..48 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.ecology_relax.frame matches 47 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.ecology_relax.frame matches 76..77 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.ecology_relax.frame matches 76 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4

# 終了
    execute if score @s aj.ecology_relax.frame matches 105 run function mhdp_monster_valk:core/tick/animation/event/ecology_relax/end
