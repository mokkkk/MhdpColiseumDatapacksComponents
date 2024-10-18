#> mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/main
#
# アニメーションイベントハンドラ 尻尾攻撃・飛びかかり
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.jump_tail_anger_r.frame matches 2 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/turn_start
    execute if score @s aj.jump_tail_anger_r.frame matches 12 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/turn_start
    execute if score @s aj.jump_tail_anger_r.frame matches 30 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/turn_start
    execute if score @s aj.jump_tail_anger_r.frame matches 58 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/turn_start
    execute if score @s aj.jump_tail_anger_r.frame matches 1..22 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.jump_tail_anger_r.frame matches 30..35 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.jump_tail_anger_r.frame matches 58..66 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.jump_tail_anger_r.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.jump_tail_anger_r.frame matches 23 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/move_start
    execute if score @s aj.jump_tail_anger_r.frame matches 24..37 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s aj.jump_tail_anger_r.frame matches 60..73 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.4

# 効果音
    execute if score @s aj.jump_tail_anger_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 19 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 64 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 77 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 19 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.jump_tail_anger_r.frame matches 37 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.jump_tail_anger_r.frame matches 37 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 40 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 59 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 69 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 98 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 109 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 43..48 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 43..45 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 72..77 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 72..74 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.jump_tail_anger_r.frame matches 37..44 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail
    execute if score @s aj.jump_tail_anger_r.frame matches 43 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack
    execute if score @s aj.jump_tail_anger_r.frame matches 66..73 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail
    execute if score @s aj.jump_tail_anger_r.frame matches 72 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.jump_tail_anger_r.frame matches 24 run tag @s add Mns.State.IsFlying
    execute if score @s aj.jump_tail_anger_r.frame matches 37 run tag @s remove Mns.State.IsFlying

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.jump_tail_anger_r.frame matches 43 run function mhdp_monster_dino:core/util/phase/tail_heat
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.jump_tail_anger_r.frame matches 72 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.jump_tail_anger_r.frame matches 156 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/end
