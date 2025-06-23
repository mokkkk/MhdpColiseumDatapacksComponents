#> mhdp_items:weapons/short_sword/type_tec/21_jumpslash/main
#
# 駆け上がり斬り メイン処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"駆け上がり斬り"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/animation_3
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/animation_4
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/animation_5

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/attack

# 効果音・パーティクル
    execute if score @s Wpn.AnimationTimer matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.AnimationTimer matches 6 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 8 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 7 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/particle
    execute if score @s Wpn.AnimationTimer matches 7 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/particle

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 60 run function api:weapon_operation/attribute_reset
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/move
    execute if score @s Wpn.GeneralTimer matches 8 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 8 run scoreboard players set $strength player_motion.api.launch 10000
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ -90 run function player_motion:api/launch_looking

# 状態更新
    execute if score @s Wpn.GeneralTimer matches 8 run tag @s add Ply.Ope.IsAir

# 遷移
    # 右クリック：フォールバッシュに移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/22_fall/start

# 終了
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/end
    execute if score @s Wpn.GeneralTimer matches 80.. run function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/end
