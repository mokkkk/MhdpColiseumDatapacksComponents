#> mhdp_items:sp_items/carving_knife/util/use
#
# 剝ぎ取りナイフ使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 前方のターゲットを取得
    execute positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 if entity @n[tag=Mns.State.IsCanCarving,tag=!Mns.State.IsEndCarving,distance=..4] as @n[tag=Mns.State.IsCanCarving,tag=!Mns.State.IsEndCarving,distance=..4] at @s run function mhdp_items:sp_items/carving_knife/main
