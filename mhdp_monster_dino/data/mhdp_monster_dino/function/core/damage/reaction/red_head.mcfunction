#> mhdp_monster_dino:core/damage/reaction/red_head
#
# 怯みリアクション 喉赤熱化解除
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Dino.Sp.RedHead.Damage = @s Mns.Dino.Sp.RedHead.Damage.Max

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    function animated_java_dino:dino/animations/damage_head_heat/tween {duration:1, to_frame: 0}

# 独自処理
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 飛行状態リセット
        tag @s remove Mns.State.IsFlying
    # 状態設定
        tag @s add Mns.State.IsDown
        scoreboard players set @s Mns.General.DownCount 6
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # 喉赤熱化解除
        function mhdp_monster_dino:core/util/phase/head_heat_end

# 終了
    tag @s add Mns.Temp.IsDamaged
