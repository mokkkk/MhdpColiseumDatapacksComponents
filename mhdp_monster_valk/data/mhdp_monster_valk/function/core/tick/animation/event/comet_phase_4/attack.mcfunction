#> mhdp_monster_valk:core/tick/animation/event/comet_phase_4/attack
#
# アニメーションイベントハンドラ 彗星・着陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Comet"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^3 as @a[tag=Ply.State.EnableDamage,distance=..14] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^-3 as @a[tag=Ply.State.EnableDamage,distance=..14] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^-8 as @a[tag=Ply.State.EnableDamage,distance=..14] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^-13 as @a[tag=Ply.State.EnableDamage,distance=..14] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^-18 as @a[tag=Ply.State.EnableDamage,distance=..14] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        execute if entity @a[tag=Mns.Target.Dino,tag=Temp.Hit] run tag @s add Mns.Temp.IsHit
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..4] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.7
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    playsound item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    playsound item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    playsound item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.8
    particle explosion_emitter ~ ~2 ~ 3 1 3 0 20 force
    particle gust_emitter_large ~ ~2 ~ 3 1 3 0 20 force
    particle large_smoke ~ ~2 ~ 3 1 3 0.1 100 force
    execute positioned ~ ~1 ~ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle_ring
    execute positioned ~ ~2 ~ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle_ring
    execute positioned ~ ~3 ~ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle_ring

    # summon text_display ^ ^1 ^5 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
