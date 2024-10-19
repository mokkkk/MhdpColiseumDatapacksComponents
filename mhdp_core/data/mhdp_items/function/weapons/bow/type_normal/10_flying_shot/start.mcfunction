#> mhdp_items:weapons/bow/type_normal/10_flying_shot/start
#
# 飛翔睨み撃ち 開始
#
# @within function mhdp_items:weapons/bow/type_normal/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Bw.Normal.FlyingShot

# attribute設定
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# スタミナ消費
    tag @s add Ply.Weapon.StaminaNotRegen
    
# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if entity @s[tag=Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 3
    scoreboard players set @s Wpn.Bw.FlyingShot.Count 0
    tag @s add Ply.Ope.IsAir

# 翔蟲演出
    playsound entity.player.levelup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    tag @s add Itm.Sp.Wirebug.UsedSkill
    scoreboard players set @s Itm.Wirebug.CoolTime 400

# 跳ねる
    function mhdp_items:weapons/bow/type_normal/10_flying_shot/start_move

# say 武器操作：弓・飛翔睨み撃ち