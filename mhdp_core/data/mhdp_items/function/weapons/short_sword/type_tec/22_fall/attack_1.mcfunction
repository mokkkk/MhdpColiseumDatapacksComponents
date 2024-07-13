#> mhdp_items:weapons/short_sword/type_tec/22_fall/attack_1
#
# フォールバッシュ 攻撃判定
#
# @within function mhdp_items:weapons/short_sword/type_tec/22_fall/main

# 命中判定
    execute anchored eyes positioned ^ ^ ^ run tag @e[type=slime,tag=Mns.HitBox,distance=..3.5] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒット判定
    execute if entity @n[tag=Temp.Victim] run tag @s add Ply.Flag.Hit

# 攻撃
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Fall.High.1
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
