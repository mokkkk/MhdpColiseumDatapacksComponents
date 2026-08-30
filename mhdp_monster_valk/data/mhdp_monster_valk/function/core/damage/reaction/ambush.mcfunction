#> mhdp_monster_valk:core/damage/reaction/ambush
#
# 怯みリアクション 不意打ち (非戦闘中に初撃を受けたとき。on_battle/start_ambush から呼ばれる)
#
# @within function mhdp_monster_valk:core/tick/on_battle/start_ambush

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java_valk:valk/animations/lance_damage_head/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_valk:core/damage/reaction/flying

# 攻撃者を向く
    execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0

# 終了
    function mhdp_monster_valk:core/damage/reaction/general
