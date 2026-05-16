#> mhdp_monster_ranposu:core/tick/on_relax/update_caution
#
# tick処理 非発見時
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Ranposu",DistNear:15,DistFar:35}

# 警戒度更新
    # 非遮蔽時
        # 近距離
            # 前、横
                # 移動中
                    # スプリント中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 300
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 150
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 100
                # 停止中
                    execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 100
            # 後
                # 移動中
                    # スプリント中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 80
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 50
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 10
                # その他
                    execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 10
        # 中距離
            # 前、横
                # 移動中
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 100
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 60
                # その他
                    execute as @a[tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 40
            # 後
                # 移動中
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 25
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 8
                # その他
                    execute as @a[tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 5
        # 遠距離
            # 前、横
                # 移動中
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 18
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 5
                # その他
                    execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 3
            # その他
                execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 2
    # 遮蔽時
        # 近距離
            # 移動中
                execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Caution 5

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag
