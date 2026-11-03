#> mhdp_monster_reus:core/tick/animation/change/on_battle/middle
#
# アニメーション変更処理 戦闘時 中距離
#
# @within function mhdp_monster_reus:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Target.Reus"}

# 基礎確率設定 (技名:重み)
    # data modify storage mhdp_core:temp Temp.AttackRandom set value {}
# 状態に応じた確率上書き
    # 正面時
        # execute if entity @a[tag=Mns.Target.Reus,tag=Mns.Temp.Situation.IsForward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 背面時
        # execute if entity @a[tag=Mns.Target.Reus,tag=Mns.Temp.Situation.IsBack] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 怒り
        # execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}

# 決定 (macro/m.middle の loot で抽選し、#mndp_temp_action_id に番号が入る)
    # function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"reus",State:"middle"}

# 状態リセット
    # data remove storage mhdp_core:temp Temp.AttackRandom
    # function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与 (番号は macro/m.middle の Id と対応させる)
    # TODO(技未登録): 技を追加するまでは仮行動として待機する
        tag @s add Anim.Idle

# 軸合わせ要否確認
    function mhdp_monster_reus:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore
