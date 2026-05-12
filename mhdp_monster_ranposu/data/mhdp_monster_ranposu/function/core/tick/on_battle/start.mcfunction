#> mhdp_monster_ranposu:core/tick/on_battle/start
#
# tick処理 戦闘中 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# フェーズ変更
    scoreboard players set @s Mns.General.Phase 2

# ? 表示
    data modify storage api: Arg.Override.Text set value "!"
    data modify storage api: Arg.Override.Color set value "#FF6640"
    data modify storage api: Arg.Override.Scale set value 4
    execute positioned ~ ~4 ~ run function api:object/summon.m {ObjectId:9}

# 初回遭遇
    tag @s add Mns.Temp.Anim.IsFirstContact
