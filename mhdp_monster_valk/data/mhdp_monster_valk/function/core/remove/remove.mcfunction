#> mhdp_monster_valk:core/remove/remove
#
# 消去処理を行う
#
# @within function mhdp_monsters:core/switch/macro/m.remove

# 弾/VFXオブジェクト消去
    execute as @e[tag=Asset.Object.Valk] at @s run function api:object/remove

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Valk] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:valk

# プレイヤーに付いた固有スコアをリセット
    scoreboard players reset @a Mns.Valk.Caution
    scoreboard players reset @a Mns.Valk.Search
    scoreboard players reset @a Mns.Valk.Hate

# モデル消去
    function animated_java_valk:valk/remove/this

# 一部スコア消去
    scoreboard players reset #mhdp_temp_valk_flash_scale MhdpCore

# say モンスター処理：天彗龍消去処理
