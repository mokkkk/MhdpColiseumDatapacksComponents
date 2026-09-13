#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/main
#
# アニメーションイベントハンドラ 翼槍叩きつけ 連携 (左→右)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_vertical_l_to_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.lance_vertical_l_to_r.frame matches 5..14 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.lance_vertical_l_to_r.frame matches 1..8 if entity @n[tag=Mns.Target.Valk,distance=..9] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_vertical_l_to_r.frame matches 9..15 unless entity @n[tag=Mns.Target.Valk,distance=..12] at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.lance_vertical_l_to_r.frame matches 16..20 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.lance_vertical_l_to_r.frame matches 52..62 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 63..68 at @s run tp @s ^ ^ ^-0.05

# 効果音
    execute if score @s aj.lance_vertical_l_to_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 9 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l_to_r.frame matches 9 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l_to_r.frame matches 47 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 68 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_l_to_r.frame matches 68 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_l_to_r.frame matches 81 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 96 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_l_to_r.frame matches 11..20 run function animated_java_valk:valk/at_locator {name:"pos_wing_r_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/particle"}

# 演出
    execute if score @s aj.lance_vertical_l_to_r.frame matches 11 run data modify storage api: Arg.Override set value {Scale:8}
    execute if score @s aj.lance_vertical_l_to_r.frame matches 11 positioned ^2 ^1 ^-6 run function api:object/summon.m {ObjectId:10047}

# 攻撃 (翼槍振り下ろし・右翼爪・振り下ろし中〜着弾まで)
    execute if score @s aj.lance_vertical_l_to_r.frame matches 14 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Vertical.Right"}]
    execute if score @s aj.lance_vertical_l_to_r.frame matches 14..21 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/attack_swing
    execute if score @s aj.lance_vertical_l_to_r.frame matches 20 positioned ^-1.2 ^1 ^7 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/attack
    execute if score @s aj.lance_vertical_l_to_r.frame matches 24 positioned ^-1.2 ^1 ^7 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/particle_ring
    execute if score @s aj.lance_vertical_l_to_r.frame matches 24 run function mhdp_monsters:core/util/tick/event/end_attack

# モデル演出
    execute if score @s aj.lance_vertical_l_to_r.frame matches 10 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.lance_vertical_l_to_r.frame matches 32 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態更新 (相殺アニメ分岐用)
    execute if score @s aj.lance_vertical_l_to_r.frame matches 18 run tag @s add Mns.Valk.State.Attack.Wing.R
    execute if score @s aj.lance_vertical_l_to_r.frame matches 23 run tag @s remove Mns.Valk.State.Attack.Wing.R

# 終了
    execute if score @s aj.lance_vertical_l_to_r.frame matches 95 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/end
