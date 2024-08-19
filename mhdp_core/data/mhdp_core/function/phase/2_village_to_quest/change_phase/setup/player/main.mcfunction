#> mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main
#
# クエスト開始処理 プレイヤー実行
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/main

# 念のためUid確認
    execute unless entity @s[tag=Ply.State.HasUid] run function mhdp_core:player/data/uid_get

# 状態変更
    tag @s add Ply.State.PlayingQuest
    tag @s add Ply.State.UsingWeapon

# effect・attribute設定
    effect clear @s resistance
    effect clear @s slowness
    attribute @s generic.jump_strength modifier remove mhdp_core:quest_jump_strength
    attribute @s generic.knockback_resistance base set 1.0
    effect give @s instant_health 3 10 true

# データ初期化
    scoreboard players set @s Ply.Stats.Stamina 1000
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.StaminaEmpty
    tag @s remove Ply.Weapon.Drawing
    tag @s remove Ply.Weapon.Drawing.Sub
    execute unless score @s Ply.Stats.DefenceValue matches -200.. run scoreboard players set @s Ply.Stats.DefenceValue 0
    execute unless score @s Ply.Stats.DefenceValue.Fire matches -200.. run scoreboard players set @s Ply.Stats.DefenceValue.Fire 0
    execute unless score @s Ply.Stats.DefenceValue.Water matches -200.. run scoreboard players set @s Ply.Stats.DefenceValue.Water 0
    execute unless score @s Ply.Stats.DefenceValue.Thunder matches -200.. run scoreboard players set @s Ply.Stats.DefenceValue.Thunder 0
    execute unless score @s Ply.Stats.DefenceValue.Ice matches -200.. run scoreboard players set @s Ply.Stats.DefenceValue.Ice 0
    execute unless score @s Ply.Stats.DefenceValue.Dragon matches -200.. run scoreboard players set @s Ply.Stats.DefenceValue.Dragon 0

# 武器セット
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon

# 体験版：アイテムセット
    execute if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/phase/2_village_to_quest/get_default_items

# TODO:防具セット

# 特殊装具の初期化
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/sp_items

# 念のためadvancementを除去
    execute if entity @s[tag=Ply.Adv.Using.EnderEye] run tag @s remove Ply.Adv.Using.EnderEye
