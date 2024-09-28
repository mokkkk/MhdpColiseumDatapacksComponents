#> mhdp_items:weapons/bow/type_tec/2_shot_normal/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/2_shot_normal/main

# 矢を召喚
    summon item_display ^ ^ ^ {teleport_duration:3,Tags:["Other.Shot","Wpn.Bw.Shot.Normal","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},item:{id:"minecraft:air",count:1}}
    tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal] ~ ~ ~ ~ ~

# データ設定
    scoreboard players operation @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal] Wpn.Bw.ChargeCount = @s Wpn.Bw.ChargeCount

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal] remove Start

# 命中判定
    # execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    # execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    # execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    # execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    # execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    # execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    # data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Normal.1
    # execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    # tag @e[tag=Temp.Hit] remove Temp.Hit
