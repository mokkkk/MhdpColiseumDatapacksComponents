#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_l/main
#
# アニメーションイベントハンドラ 薙ぎ払い・怒り時 (左)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.shoot_sweep_anger_l.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2..20 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.shoot_sweep_anger_l.frame matches 49..57 run tp @s ~ ~ ~ ~8 ~

# 効果音
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_sweep_anger_l.frame matches 48 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_sweep_anger_l.frame matches 48 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.shoot_sweep_anger_l.frame matches 48 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_sweep_anger_l.frame matches 50 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.shoot_sweep_anger_l.frame matches 50 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.shoot_sweep_anger_l.frame matches 50 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.shoot_sweep_anger_l.frame matches 79 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_sweep_anger_l.frame matches 2 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.shoot_sweep_anger_l.frame matches 28..47 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_l/particle

# 攻撃
    execute if score @s aj.shoot_sweep_anger_l.frame matches 49 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Sweep.Anger.Left"}]
    execute if score @s aj.shoot_sweep_anger_l.frame matches 49..57 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_l/attack
    execute if score @s aj.shoot_sweep_anger_l.frame matches 57 run function mhdp_monsters:core/util/tick/event/end_attack
    execute if score @s aj.shoot_sweep_anger_l.frame matches 49..53 run particle block{block_state:"minecraft:sand"} ^3 ^ ^8 2 0.1 2 0 10
    execute if score @s aj.shoot_sweep_anger_l.frame matches 54..57 run particle block{block_state:"minecraft:sand"} ^ ^ ^8 2 0.1 2 0 10

# モデル演出
    execute if score @s aj.shoot_sweep_anger_l.frame matches 5 run function mhdp_monster_valk:core/util/models/ignite_start_left
    execute if score @s aj.shoot_sweep_anger_l.frame matches 62 run function mhdp_monster_valk:core/util/models/ignite_end_left

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態更新
    execute if score @s aj.shoot_sweep_anger_l.frame matches 45 run tag @s add Mns.Valk.State.Attack.Wing.L
    execute if score @s aj.shoot_sweep_anger_l.frame matches 60 run tag @s remove Mns.Valk.State.Attack.Wing.L

# 終了
    execute if score @s aj.shoot_sweep_anger_l.frame matches 95 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_l/end
