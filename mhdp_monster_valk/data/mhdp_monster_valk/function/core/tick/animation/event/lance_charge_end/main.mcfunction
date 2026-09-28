#> mhdp_monster_valk:core/tick/animation/event/lance_charge_end/main
#
# アニメーションイベントハンドラ 龍気吸引・終了
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_charge_end.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_charge_end.frame matches 10 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_charge_end.frame matches 10 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_charge_end.frame matches 10 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_charge_end.frame matches 2..20 run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/particle
    execute if score @s aj.lance_charge_end.frame matches 10 run particle explosion ~ ~3 ~ 4 4 4 0 30

# 演出
    execute if score @s aj.lance_charge_end.frame matches 10 run data modify storage api: Arg.Override set value {Scale:7}
    execute if score @s aj.lance_charge_end.frame matches 10 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_1",command:"execute positioned ^ ^ ^-1 run function api:object/summon.m {ObjectId:10047}"}
    execute if score @s aj.lance_charge_end.frame matches 10 run data modify storage api: Arg.Override set value {Scale:7}
    execute if score @s aj.lance_charge_end.frame matches 10 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_1",command:"execute positioned ^ ^ ^-1 run function api:object/summon.m {ObjectId:10047}"}

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# モデル演出
    execute if score @s aj.lance_charge_end.frame matches 2 run function mhdp_monster_valk:core/util/models/chest_glow_end

# 肉質変化
    execute if score @s aj.lance_charge_end.frame matches 2 run function mhdp_monster_valk:core/util/phase/charge_end

# 終了
    execute if score @s aj.lance_charge_end.frame matches 34 run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/end
