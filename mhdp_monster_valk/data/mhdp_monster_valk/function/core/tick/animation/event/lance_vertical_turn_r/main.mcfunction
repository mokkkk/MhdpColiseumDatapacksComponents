#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/main
#
# アニメーションイベントハンドラ 振りむき翼槍叩きつけ (右)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_vertical_turn_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:5,MaxRotation:360}
    execute if score @s aj.lance_vertical_turn_r.frame matches 30..36 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.lance_vertical_turn_r.frame matches 33 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:360}
    execute if score @s aj.lance_vertical_turn_r.frame matches 37..40 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.lance_vertical_turn_r.frame matches 1..10 if entity @n[tag=Mns.Target.Valk,distance=..12] at @s run tp @s ^ ^ ^0.25
    execute if score @s aj.lance_vertical_turn_r.frame matches 31..33 at @s run tp @s ^0.3 ^ ^0.3
    execute if score @s aj.lance_vertical_turn_r.frame matches 37..48 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.lance_vertical_turn_r.frame matches 80..90 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_vertical_turn_r.frame matches 91..96 at @s run tp @s ^ ^ ^-0.05

# 効果音
    execute if score @s aj.lance_vertical_turn_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_turn_r.frame matches 5 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_turn_r.frame matches 31 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_turn_r.frame matches 31 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_turn_r.frame matches 31..32 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_vertical_turn_r.frame matches 31..32 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_vertical_turn_r.frame matches 31..32 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.lance_vertical_turn_r.frame matches 31 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_vertical_turn_r.frame matches 31 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_vertical_turn_r.frame matches 48 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_turn_r.frame matches 75 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_turn_r.frame matches 96 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_vertical_turn_r.frame matches 96 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_vertical_turn_r.frame matches 109 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_turn_r.frame matches 124 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_vertical_turn_r.frame matches 39..48 run function animated_java_valk:valk/at_locator {name:"pos_wing_r_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/particle"}

# 攻撃 (翼槍振り下ろし・右翼爪・振り下ろし中〜着弾まで)
    execute if score @s aj.lance_vertical_turn_r.frame matches 42 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Vertical.Right"}]
    execute if score @s aj.lance_vertical_turn_r.frame matches 42..49 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/attack_swing
    execute if score @s aj.lance_vertical_turn_r.frame matches 48 positioned ^-1.2 ^1 ^7 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/attack
    execute if score @s aj.lance_vertical_turn_r.frame matches 52 positioned ^-1.2 ^1 ^7 rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/particle_ring
    execute if score @s aj.lance_vertical_turn_r.frame matches 52 run function mhdp_monsters:core/util/tick/event/end_attack

# モデル演出
    execute if score @s aj.lance_vertical_turn_r.frame matches 3 run function mhdp_monster_valk:core/util/models/ignite_start_right
    execute if score @s aj.lance_vertical_turn_r.frame matches 65 run function mhdp_monster_valk:core/util/models/ignite_end_right

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 2連 (怒り時)
    execute if entity @s[tag=Mns.State.IsAnger] if score @s aj.lance_vertical_turn_r.frame matches 65 run function animated_java_valk:valk/animations/lance_vertical_r_to_l/tween {duration:1, to_frame: 1}

# 状態更新 (相殺アニメ分岐用)
    execute if score @s aj.lance_vertical_turn_r.frame matches 45 run tag @s add Mns.Valk.State.Attack.Wing.R
    execute if score @s aj.lance_vertical_turn_r.frame matches 50 run tag @s remove Mns.Valk.State.Attack.Wing.R

# 終了
    execute if score @s aj.lance_vertical_turn_r.frame matches 124 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/end
