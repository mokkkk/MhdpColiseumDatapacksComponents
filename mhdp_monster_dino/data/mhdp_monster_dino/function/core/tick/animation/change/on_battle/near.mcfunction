#> mhdp_monster_dino:core/tick/animation/change/on_battle/near
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Dino.Target"}

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {BreathBack:0,MoveBreath:0,Bite:3,MoveBack:0,Tail:4,TailSide:3,TailBack:0,TailFlame:0,Round:1,Step:1}
# 状態に応じた確率上書き
    # 通常・正面時
        execute if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:5,Tail:4}
    # 通常・背面時
        execute if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailBack:8}
    # 通常・側面時
        execute if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {Tail:2,TailSide:4}
    # 尻尾赤熱・正面時
        execute if entity @s[tag=Mns.Dino.State.TailHeat] if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:2,Tail:7,TailSide:4,MoveBack:3}
    # 尻尾赤熱・背面時
        execute if entity @s[tag=Mns.Dino.State.TailHeat] if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 尻尾赤熱・側面時
        execute if entity @s[tag=Mns.Dino.State.TailHeat] if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailSide:3,TailFlame:4}
    # 喉赤熱・正面時
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:4,BreathBack:2,MoveBreath:2}
    # 喉赤熱・背面時
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 喉赤熱・側面時
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"dino",State:"near"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # バックジャンプブレス
        execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Breath.Back
    # 移動ブレス
        execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_dino:core/tick/animation/change/play/move_breath
    # 噛みつき
        execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_dino:core/tick/animation/change/play/bite
    # 車庫入れ
        execute if score #mndp_temp_action_id MhdpCore matches 4 run tag @s add Anim.MoveBack
    # 尻尾攻撃
        execute if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/tail
    # 尻尾攻撃・側面
        execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_dino:core/tick/animation/change/play/tail_side
    # 尻尾攻撃・背面
        execute if score #mndp_temp_action_id MhdpCore matches 7 run function mhdp_monster_dino:core/tick/animation/change/play/tail_back
    # 火炎
        execute if score #mndp_temp_action_id MhdpCore matches 8 run function mhdp_monster_dino:core/tick/animation/change/play/tail_flame
    # 大回転斬り
        execute if score #mndp_temp_action_id MhdpCore matches 9 run tag @s add Anim.Round
    # サイドステップ
        execute if score #mndp_temp_action_id MhdpCore matches 10 run function mhdp_monster_dino:core/tick/animation/change/play/step

# 軸合わせ要否確認
    function mhdp_monster_dino:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore
