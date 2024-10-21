#> mhdp_core:phase/3_quest/change_phase/general/player/reset
#
# クエスト終了時 プレイヤーのリセット処理
#
# @within
#    function mhdp_core:phase/3_quest/change_phase/succeed/change

# 武器のリセット
    function mhdp_core:phase/3_quest/change_phase/general/player/weapon/reset

# TODO: 防具のリセット

# 特殊装具のリセット
    function mhdp_items:core/switch/item/reset

# 演出の強制終了
    # 死亡演出
        execute if entity @s[tag=Ply.Event.DeathAnimation] at @s run function mhdp_core:player/phase_quest/death_animation/end_on_quest
    # スタミナ
        function mhdp_items:player/weapon/stamina/penalry_end

# タグ消去
    # 状態
        tag @s remove Ply.State.EnableDamage
        tag @s remove Ply.State.MnsTarget
        tag @s remove Ply.State.QuestHost
        tag @s remove Ply.State.QuestMember
        tag @s remove Ply.State.UsingWeapon
        tag @s remove Ply.State.IsSilent
    # 武器関連
        tag @s remove Ply.Weapon.StaminaNotRegen
        tag @s remove Ply.Weapon.StaminaEmpty
        tag @s remove Ply.Weapon.Drawing
        tag @s remove Ply.Weapon.Drawing.Sub
    # スキル関連
        tag @s remove Ply.State.IsUsedGuts
    # チュートリアル関連    
        tag @s remove Ply.Temp.Tutorial.Avoid

# ターゲットタグの消去
    function mhdp_monsters:core/util/other/remove_target_tag

# 食事スキル効果の解除
    function mhdp_core:phase/3_quest/change_phase/general/player/skill/reset_food_skills

# attribute等の初期化
    effect give @s instant_health 1 10
    effect clear @s resistance
    effect clear @s slowness
    attribute @s generic.jump_strength modifier remove mhdp_core:death_animation
    attribute @s generic.max_health modifier remove mhdp_core:quest_max_health
    attribute @s generic.jump_strength modifier remove mhdp_core:quest_jump_strength
    attribute @s generic.jump_strength modifier remove mhdp_core:sp_item_jump_strength
    attribute @s generic.movement_speed modifier remove mhdp_core:quest_movement_speed

# UIの消去
    title @s actionbar {"text":""}

# チーム解除
    team leave @s

# Beta版処理
    execute if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/phase/3_quest/end

# 連番解除
    scoreboard players reset @s QuestSerialId
