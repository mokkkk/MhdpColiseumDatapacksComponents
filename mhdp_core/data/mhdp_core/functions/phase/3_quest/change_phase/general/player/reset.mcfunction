#> mhdp_core:phase/3_quest/change_phase/general/player/reset
#
# クエスト終了時 プレイヤーのリセット処理
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change

# TODO: 武器のリセット

# TODO: 防具のリセット

# 死亡演出中のプレイヤーは、演出終了
    execute if entity @s[tag=Ply.Event.DeathAnimation] at @s run function mhdp_core:player/phase_quest/death_animation/end_on_quest

# タグ消去
    # 状態
        tag @s remove Ply.State.EnableDamage
        tag @s remove Ply.State.MnsTarget
        tag @s remove Ply.State.QuestHost
        tag @s remove Ply.State.QuestMember

# 食事スキル効果の解除
    tag @s remove Ply.Skill.Food.Insurance

# attribute等の初期化
    effect clear @s resistance
    effect clear @s slowness
    attribute @s generic.jump_strength modifier remove f-f-f-f-2