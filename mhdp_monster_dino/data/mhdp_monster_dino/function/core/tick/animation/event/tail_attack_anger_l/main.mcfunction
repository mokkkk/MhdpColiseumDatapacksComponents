#> mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/main
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.tail_attack_anger_l.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/turn_start
    execute if score @s aj.tail_attack_anger_l.frame matches 10 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/turn_start
    execute if score @s aj.tail_attack_anger_l.frame matches 1..18 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.tail_attack_anger_l.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.tail_attack_anger_l.frame matches 16..25 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.tail_attack_anger_l.frame matches 75..84 at @s run tp @s ^ ^ ^-0.12

# 効果音
    execute if score @s aj.tail_attack_anger_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_anger_l.frame matches 16 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_anger_l.frame matches 26 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_anger_l.frame matches 26 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.tail_attack_anger_l.frame matches 30..34 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_attack_anger_l.frame matches 30..34 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.tail_attack_anger_l.frame matches 30..31 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_attack_anger_l.frame matches 30..31 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.tail_attack_anger_l.frame matches 57 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_anger_l.frame matches 73..82 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_anger_l.frame matches 75 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.tail_attack_anger_l.frame matches 75 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_attack_anger_l.frame matches 84 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_anger_l.frame matches 114 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.tail_attack_anger_l.frame matches 21..27 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/attack_tail
    execute if score @s aj.tail_attack_anger_l.frame matches 26 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/attack
    execute if score @s aj.tail_attack_anger_l.frame matches 75..85 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/attack_tail_back

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_attack_anger_l.frame matches 26 run function mhdp_monster_dino:core/util/phase/tail_heat
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_attack_anger_l.frame matches 75 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.tail_attack_anger_l.frame matches 114 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_anger_l/end
