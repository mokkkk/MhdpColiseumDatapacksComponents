#> mhdp_items:sp_items/wirebug/util/interrupt
#
# 特殊装具の割り込み処理
#
# @within function mhdp_items:core/switch/item/init

# 紐づけ対象のマーカーを消去
    function mhdp_items:sp_items/wirebug/using/get_target_marker
    kill @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target]

# タグ消去
    tag @s remove Itm.Sp.Wirebug.Using

# スコア削除
    scoreboard players set @s Itm.Wirebug.GeneralTimer 0
