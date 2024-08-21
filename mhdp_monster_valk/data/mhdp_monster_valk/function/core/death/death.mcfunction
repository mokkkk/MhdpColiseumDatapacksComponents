#> mhdp_monster_dino:core/death/death
#
# 死亡時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.death

# 状態更新
    tag @s add Mns.State.Death
    tag @s remove Mns.State.IsAnger

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying] run function animated_java:dino_aj/animations/death/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying] run function mhdp_monsters:core/util/damage/death_flying

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Dino] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:dino

# クエストの死亡時処理を呼び出す
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/death
