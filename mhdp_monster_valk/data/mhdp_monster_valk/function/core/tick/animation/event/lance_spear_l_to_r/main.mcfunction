#> mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_spear_l_to_r.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/turn_start
    execute if score @s aj.lance_spear_l_to_r.frame matches 11 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/turn_start_adjust
    execute if score @s aj.lance_spear_l_to_r.frame matches 2..20 run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.lance_spear_l_to_r.frame matches 44 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/turn_start_adjust
    execute if score @s aj.lance_spear_l_to_r.frame matches 44..54 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.lance_spear_l_to_r.frame matches 1..4 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-1
    execute if score @s aj.lance_spear_l_to_r.frame matches 5..8 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_spear_l_to_r.frame matches 30..38 unless entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^0.3

# 効果音
    execute if score @s aj.lance_spear_l_to_r.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_spear_l_to_r.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_spear_l_to_r.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.lance_spear_l_to_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_spear_l_to_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    
    execute if score @s aj.lance_spear_l_to_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_spear_l_to_r.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_spear_l_to_r.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_spear_l_to_r.frame matches 13 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_spear_l_to_r.frame matches 38 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_spear_l_to_r.frame matches 62 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_spear_l_to_r.frame matches 67 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_spear_l_to_r.frame matches 87 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_spear_l_to_r.frame matches 33..38 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle with entity @s data.locators.pos_wing_l_0
    execute if score @s aj.lance_spear_l_to_r.frame matches 57..62 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle with entity @s data.locators.pos_wing_r_0
    execute if score @s aj.lance_spear_l_to_r.frame matches 35..37 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle_ring with entity @s data.locators.pos_wing_l_2
    execute if score @s aj.lance_spear_l_to_r.frame matches 59..61 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/m.particle_ring with entity @s data.locators.pos_wing_r_2

    execute if score @s aj.lance_spear_l_to_r.frame matches 47 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_spear_l_to_r.frame matches 47 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_spear_l_to_r.frame matches 47 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_spear_l_to_r.frame matches 47 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.lance_spear_l_to_r.frame matches 70 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_spear_l_to_r.frame matches 70 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_spear_l_to_r.frame matches 70 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_spear_l_to_r.frame matches 70 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

# 攻撃
    execute if score @s aj.lance_spear_l_to_r.frame matches 38 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/attack_l
    execute if score @s aj.lance_spear_l_to_r.frame matches 42 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.lance_spear_l_to_r.frame matches 62 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/attack_r
    execute if score @s aj.lance_spear_l_to_r.frame matches 66 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8

# モデル演出
    execute if score @s aj.lance_spear_l_to_r.frame matches 10 run function mhdp_monster_valk:core/util/models/ignite_start_left
    execute if score @s aj.lance_spear_l_to_r.frame matches 47 run function mhdp_monster_valk:core/util/models/ignite_end_left
    execute if score @s aj.lance_spear_l_to_r.frame matches 47 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.lance_spear_l_to_r.frame matches 72 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_spear_l_to_r.frame matches 106 run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/end
