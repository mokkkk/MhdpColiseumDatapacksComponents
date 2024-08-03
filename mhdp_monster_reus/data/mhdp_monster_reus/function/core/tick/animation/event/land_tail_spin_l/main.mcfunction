#> mhdp_monster_reus:core/tick/animation/event/land_tail_spin_l/main
#
# アニメーションイベントハンドラ 尻尾回転
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_tail_spin_l.frame matches 25..37 run tp @s ^ ^ ^ ~-12 ~
    execute if score @s aj.land_tail_spin_l.frame matches 38..44 run tp @s ^ ^ ^ ~-3 ~
    execute if score @s aj.land_tail_spin_l.frame matches 70..82 run tp @s ^ ^ ^ ~-12 ~
    execute if score @s aj.land_tail_spin_l.frame matches 84..90 run tp @s ^ ^ ^ ~-3 ~

# 効果音
    execute if score @s aj.land_tail_spin_l.frame matches 25..28 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_tail_spin_l.frame matches 50..53 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_tail_spin_l.frame matches 70..73 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_tail_spin_l.frame matches 25..27 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 1 0.4
    execute if score @s aj.land_tail_spin_l.frame matches 70..72 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 1 0.4
    execute if score @s aj.land_tail_spin_l.frame matches 25 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 1
    execute if score @s aj.land_tail_spin_l.frame matches 70 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 1
    
# 攻撃
    execute if score @s aj.land_tail_spin_l.frame matches 27..39 run function mhdp_monster_reus:core/tick/animation/event/land_tail_spin_l/attack
    execute if score @s aj.land_tail_spin_l.frame matches 72..84 run function mhdp_monster_reus:core/tick/animation/event/land_tail_spin_l/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_tail_spin_l.frame matches 117 run function mhdp_monster_reus:core/tick/animation/event/land_tail_spin_l/end
