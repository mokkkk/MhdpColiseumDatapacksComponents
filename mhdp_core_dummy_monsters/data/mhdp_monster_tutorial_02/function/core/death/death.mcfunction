#> mhdp_monster_tutorial_02:core/death/death
#
# 死亡時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.death

# 状態更新
    tag @s add Mns.State.Death

# アニメーション再生
    # なし

# 当たり判定を消去
    # なし

# ボスバー消去
    # なし

# クエストの死亡時処理を呼び出す
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/death

# 削除
    function mhdp_monster_tutorial_02:core/remove/remove
