#> mhdp_monster_reus:core/damage/reaction/anger_end
#
# 怯みリアクション 怒り終了
#
# @within function mhdp_monster_reus:core/damage/damage

# 共通処理
    # 状態更新
        tag @s remove Mns.State.IsAnger
    # ボスバー更新
        bossbar set mhdp_monster:reus name [{"text":"火竜"},{"text":"\uE000","font":"minecraft:ui/monster_hp"}]

say anger end