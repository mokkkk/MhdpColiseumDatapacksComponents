#> mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/main
#
# 気刃兜割 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.helmbreaker"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.GeneralTimer matches 8 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/animation_1
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/animation_2
    execute if score @s Wpn.GeneralTimer matches 1001 run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/animation_4
    execute if score @s Wpn.GeneralTimer matches 1002 run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/animation_5

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 1001 run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/move
    execute if score @s Wpn.GeneralTimer matches 8 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ -90 run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 996 rotated ~ 90 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}

# 着地
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Ope.IsAir
    execute if score @s Wpn.GeneralTimer matches 8 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 25..994 run scoreboard players set @s Wpn.GeneralTimer 995
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 10..999 run scoreboard players set @s Wpn.GeneralTimer 1000

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..45 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 1..1019 run function mhdp_items:core/buffering/b
    # execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..45 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 1..1019 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 右クリック：練気解放無双斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 1018..1019 if score @s Wpn.Ls.SpiritLevel matches 2.. run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/start
    # # ジャンプ回避
    #     execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/short_sword/util/move_jump

# 終了
    execute if score @s Wpn.GeneralTimer matches 1020.. run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/end
