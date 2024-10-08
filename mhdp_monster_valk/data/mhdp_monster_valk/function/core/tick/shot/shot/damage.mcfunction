#> mhdp_monster_valk:core/tick/shot/flame/damage
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 既に実行済みの場合、スキップ
    execute if entity @s[tag=Death] run return 0

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Shot"}]
    scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^ ^ as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..2.5] run tag @s add Temp.Hit
        execute if entity @e[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @e[tag=Temp.Victim] as @e[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle explosion ^ ^ ^ 0.8 0.8 0.8 0 6
    # particle gust_emitter_large ^ ^ ^ 0.3 0.3 0.3 0 1
    execute rotated ~ 0 run summon text_display ^ ^ ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,5f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
    tag @s add Death
    kill @s
