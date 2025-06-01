#> mhdp_core:player/damage/player_to_entity/direct_attack
#
# プレイヤーがモンスターを直接攻撃した際の処理
#
# @within function mhdp_items:player/weapon/tick

# 攻撃対象の取得
    tag @s add this
    execute as @e[type=#lib:living,type=!player,tag=AttackedEntity,distance=..150] if score @s AttackedEntity = @a[tag=this,limit=1] AttackedEntity run tag @s add Temp.Victim

# 攻撃対象がいない場合、終了
    execute unless entity @e[type=slime,tag=Temp.Victim] run return run function mhdp_core:player/damage/player_to_entity/direct_attack_end

# 武器ごとの直接攻撃処理を呼び出し
    execute if entity @s[tag=Ply.Weapon.Drawing] run function mhdp_items:core/switch/weapon_direct_attack

# 与えたダメージによりダメージに倍率を掛ける
    # ダメージ量取得
        execute store result score #mhdp_temp_hitbox_hp MhdpCore run data get entity @n[type=slime,tag=Temp.Victim] Health 10
        tellraw @a [{"text":"mhdp_temp_hitbox_hp: "},{"score":{"name":"#mhdp_temp_hitbox_hp","objective":"MhdpCore"}}]
        scoreboard players set #mhdp_temp_direct_attack_damage MhdpCore 10000
        scoreboard players operation #mhdp_temp_direct_attack_damage MhdpCore -= #mhdp_temp_hitbox_hp MhdpCore
        tellraw @a [{"text":"mhdp_temp_direct_attack_damage: "},{"score":{"name":"#mhdp_temp_direct_attack_damage","objective":"MhdpCore"}}]
    # 基準値をもとに倍率計算（基準値：60）
        scoreboard players operation #mhdp_temp_direct_attack_damage MhdpCore *= #const_100 Const
        scoreboard players operation #mhdp_temp_direct_attack_damage MhdpCore /= #const_60 Const
    # ダメージ量更新
        execute store result score #mhdp_temp_da_damage_multiply MhdpCore run data get storage api: Arg.DamageMult 100
        scoreboard players operation #mhdp_temp_da_damage_multiply MhdpCore *= #mhdp_temp_direct_attack_damage MhdpCore
        execute store result storage api: Arg.DamageMult double 0.01 run scoreboard players operation #mhdp_temp_da_damage_multiply MhdpCore /= #const_100 Const
        execute store result score #mhdp_temp_da_damage_multiply MhdpCore run data get storage api: Arg.ElementDamageMult 100
        scoreboard players operation #mhdp_temp_da_damage_multiply MhdpCore *= #mhdp_temp_direct_attack_damage MhdpCore
        execute store result storage api: Arg.ElementDamageMult double 0.01 run scoreboard players operation #mhdp_temp_da_damage_multiply MhdpCore /= #const_100 Const

# 攻撃演出のランダム回転
    execute store result score #mhdp_temp_vfx_rotation_base MhdpCore run data get storage api: Arg.VfxRotation 100
    execute store result score #mhdp_temp_vfx_rotation_random MhdpCore run random value -50..50
    execute store result storage api: Arg.VfxRotation float 0.01 run scoreboard players operation #mhdp_temp_vfx_rotation_base MhdpCore += #mhdp_temp_vfx_rotation_random MhdpCore

# 対象のHPを回復
    execute as @n[type=slime,tag=Temp.Victim] run data modify entity @s Health set value 1000.0f

# ダメージ処理に移行
    execute if entity @s[tag=Ply.Weapon.Drawing] run function api:damage_player_to_entity

# 終了
    function mhdp_core:player/damage/player_to_entity/direct_attack_end
