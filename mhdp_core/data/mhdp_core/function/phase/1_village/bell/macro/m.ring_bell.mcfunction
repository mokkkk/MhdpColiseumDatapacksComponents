#> mhdp_core:phase/1_village/bell/macro/m.ring_bell
#
# クエスト出発ベルクリック時に実行
#
# @within function mhdp_core:phase/1_village/click_ui

# プレイヤーの立ち位置を確認し、動く向きを調整
    execute facing entity @a[tag=Ply.Temp.Target] feet positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Other.Temp.Right
    $execute if entity @s[tag=!Other.Temp.Right] run setblock $(X) $(Y) $(Z) bell[facing=$(Facing)]
    $execute if entity @s[tag=Other.Temp.Right] run setblock $(X) $(Y) $(Z) bell[facing=$(InverseFacing)]
    tag @s remove Other.Temp.Right

# ベルを鳴らす
    $execute positioned $(X) $(Y) $(Z) run setblock ~ ~-2 ~ redstone_torch
    schedule function mhdp_core:phase/1_village/bell/schedule_remove_redstone 1t replace
