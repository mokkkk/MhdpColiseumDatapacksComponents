#> mhdp_monster_dino:core/damage/reaction/paralysis
#
# 怯みリアクション 麻痺
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 耐性値上昇
        scoreboard players operation @s Mns.Paralysis.Damage.Max *= #const_paralysis_damage_multiply Const
        execute store result score @s Mns.Paralysis.Damage run scoreboard players operation @s Mns.Paralysis.Damage.Max /= #const_100 Const
    # 状態設定
        tag @s add Mns.State.IsParalysis

# アニメーション再生処理
    # アニメーション再生
        function animated_java:dino_aj/animations/state_paralysis_start/tween {duration:1, to_frame: 0}
    # 効果時間設定
        scoreboard players operation @s Mns.Paralysis.Timer = @s Mns.Paralysis.Timer.Max
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    function mhdp_monster_dino:core/damage/reaction/general
