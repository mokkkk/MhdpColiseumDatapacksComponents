#> mhdp_monster_valk:core/damage/reaction/general
#
# 怯みリアクション 共通処理 (valk 固有・各 reaction の末尾で呼ぶ)
#
# @within function mhdp_monster_valk:core/damage/damage

# アニメーション判別用タグ消去
    tag @s remove Mns.Valk.State.Attack.Head
    tag @s remove Mns.Valk.State.Attack.Wing.R
    tag @s remove Mns.Valk.State.Attack.Wing.L

# 怯み適用済みフラグ
    tag @s add Mns.Temp.IsDamaged

# 肉質(PartId)を通常値へ戻す
    #TODO: 旧コードの Mns.HitBox.Valk.Body0 は誤記のため Body に修正
    execute as @e[type=slime,tag=Mns.HitBox.Valk.Body] run scoreboard players set @s Mns.Hitbox.PartId 1
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmR] run scoreboard players set @s Mns.Hitbox.PartId 3
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmL] run scoreboard players set @s Mns.Hitbox.PartId 4

# 演出リセット
    kill @e[type=text_display,tag=10047.Long]
    function mhdp_monster_valk:core/util/models/model_interrupt
