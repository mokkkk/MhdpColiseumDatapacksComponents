#> mhdp_items:weapons/bow/type_tec/4_charge_step/main
#
# チャージステップ メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..5 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1..7 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/4_charge_step/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_tec/4_charge_step/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_tec/4_charge_step/animation_2

# 演出
    # execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    # execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/bow/type_tec/4_charge_step/move

# 遷移
    # 右クリック押し続け：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 8.. run function mhdp_items:weapons/bow/type_tec/4_charge_step/change_to_charge
    # 無操作：射撃に移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 8.. run function mhdp_items:weapons/bow/type_tec/4_charge_step/change_to_shot

# 終了
    execute if score @s Wpn.GeneralTimer matches 21.. run function mhdp_items:weapons/bow/type_tec/4_charge_step/end
