#> mhdp_items:sp_items/immovable_cloth/util/interrupt
#
# 特殊装具の割り込み処理
#
# @within function mhdp_items:core/switch/item/init

# attribute初期化
    # 無し

# タグ消去
    tag @s remove Itm.Sp.ImmovableCloth.Using

# スコア削除
    scoreboard players set @s Itm.ImmovableCloth.GeneralTimer 0
