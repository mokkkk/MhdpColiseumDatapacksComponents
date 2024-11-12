#> mhdp_items:sp_items/nikuyaki/util/interrupt
#
# 特殊装具の割り込み処理
#
# @within function mhdp_items:core/switch/item/init

# 利用中の場合のみ実行
    execute if entity @s[tag=!Itm.Sp.Nikuyaki.Using] run return 0

# ride中の場合、中断
    ride @s dismount

# モデル消去
    # 念のため紐づけ
        function mhdp_items:sp_items/nikuyaki/using/get_target_model
    # 消去
        execute as @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run tp @s 0.0 0.0 0.0
        execute as @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run function animated_java:nikuyaki/remove/this

# アイテム使用開始前の位置に戻る
    function mhdp_core:player/data/load_data
    summon area_effect_cloud ~ ~ ~ {Tags:["Temp.TpPos"]}
    data modify entity @n[type=area_effect_cloud,tag=Temp.TpPos] Pos set from storage mhdp_core:temp PlayerData.ItemUsedPos
    execute positioned as @n[type=area_effect_cloud,tag=Temp.TpPos] run tp @s ~ ~ ~ ~ ~
    kill @e[type=area_effect_cloud,tag=Temp.TpPos]

# タグ消去
    tag @s remove Itm.Sp.Nikuyaki.Using

# 音楽再生停止
    function mhdp_core:sound/nikubgm/stop

# スコア削除
    scoreboard players set @s Itm.Nikuyaki.GeneralTimer 0
