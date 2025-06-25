#> mhdp_items:weapons/short_sword/type_tec/12_backstep/main
#
# バックステップ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"バックステップ"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.AnimationTimer matches 10 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 10 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/12_backstep/animation_0
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/12_backstep/animation_1

# 演出
    execute if score @s Wpn.GeneralTimer matches 22 run playsound entity.experience_orb.pickup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 22 positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.5 0 0 0 0 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 無敵時間
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set @s Ply.Timer.Avoid 5

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 7500
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~-180 -30 run function player_motion:api/launch_looking

# 先行入力
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 2..20 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 2..20 if score @s Ply.Stats.Arts.2 >= @s Ply.Stats.Arts.2.Max run function mhdp_items:core/buffering/b

# 遷移
    # 無操作：突進斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.Buffering.A,tag=!Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 16..21 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/start
    # 右クリック短押し：飛び込み斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/13_just_1/start
    # スニーク+右クリック同時押し：ブレイドダンスに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/start
    # 右クリック長押し：溜め斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 22.. run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/start
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 49.. run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 50.. run function mhdp_items:weapons/short_sword/type_tec/12_backstep/end
