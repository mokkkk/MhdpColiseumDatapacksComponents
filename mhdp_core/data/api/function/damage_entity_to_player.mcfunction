#> api:damage_entity_to_player
#
# エンティティからプレイヤーに与えるダメージ処理
#
# @input storage api: Arg.

# 処理の中断
    # プレイヤー以外が実行者の場合
        execute unless entity @s[type=player] run return 0
    # 無敵時間
        execute if score @s Ply.Timer.DamageInterval matches 1.. run return 0
    # フレーム回避
        execute if score @s Ply.Timer.Avoid matches 1.. if score #mhdp_temp_guard_value MhdpCore matches ..19 at @s run return run function mhdp_core:player/damage/entity_to_player/avoid/main

# 無敵時間設定
    execute if data storage mhdp_core:temp Arg{IsDisableDamageInterval:false} run scoreboard players set @s Ply.Timer.DamageInterval 20

# データ取得
    function api:damage_entity_to_player/get_attack_data

# ダメージ計算
    # 防御力によるダメージ軽減
        function api:damage_entity_to_player/calc_raw_damage
    # 属性ダメージ軽減
        function api:damage_entity_to_player/calc_element_damage

# ダメージ軽減率取得
    function api:damage_entity_to_player/get_damage_reduction

# ガード判定
    execute if entity @s[tag=Ply.Weapon.Guard] run function api:damage_entity_to_player/guard

# 武器の被ダメージ時処理呼び出し
    execute if entity @s[tag=!Ply.Weapon.Guard] run function mhdp_items:core/switch/weapon_on_damage

# ノックバック
    function api:damage_entity_to_player/knockback

# ダメージ軽減率適用
    scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #mhdp_temp_damage_reduction MhdpCore
    scoreboard players operation #mhdp_temp_damage_total MhdpCore /= #const_100 Const

# 根性スキル発動判定
    function api:damage_entity_to_player/skill/guts

# プレイヤーへのダメージ適用
    # ダメージ量取得
        execute store result storage mhdp_core:temp Arg.TotalDamage float 0.01 run scoreboard players get #mhdp_temp_damage_total MhdpCore
    # ダメージを与える
        function api:damage_entity_to_player/apply/apply_damage with storage mhdp_core:temp Arg

# 参考
    # function mhdp_core:player/damage/entity_to_player/apply

# 演出
    execute if entity @s[tag=Ply.Weapon.Guard] at @s run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] at @s run playsound block.chain.break master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] at @s run playsound block.chain.break master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] at @s run playsound block.chain.break master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] at @s run particle firework ~ ~1 ~ 0 0 0 0.3 20

# 終了
    function api:damage_entity_to_player/reset
