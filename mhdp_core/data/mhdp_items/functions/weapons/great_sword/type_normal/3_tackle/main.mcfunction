#> mhdp_items:weapons/great_sword/type_normal/3_tackle/main
#
# タックル メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.hoglin.step master @a ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_normal/3_tackle/animation_0

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1..20 run effect give @s slowness 1 5 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking

# 遷移
    # 右クリック中の場合、溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 10.. run function mhdp_items:weapons/great_sword/type_normal/3_tackle/change_to_charge

# 終了
    execute if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/great_sword/type_normal/3_tackle/end
