#> mhdp_monster_dino:core/tick/animation/event/tail_side_r/main
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.tail_side_r.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/turn_start
    execute if score @s aj.tail_side_r.frame matches 10 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/turn_start
    execute if score @s aj.tail_side_r.frame matches 1..18 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.tail_side_r.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.tail_side_r.frame matches 28..32 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.tail_side_r.frame matches 81..95 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.tail_side_r.frame matches 96..111 at @s run tp @s ^ ^ ^-0.05

# 効果音
    execute if score @s aj.tail_side_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 30..33 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 34 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.tail_side_r.frame matches 36 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.tail_side_r.frame matches 36 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.tail_side_r.frame matches 36 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 36..45 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 71 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 93 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 111 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_side_r.frame matches 34..38 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_side_r.frame matches 34..38 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.tail_side_r.frame matches 34..35 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_side_r.frame matches 34..35 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.tail_side_r.frame matches 32..39 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail
    execute if score @s aj.tail_side_r.frame matches 71 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_side_r.frame matches 32 run function mhdp_monster_dino:core/util/phase/tail_heat
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_side_r.frame matches 71 run function mhdp_monster_dino:core/util/phase/tail_heat

# 状態更新
    execute if score @s aj.tail_side_r.frame matches 18 run tag @s add Mns.Dino.State.Attack.Tail.R
    execute if score @s aj.tail_side_r.frame matches 45 run tag @s remove Mns.Dino.State.Attack.Tail.R

# 終了
    execute if score @s aj.tail_side_r.frame matches 111 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/end
