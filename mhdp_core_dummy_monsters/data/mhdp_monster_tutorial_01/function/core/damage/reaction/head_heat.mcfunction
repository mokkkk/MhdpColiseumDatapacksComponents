#> mhdp_monster_dino:core/damage/reaction/head_heat
#
# 怯みリアクション 頭
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Dino.Sp.RedHead.Damage = @s Mns.Dino.Head.Damage.Max

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute if entity @s[tag=!Mns.Temp.IsDamaged] run function animated_java:dino_aj/animations/damage_head_heat/tween {duration:1, to_frame: 0}
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 7
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag
    # 状態設定
        tag @s add Mns.State.IsDown
