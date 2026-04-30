#> mhdp_items:weapons/lance/type_tec/18_dash/main
#
# 突進 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches 7.. run scoreboard players set @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# 演出
    playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    particle block{block_state:"minecraft:sand"} ^ ^0.1 ^ 0.2 0.2 0.2 0 2
    particle cloud ^ ^0.1 ^ 0.2 0.2 0.2 0.05 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/18_dash/animation_3
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_tec/18_dash/animation_2

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/lance/type_tec/18_dash/attack
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/lance/type_tec/18_dash/attack

# 移動
    execute if entity @s[nbt={OnGround:1b}] if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[nbt={OnGround:1b}] if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[nbt={OnGround:1b}] if score @s Wpn.GeneralTimer matches 5 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}

# 移動制限
    execute if score @s Wpn.AnimationTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.AnimationTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 15

# 遷移
    # 空中：ジャンプに移行
       execute if entity @s[tag=!Ply.Ope.IsAir,nbt={OnGround:0b}] rotated ~ 0 if block ^ ^-0.5 ^0.3 #mhdp_core:no_collision rotated as @s if score @s Wpn.AnimationTimer matches 5.. run function mhdp_items:weapons/lance/type_tec/18_dash/change_to_jump
    # 左クリックまたはスタミナ切れ：フィニッシュ突きに移行
       execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.AnimationTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/19_finish_spear/start
       execute if score @s Wpn.AnimationTimer matches 3.. if score @s Ply.Stats.Stamina matches ..1 run function mhdp_items:weapons/lance/type_tec/19_finish_spear/start
    # スニーク：ガードに移行
       execute if entity @s[tag=Ply.Ope.StartSneak] if score @s Wpn.AnimationTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/18_dash/change_to_guard

# 終了
    execute if score @s Wpn.AnimationTimer matches 3.. if score @s Ply.Stats.Stamina matches ..1 run function mhdp_items:weapons/lance/type_tec/18_dash/end
