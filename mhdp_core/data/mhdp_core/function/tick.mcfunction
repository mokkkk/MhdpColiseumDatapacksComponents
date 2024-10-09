#> mhdp_core:tick
#
# 毎tick実行される処理
#
# @within tag/function minecraft:tick

# 基礎データ取得処理
    function mhdp_core:core/data/get_data

# 各プレイヤーの個別処理
    execute as @a at @s run function mhdp_core:player/tick

# 村の処理
    function mhdp_core:phase/1_village/main

# 各Phase実行処理
    function mhdp_core:phase/tick

# モンスターの個別処理
    execute as @e[type=item_display,tag=Mns.Root] at @s run function mhdp_monsters:core/switch/tick

# 射撃Entityの処理
# モンスターの射撃は各モンスターの処理に移譲する
    execute as @e[type=item_display,tag=Other.Shot] at @s run function mhdp_core:other_entity/shot/tick

# 特殊Entityの個別処理
    execute as @e[type=text_display,tag=Other.Text.Vfx] at @s run function mhdp_core:other_entity/vfx/tick
    execute as @e[tag=Effect.General] at @s run function mhdp_monsters:core/effect/tick

# tick終了時処理
    function mhdp_core:core/on_end_tick
