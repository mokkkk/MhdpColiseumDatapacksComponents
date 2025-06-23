#> mhdp_items:weapons/bow/type_tec/10_flying_shot/start
#
# 飛翔睨み撃ち 開始
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Tec.FlyingShot
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    tag @s add Ply.Weapon.StaminaNotRegen
    
# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if entity @s[tag=Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 3
    scoreboard players set @s Wpn.Bw.FlyingShot.Count 0
    tag @s add Ply.Ope.IsAir

# 演出
    particle flash ~ ~1.65 ~ 0 0 0 0 1
    playsound entity.player.levelup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2

# 翔蟲使用中の場合、クールタイムを伸ばす
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run tag @s add Itm.Sp.Wirebug.UsedSkill
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run scoreboard players set @s Itm.Wirebug.CoolTime 400

# 跳ねる
    function mhdp_items:weapons/bow/type_tec/10_flying_shot/start_move

# 終了
    tag @s remove Ply.Flag.SpJumpAttack

# say 武器操作：弓・飛翔睨み撃ち