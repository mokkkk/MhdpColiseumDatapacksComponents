#> mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Upper"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    execute positioned ^ ^ ^ run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub
    execute positioned ^ ^ ^5 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub
    execute positioned ^ ^ ^10 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub
    execute positioned ^ ^ ^15 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub
    execute positioned ^ ^ ^20 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub
    execute positioned ^ ^ ^25 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub

# 演出
    execute at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.wither.break_block master @s ^ ^1 ^1 0.4 0.8 0.4
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
