#> mhdp_items:weapons/great_sword/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# TODO: 武器の初期化処理
    # say TODO:大剣抜刀処理

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0
    
# ダミー用サブ武器装備
    loot replace entity @s weapon.offhand loot mhdp_items:weapons/dummy

# ステータス設定
    function mhdp_items:weapons/great_sword/util/set_status
