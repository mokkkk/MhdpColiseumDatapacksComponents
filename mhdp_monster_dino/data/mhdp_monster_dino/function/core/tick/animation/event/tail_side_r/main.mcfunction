#> mhdp_monster_dino:core/tick/animation/event/tail_side_r/main
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.tail_side_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.tail_side_r.frame matches 10 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.tail_side_r.frame matches 2..18 at @s run function mhdp_monsters:core/util/tick/event/alignment

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
    execute if score @s aj.tail_side_r.frame matches 31 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailSide"}]
    execute if score @s aj.tail_side_r.frame matches 32..39 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail_start
    execute if score @s aj.tail_side_r.frame matches 37..39 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail_start
    execute if score @s aj.tail_side_r.frame matches 71 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail_start
    execute if score @s aj.tail_side_r.frame matches 40 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_side_r.frame matches 32 run function mhdp_monster_dino:core/util/phase/tail_heat_check

# 終了
    execute if score @s aj.tail_side_r.frame matches 111 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/end
