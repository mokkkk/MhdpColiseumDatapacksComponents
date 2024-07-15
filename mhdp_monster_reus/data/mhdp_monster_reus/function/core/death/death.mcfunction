#> mhdp_monster_reus:core/death/death
#
# 死亡時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.death

# 状態更新
    tag @s add Mns.State.Death
    tag @s remove Mns.State.IsAnger

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying] run function animated_java:reus_aj/animations/land_death/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying] run function mhdp_monsters:core/util/damage/death_flying

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Reus] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:reus

# クエストの死亡時処理を呼び出す
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/death
