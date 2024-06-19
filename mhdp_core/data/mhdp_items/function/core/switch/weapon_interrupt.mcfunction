#> mhdp_items:core/switch/weapon_interrupt
# 
# 分岐処理 各武器の割り込み中断処理、被ダメージ時などに武器動作を中断する
#
# @within function mhdp_items:/**

# 念のためデータ取得
    function mhdp_core:player/data/load_data

# 分岐処理
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.WeaponTypePrefix
    function mhdp_items:core/switch/macro/m.interrupt with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
