#> mhdp_monster_valk:core/damage/reaction/general
#
# 怯みリアクション 共通処理
#
# @within function mhdp_monster_valk:core/damage/damage

# アニメーション判別用タグ消去
    tag @s remove Mns.Valk.State.Attack.Head
    tag @s remove Mns.Valk.State.Attack.Wing.R
    tag @s remove Mns.Valk.State.Attack.Wing.L

# 状態更新
    tag @s add Mns.Temp.IsDamaged

# 肉質変化
    execute as @e[type=slime,tag=Mns.HitBox.Valk.Body0] run scoreboard players set @s Mns.Hitbox.PartId 1
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmR] run scoreboard players set @s Mns.Hitbox.PartId 3
    execute as @e[type=slime,tag=Mns.HitBox.Valk.ArmL] run scoreboard players set @s Mns.Hitbox.PartId 4

# 演出リセット
    kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]
    function mhdp_monster_valk:core/util/models/model_interrupt
