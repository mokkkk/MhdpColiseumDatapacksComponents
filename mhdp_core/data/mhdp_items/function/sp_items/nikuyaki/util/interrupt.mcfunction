#> mhdp_items:sp_items/nikuyaki/util/interrupt
#
# 特殊装具の割り込み処理
#
# @within function mhdp_items:core/switch/item/init

# ride中の場合、中断
    ride @s dismount

# モデル消去
    # 念のため紐づけ
        function mhdp_items:sp_items/nikuyaki/using/get_target_model
    # 消去
        execute as @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run function animated_java:nikuyaki/remove/this

# タグ消去
    tag @s remove Itm.Sp.Nikuyaki.Using

# 音楽再生停止
    function mhdp_core:sound/nikubgm/stop

# スコア削除
    scoreboard players set @s Itm.Nikuyaki.GeneralTimer 0
