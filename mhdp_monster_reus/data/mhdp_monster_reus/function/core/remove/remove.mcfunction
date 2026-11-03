#> mhdp_monster_reus:core/remove/remove
#
# 消去処理を行う
#
# @within function mhdp_monsters:core/switch/macro/m.remove

# 弾/VFXオブジェクト消去
    execute as @e[tag=Asset.Object.Reus] at @s run function api:object/remove

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Reus] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:reus

# プレイヤーに付いた固有スコアをリセット
    scoreboard players reset @a Mns.Reus.Caution
    scoreboard players reset @a Mns.Reus.Search
    scoreboard players reset @a Mns.Reus.Hate

# モデル消去
    function animated_java_reus:reus/remove/this

# say モンスター処理：火竜消去処理
