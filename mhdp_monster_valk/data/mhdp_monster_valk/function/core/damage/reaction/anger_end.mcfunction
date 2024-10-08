#> mhdp_monster_valk:core/damage/reaction/anger_end
#
# 怯みリアクション 怒り終了
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # 状態更新
        tag @s remove Mns.State.IsAnger
    # ボスバー更新
        bossbar set mhdp_monster:valk name [{"text":"天彗龍"},{"text":"\uE000","font":"minecraft:ui/monster_hp"}]
    # モデル変更
        function mhdp_monster_valk:core/util/models/anger_end

# 待機カウントリセット
    scoreboard players set @s Mns.General.ActCount.Idle 0

# カウント増加
    scoreboard players add @s Mns.Valk.EndAngerCount 1

# 龍気吸引
    execute if score @s Mns.Valk.EndAngerCount matches 2.. run tag @s add Anim.Charge
    execute if score @s Mns.Valk.EndAngerCount matches 2.. run tag @s add Mns.Temp.IsAlreadyAnimation
    execute if score @s Mns.Valk.EndAngerCount matches 2.. run scoreboard players set @s Mns.Valk.EndAngerCount 0
