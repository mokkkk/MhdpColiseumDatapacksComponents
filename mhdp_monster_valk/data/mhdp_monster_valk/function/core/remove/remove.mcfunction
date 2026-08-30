#> mhdp_monster_valk:core/remove/remove
#
# 消去処理を行う
#
# @within function mhdp_monsters:core/switch/macro/m.remove

# 弾消去
    #TODO: 直接 kill では問題が生じる可能性があるためユーザーが修正する（弾の後始末処理を経由させる想定）
    # kill @e[tag=Mns.Shot.Valk]
    # kill @e[tag=Mns.Shot.Valk.Tail]

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
