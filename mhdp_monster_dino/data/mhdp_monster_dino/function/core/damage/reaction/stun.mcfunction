#> mhdp_monster_dino:core/damage/reaction/stun
#
# 怯みリアクション スタン
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 耐性値上昇
        scoreboard players operation @s Mns.Stun.Damage.Max *= #const_stun_damage_multiply Const
        execute store result score @s Mns.Stun.Damage run scoreboard players operation @s Mns.Stun.Damage.Max /= #const_100 Const
    # 状態設定
        tag @s add Mns.State.IsStun

# アニメーション再生処理
    # アニメーション再生
        execute if entity @s[tag=aj.dino_aj.animation.down_right.playing] run tag @s add Mns.Temp.Right
        execute if entity @s[tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/damage_down_right/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/damage_down_left/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_dino:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 6
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    tag @s add Mns.Temp.IsDamaged
