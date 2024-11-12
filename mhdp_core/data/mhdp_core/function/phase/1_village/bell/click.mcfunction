#> mhdp_core:phase/1_village/bell/click
#
# クエスト出発ベルクリック時に実行
#
# @within function mhdp_core:phase/1_village/click_ui

# ベルを鳴らす
    function mhdp_core:phase/1_village/bell/macro/m.ring_bell with storage mhdp_core:game_data PositionList[{ID:"StartBell"}]

# チュートリアル中は処理しない
    execute if entity @n[type=item_display,tag=Vlg.VillageTutorial] run tellraw @a[tag=Ply.Temp.Target] {"text": "【現在チュートリアル中です。終了までお待ちください】","color": "red"}
# 村Phase中以外は処理しない
    execute unless data storage mhdp_core:game_data {Phase:1} run tellraw @a[tag=Ply.Temp.Target] {"text": "【現在クエスト中です。終了までお待ちください】","color": "red"}
# 村Phase中、クエスト受注者以外の操作の場合は処理しない
    execute if data storage mhdp_core:game_data {Phase:1} unless entity @n[type=item_display,tag=Vlg.VillageTutorial] if entity @a[tag=Ply.State.QuestHost,tag=!Ply.Temp.Target] run tag @s add Ply.Temp.TargetSub
    execute if entity @s[tag=Ply.Temp.TargetSub] run tellraw @a[tag=Ply.Temp.Target] {"text": "【クエスト受注者のみが出発準備が可能です】","color": "red"}
# 村Phase中はクエスト出発確認処理に移行
    execute if entity @s[tag=!Ply.Temp.TargetSub] if data storage mhdp_core:game_data {Phase:1} unless entity @n[type=item_display,tag=Vlg.VillageTutorial] run function mhdp_core:phase/1_village/change_phase/check
# 終了
    tag @s remove Ply.Temp.TargetSub
