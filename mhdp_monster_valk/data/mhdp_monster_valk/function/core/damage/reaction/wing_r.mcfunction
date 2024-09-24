#> mhdp_monster_valk:core/damage/reaction/wing_r
#
# 怯みリアクション 右翼
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Valk.WingR.Damage = @s Mns.Valk.WingR.Damage.Max

# 部位破壊処理
    execute if entity @s[tag=!Mns.Break.Wing.R] run function mhdp_monster_valk:core/damage/reaction/wing_r_break

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        function animated_java:valk_aj/animations/lance_damage_wing_r/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_valk:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag
    # 状態設定
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_flying.playing] run tag @s add Mns.State.IsDown
        tag @s remove Mns.State.IsDisableAngerSpeed
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag
    # モデル変更
        function mhdp_monster_valk:core/util/models/model_interrupt
