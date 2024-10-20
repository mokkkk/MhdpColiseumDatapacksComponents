#> mhdp_items:sp_items/immovable_cloth/util/reset
#
# 特殊装具のリセット処理
#
# @within function mhdp_items:core/switch/item/init

# タグ消去
    tag @s remove Itm.Sp.ImmovableCloth
    tag @s remove Itm.Sp.ImmovableCloth.Using

# スコア削除
    scoreboard players reset @s Itm.ImmovableCloth.GeneralTimer
    scoreboard players reset @s Itm.ImmovableCloth.CoolTime

# attribute初期化
    # 無し

# 防具消去
    clear @s *[custom_data~{Immovable:1b}]
