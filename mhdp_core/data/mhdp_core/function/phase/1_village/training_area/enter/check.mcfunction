#> mhdp_core:phase/1_village/training_area/enter/check
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/bell/click

# チェック：チュートリアル中は処理しない
    execute if entity @n[type=item_display,tag=Vlg.VillageTutorial] run return run tellraw @s {"text": "【現在チュートリアル中です。終了までお待ちください】","color": "red"}
# チェック：クエスト参加中は利用不可
    execute if entity @s[tag=Ply.State.QuestHost] run return run tellraw @s {"text":"【クエスト受注中は訓練所を利用できません】","color": "red"}
    execute if entity @s[tag=Ply.State.QuestMember] run return run tellraw @s {"text":"【クエスト参加中は訓練所を利用できません】","color": "red"}

# 条件確認
    data modify storage mhdp_core:temp IsError set value false
    # ベータ版用処理
        execute if data storage mhdp_core:temp {IsError:false} if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/phase/1_village/check_player_beta
        # 武器の装備処理
        # この後武器の装備チェックが行われるため、このタイミングで装備する
            execute if data storage mhdp_core:temp {IsError:false} run function mhdp_core:beta/phase/1_village/equip_weapon
    # プレイヤーの状態確認
        execute if data storage mhdp_core:temp {IsError:false} run function mhdp_core:phase/1_village/change_phase/check_player
    
# エラーがある場合、エラー内容を表示
    execute if data storage mhdp_core:temp {IsError:true} run function mhdp_core:phase/1_village/training_area/enter/show_error

# フェーズ変更
    execute if data storage mhdp_core:temp {IsError:false} run function mhdp_core:phase/1_village/training_area/enter/player

# 終了
    data remove storage mhdp_core:temp IsError
    data remove storage mhdp_core:temp Errors
