#> mhdp_monster_valk:core/damage/reaction/anger_end
#
# 怒り終了 (change/main から怒りタイマー切れ時に呼ばれる)
#
# @within function mhdp_monster_valk:core/tick/animation/change/main

# 共通処理 (Mns.State.IsAnger 除去・ボスバー名を battle に・models/anger_end 呼び出し)
    function mhdp_monsters:core/util/tick/end_anger.m {Name:"valk"}

# 待機カウントリセット
    scoreboard players set @s Mns.General.ActCount.Idle 0

# 怒り終了回数
    scoreboard players add @s Mns.Valk.EndAngerCount 1

# 龍気吸引 (怒り終了2回ごとに変形吸引を挟む)
    execute if score @s Mns.Valk.EndAngerCount matches 2.. run tag @s add Anim.Charge
    execute if score @s Mns.Valk.EndAngerCount matches 2.. run tag @s add Mns.Temp.IsAlreadyAnimation
    execute if score @s Mns.Valk.EndAngerCount matches 2.. run scoreboard players set @s Mns.Valk.EndAngerCount 0
