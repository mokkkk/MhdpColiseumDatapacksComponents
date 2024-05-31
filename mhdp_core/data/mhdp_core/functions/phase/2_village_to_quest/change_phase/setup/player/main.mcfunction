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
    attribute @s generic.jump_strength modifier remove f-f-f-f-1
    attribute @s generic.knockback_resistance base set 1.0
    effect give @s instant_health 3 10 true

# データ初期化
    scoreboard players set @s Ply.Stats.Stamina 1000
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.StaminaEmpty
    tag @s remove Ply.Weapon.Drawing
    tag @s remove Ply.Weapon.Drawing.Sub

# 武器セット
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon

# TODO:特殊装具の取得
    say TODO:特殊装具セット

# 念のためadvancementを除去
    execute if entity @s[tag=Ply.Adv.Using.EnderEye] run tag @s remove Ply.Adv.Using.EnderEye
