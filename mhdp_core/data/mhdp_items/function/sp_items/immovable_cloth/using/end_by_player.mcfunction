#> mhdp_items:sp_items/immovable_cloth/using/end_by_player
#
# 不動の装衣の使用終了処理
#
# @within function mhdp_items:sp_items/immovable_cloth/tick

# タグ消去
    tag @s remove Itm.Sp.ImmovableCloth.Using

# クールタイム設定
    scoreboard players set @s Itm.ImmovableCloth.CoolTime 7200
    # 最大使用時間の割合に応じてクールタイム減少
        scoreboard players set #mhdp_temp_usetime MhdpCore 1800
        scoreboard players set #mhdp_temp_usetime_max MhdpCore 1800
        scoreboard players operation #mhdp_temp_usetime MhdpCore = @s Itm.ImmovableCloth.GeneralTimer
        scoreboard players operation #mhdp_temp_usetime MhdpCore *= #const_100 Const
        scoreboard players operation #mhdp_temp_usetime MhdpCore /= #mhdp_temp_usetime_max MhdpCore
        scoreboard players operation @s Itm.ImmovableCloth.CoolTime *= #mhdp_temp_usetime MhdpCore
        scoreboard players operation @s Itm.ImmovableCloth.CoolTime /= #const_100 Const

# 通知
    tellraw @s {"text": "【不動の装衣を解除した】","color": "green"}

# attribute消去
    # なし

# 演出
    playsound item.armor.equip_chain master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1

# 終了
    scoreboard players reset #mhdp_temp_usetime MhdpCore
    scoreboard players reset #mhdp_temp_usetime_max MhdpCore
