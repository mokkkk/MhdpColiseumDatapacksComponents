#> assets:core/field/area/move_area.m
#
# フィールド共通処理 エリア移動

# FromAreaから、移動先座標を取得してtp
    $function assets:core/field/area/move_area_tp.m with storage mhdp_core:game_data ActiveField.AreaList[{AreaId:$(To)}].FromArea[{AreaId:$(From)}]

# CurrentAreaId更新
    $scoreboard players set @s Fld.CurrentAreaId $(To)

# 移動直後の被弾対策で、1秒間だけダメージを軽減
    effect give @s resistance 1 3 true

# クエスト中の処理
    # 始めてエリア移動が行われた際、制限時間のカウントを開始
        execute if data storage mhdp_core:game_data ActiveQuest{IsCountDown:false} run data modify storage mhdp_core:game_data ActiveQuest.IsCountDown set value true
    # ダメージを有効化
        execute if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run tag @s add Ply.State.EnableDamage

# ボスのプレイヤー取得処理
    execute as @e[type=item_display,tag=Mns.Root] run function mhdp_monsters:core/switch/fetch_player
    # execute as @e[type=item_display,tag=Mns.Root] run function mhdp_monsters:core/switch/show_bossbar
