#> mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/main
#
# アニメーションイベントハンドラ 翼叩きつけ (右)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_vertical_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.shoot_vertical_r.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.shoot_vertical_r.frame matches 21 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.shoot_vertical_r.frame matches 2..30 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.shoot_vertical_r.frame matches 1..19 if entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.shoot_vertical_r.frame matches 6..19 unless entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.shoot_vertical_r.frame matches 20..30 unless entity @n[tag=Mns.Target.Valk,distance=..11] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.shoot_vertical_r.frame matches 45..51 run tp @s ~ ~ ~ ~-2 ~
    execute if score @s aj.shoot_vertical_r.frame matches 78..84 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.shoot_vertical_r.frame matches 85..90 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.shoot_vertical_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2..3 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_vertical_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_vertical_r.frame matches 29 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 29 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 29 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.shoot_vertical_r.frame matches 29 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_r.frame matches 42 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 48 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_r.frame matches 77 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_vertical_r.frame matches 94 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.shoot_vertical_r.frame matches 94 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 107 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_vertical_r.frame matches 45..53 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/particle

# 演出
    execute if score @s aj.shoot_vertical_r.frame matches 53 run data modify storage api: Arg.Override set value {Scale:6}
    execute if score @s aj.shoot_vertical_r.frame matches 53 positioned ^-3 ^0 ^14 run function api:object/summon.m {ObjectId:10047}

# 攻撃1 (お手・相殺不可のため start_attack は挟まない)
    execute if score @s aj.shoot_vertical_r.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/attack_hand

# 攻撃2 (翼叩きつけ・振り下ろし中〜着弾まで)
    execute if score @s aj.shoot_vertical_r.frame matches 47 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"VerticalS.Right"}]
    execute if score @s aj.shoot_vertical_r.frame matches 47..50 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/attack_swing
    execute if score @s aj.shoot_vertical_r.frame matches 51 positioned ^-3 ^1 ^9 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/attack
    execute if score @s aj.shoot_vertical_r.frame matches 53 positioned ^-3 ^1 ^9 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/particle_ring
    execute if score @s aj.shoot_vertical_r.frame matches 53 run function mhdp_monsters:core/util/tick/event/end_attack

# モデル演出
    execute if score @s aj.shoot_vertical_r.frame matches 42 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.shoot_vertical_r.frame matches 70 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態更新 (相殺アニメ分岐用)
    execute if score @s aj.shoot_vertical_r.frame matches 48 run tag @s add Mns.Valk.State.Attack.Wing.R
    execute if score @s aj.shoot_vertical_r.frame matches 53 run tag @s remove Mns.Valk.State.Attack.Wing.R

# 終了
    execute if score @s aj.shoot_vertical_r.frame matches 114 run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/end
