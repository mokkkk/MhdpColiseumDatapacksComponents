#> mhdp_monster_valk:core/tick/animation/event/lance_upper_l/main
#
# アニメーションイベントハンドラ 翼槍突き上げ (左)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_upper_l.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.lance_upper_l.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.lance_upper_l.frame matches 2..15 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.lance_upper_l.frame matches 37..44 at @s run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_upper_l.frame matches 37..44 at @s run function mhdp_monsters:core/util/tick/event/turn_to_target_accurate
    execute if score @s aj.lance_upper_l.frame matches 45..50 at @s run tp @s ^ ^ ^ ~0.6 ~

# 移動
    execute if score @s aj.lance_upper_l.frame matches 1..5 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_upper_l.frame matches 6..10 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_upper_l.frame matches 11..19 unless entity @n[tag=Mns.Target.Valk,distance=..8] at @s run tp @s ^ ^ ^0.4 ~-1 ~
    execute if score @s aj.lance_upper_l.frame matches 34..40 at @s run tp @s ^ ^ ^-0.7
    execute if score @s aj.lance_upper_l.frame matches 34..50 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_upper_l.frame matches 51..58 at @s run tp @s ^ ^ ^0.7
    execute if score @s aj.lance_upper_l.frame matches 59..69 at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.lance_upper_l.frame matches 71..85 at @s run tp @s ^ ^ ^0.3

# 効果音
    execute if score @s aj.lance_upper_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_upper_l.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_upper_l.frame matches 20 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_upper_l.frame matches 20 run playsound entity.player.attack.knockback master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.lance_upper_l.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 30
    execute if score @s aj.lance_upper_l.frame matches 30..32 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_upper_l.frame matches 35..40 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    execute if score @s aj.lance_upper_l.frame matches 86 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_upper_l.frame matches 35..49 run function animated_java_valk:valk/at_locator {name:"pos_wing_l_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/particle_charge"}
    execute if score @s aj.lance_upper_l.frame matches 50..67 run function animated_java_valk:valk/at_locator {name:"pos_wing_l_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/particle"}

# 演出 (龍閃 赤フラッシュ・追従/拡大あり。assets:object 10047.valk_red_flash)
    execute if score @s aj.lance_upper_l.frame matches 35 run data modify storage api: Arg.Override set value {IsLong:true,Scale:7}
    execute if score @s aj.lance_upper_l.frame matches 35 positioned ^4 ^ ^-3 run function api:object/summon.m {ObjectId:10047}
    execute if score @s aj.lance_upper_l.frame matches 35..51 run tp @n[type=text_display,tag=10047.Long] ^4 ^2 ^-5
    execute if score @s aj.lance_upper_l.frame matches 51 run kill @e[type=text_display,tag=10047.Long]
    execute if score @s aj.lance_upper_l.frame matches 51 run data modify storage api: Arg.Override set value {Scale:12}
    execute if score @s aj.lance_upper_l.frame matches 51 positioned ^4 ^2 ^-5 run function api:object/summon.m {ObjectId:10047}

# 攻撃1 (お手・相殺不可のため start_attack は挟まない)
    execute if score @s aj.lance_upper_l.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/attack_hand

# 攻撃2 (翼槍突き上げ・相殺不可のため start_attack は挟まない)
    execute if score @s aj.lance_upper_l.frame matches 56 positioned ^1.2 ^1 ^12 rotated ~3 ~ run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/attack

# モデル演出
    execute if score @s aj.lance_upper_l.frame matches 37 run function mhdp_monster_valk:core/util/models/ignite_start_left
    execute if score @s aj.lance_upper_l.frame matches 90 run function mhdp_monster_valk:core/util/models/ignite_end_left

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態更新 (相殺アニメ分岐用)
    execute if score @s aj.lance_upper_l.frame matches 53 run tag @s add Mns.Valk.State.Attack.Wing.L
    execute if score @s aj.lance_upper_l.frame matches 59 run tag @s remove Mns.Valk.State.Attack.Wing.L

# 終了
    execute if score @s aj.lance_upper_l.frame matches 99 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/end
