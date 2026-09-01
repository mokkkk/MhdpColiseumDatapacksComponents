#> mhdp_monster_valk:core/tick/animation/change/on_battle/shoot_middle
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Target.Valk"}

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Vertical:2,Shoot:4,Sault:3}
# 状態に応じた確率上書き
    # クールタイム
        execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sault:0}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"valk",State:"shoot_middle"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # 翼叩きつけ
        execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_valk:core/tick/animation/change/play/vertical_s
    # 射撃
        execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/shoot
    # 前転
        execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_valk:core/tick/animation/change/play/sault_move

# 軸合わせ要否確認
    function mhdp_monster_valk:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore
