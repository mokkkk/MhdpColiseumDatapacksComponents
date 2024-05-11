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

# 村Phase中以外は処理しない
    execute unless data storage mhdp_core:game_data {Phase:1} run tellraw @a[tag=Ply.Temp.Target] {"text": "【現在クエスト中です。終了までお待ちください】","color": "red"}
# 村Phase中、クエスト受注者以外の操作の場合は処理しない
    execute if data storage mhdp_core:game_data {Phase:1} if entity @a[tag=Ply.State.QuestHost] if entity @s[tag=!Ply.State.QuestHost] run tag @s add Ply.Temp.TargetSub
    execute if entity @s[tag=Ply.Temp.TargetSub] run tellraw @a[tag=Ply.Temp.Target] {"text": "【クエスト受注者のみが出発準備が可能です】","color": "red"}
# 村Phase中はクエスト出発確認処理に移行
    execute if entity @s[tag=!Ply.Temp.TargetSub] if data storage mhdp_core:game_data {Phase:1} run function mhdp_core:phase/1_village/change_phase/check
# 終了
    tag @s remove Ply.Temp.TargetSub
