#> mhdp_monster_karakuri:core/damage/reaction/stun
#
# 怯みリアクション スタン
#
# @within function mhdp_monster_karakuri:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値上昇
        scoreboard players operation @s Mns.Stun.Damage.Max *= #const_stun_damage_multiply Const
        execute store result score @s Mns.Stun.Damage run scoreboard players operation @s Mns.Stun.Damage.Max /= #const_100 Const

# アニメーション再生
    # ダウン用アニメーションが無いため、相殺怯みで代用
    function animated_java_karakuri:karakuri/animations/damage_counter/tween {duration:1, to_frame: 0}

# 遷移タイマー初期化
    scoreboard players set @s Mns.General.DummyTimer 0

# 演出
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# タグ消去
    tag @s remove Mns.Karakuri.Attack.Head
