#> mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/attack
#
# アニメーションイベントハンドラ 尻尾攻撃・飛びかかり
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# データ読み込み
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailJump"}]
    execute if entity @s[tag=Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailJump.Heat"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^7 as @a[tag=Ply.State.EnableDamage,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^9 as @a[tag=Ply.State.EnableDamage,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^11 as @a[tag=Ply.State.EnableDamage,distance=..2.6] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        # execute positioned ^ ^1 ^7 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^7 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^9 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^11 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    execute positioned ^ ^1 ^7 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/attack_particle
    execute positioned ^ ^1 ^9 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/attack_particle
    execute positioned ^ ^1 ^11 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/attack_particle
    playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound entity.iron_golem.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.iron_golem.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.57

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
