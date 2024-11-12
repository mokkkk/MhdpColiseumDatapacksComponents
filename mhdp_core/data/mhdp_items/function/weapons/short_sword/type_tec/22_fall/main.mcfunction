#> mhdp_items:weapons/short_sword/type_tec/22_fall/main
#
# フォールバッシュ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"フォールバッシュ"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..4 run function mhdp_items:weapons/short_sword/type_tec/22_fall/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/22_fall/animation_1

# 攻撃
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 5..20 run function mhdp_items:weapons/short_sword/type_tec/22_fall/attack_1
# 効果音・パーティクル
    execute if score @s Wpn.AnimationTimer matches 4..59 run particle cloud ~ ~1 ~ 0 0 0 0.05 1
    execute if score @s Wpn.AnimationTimer matches 4 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 2 6 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 5000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -90 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 5 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 5 run scoreboard players set $strength delta.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~ 90 run function delta:api/launch_looking

# 着地
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches ..59 run scoreboard players set @s Wpn.GeneralTimer 60

# 終了
    execute if score @s Wpn.GeneralTimer matches 68.. run function mhdp_items:weapons/short_sword/type_tec/22_fall/end
