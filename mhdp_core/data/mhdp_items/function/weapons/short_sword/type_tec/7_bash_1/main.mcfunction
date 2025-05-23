#> mhdp_items:weapons/short_sword/type_tec/7_bash_1/main
#
# 盾攻撃 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"盾攻撃コンボ・１"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..2 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_2
    execute if score @s Wpn.AnimationTimer matches 5..6 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/animation_4
    execute if score @s Wpn.AnimationTimer matches 4 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..7 run tp @s ~ ~ ~ ~1.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 7 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 7 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength delta.api.launch 1200
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function delta:api/launch_looking
    
# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/a

# 遷移
     # スニーク+ジャンプ時：バックステップに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartJump] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/change_to_backstep
    # スニーク＋右クリック：バックナックルに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/change_to_bash_2

# 終了
    execute if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/end
