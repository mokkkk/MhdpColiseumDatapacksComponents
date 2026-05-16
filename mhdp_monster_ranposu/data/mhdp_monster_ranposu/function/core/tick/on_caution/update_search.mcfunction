#> mhdp_monster_ranposu:core/tick/on_search/update_search
#
# tick処理 警戒中
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
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 300
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 250
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 200
                # 停止中
                    execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 200
            # 後
                # 移動中
                    # スプリント中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 150
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 125
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 100
                # 停止中
                    execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 100
        # 中距離
            # 前、横
                # 移動中
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 100
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 60
                # 停止中
                    execute as @a[tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 40
            # 後
                # 移動中
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 50
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 30
                # その他
                    execute as @a[tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 20
        # 遠距離
            # 前、横
                # 移動中
                    # 非スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 50
                    # スニーク中
                        execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.Back,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsSneaking,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 25
                # その他
                    execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.Back,tag=Mns.Temp.Situation.IsStopping,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 15
            # その他
                execute as @a[tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 15
    # 遮蔽時
        # 近距離
            # 移動中
                execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 100
            # 停止中
                execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsStopping,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Ranposu.Search 20

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag
