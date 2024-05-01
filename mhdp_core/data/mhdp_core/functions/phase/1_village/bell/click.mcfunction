#> mhdp_core:phase/1_village/bell/click
#
# クエスト出発ベルクリック時に実行
#
# @within function mhdp_core:phase/1_village/click_ui

# プレイヤーの立ち位置を確認し、動く向きを調整
    execute facing entity @a[tag=Ply.Temp.Target] feet positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Other.Temp.Right
    execute if entity @s[tag=!Other.Temp.Right] run setblock 223 64 206 bell[facing=east]
    execute if entity @s[tag=Other.Temp.Right] run setblock 223 64 206 bell[facing=west]
    tag @s remove Other.Temp.Right

# ベルを鳴らす
    setblock 223 62 206 redstone_torch
    schedule function mhdp_core:phase/1_village/bell/schedule_remove_redstone 1t replace

# クエストPhase中は処理しない
    execute unless data storage mhdp_core:game_data {Phase:1} run tellraw @a {"text": "【現在クエスト中です  終了までお待ちください】"}
# 村Phase中はクエスト出発確認処理に移行
    execute if data storage mhdp_core:game_data {Phase:1} run function mhdp_core:phase/1_village/change_phase/check
