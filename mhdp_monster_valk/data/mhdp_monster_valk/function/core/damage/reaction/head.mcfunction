#> mhdp_monster_valk:core/damage/reaction/head
#
# 怯みリアクション 頭
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Valk.Head.Damage = @s Mns.Valk.Head.Damage.Max
    # 怯み回数増加
        scoreboard players add @s Mns.Valk.Head.Damage.Count 1

# 部位破壊処理 (2回怯ませると破壊)
    execute if entity @s[tag=!Mns.Break.Head] if score @s Mns.Valk.Head.Damage.Count matches 2.. run function mhdp_monster_valk:core/damage/break/head

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java_valk:valk/animations/lance_damage_head/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_valk:core/damage/reaction/flying

# 独自処理
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 墜落した場合はダウン扱い
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_damage_flying.playing] run tag @s add Mns.State.IsDown
        tag @s remove Mns.State.IsDisableAngerSpeed
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    function mhdp_monster_valk:core/damage/reaction/general
