#> mhdp_monster_dino:core/tick/shot/flame/damage
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 既に実行済みの場合、スキップ
    execute if entity @s[tag=Death] run return 0

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailFlame.Flame"}]
    scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..2.5] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^ ^ as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.5] run tag @s add Temp.Hit
        execute if entity @e[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @e[tag=Temp.Victim] as @e[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
