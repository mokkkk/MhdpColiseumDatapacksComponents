#> mhdp_monster_reus:core/death/death
#
# 死亡時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.death

# 状態更新
    tag @s add Mns.State.Death
    tag @s remove Mns.State.IsAnger

# アニメーション再生 (飛行中は共通の death_flying へ)
    # TODO(AJ未出力: death) execute if entity @s[tag=!Mns.State.IsFlying] run function animated_java_reus:reus/animations/death/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying] run function mhdp_monsters:core/util/damage/death_flying

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Reus] run function mhdp_monsters:core/util/other/remove_hitbox

# 弾/VFXオブジェクト消去
    execute as @e[tag=Asset.Object.Reus] at @s run function api:object/remove

# ボスバー消去
    bossbar remove mhdp_monster:reus

# クエストの死亡時処理を呼び出す
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/death
