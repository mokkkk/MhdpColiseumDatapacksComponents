#> mhdp_monster_dino:core/tick/on_search/update_search
#
# tick処理 警戒中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Dino",DistNear:12,DistFar:30,Fov:170.0}

# 発見度更新
    # 非遮蔽・視野内
        # スプリント中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 1000
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 300
            # 遠
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 50
        # 立ち中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 1000
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 250
            # 遠
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 30
        # スニーク中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 250
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 100
            # 遠
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 20
    # 非遮蔽・視野外
        # スプリント中
            # 近
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 150
            # 中
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 100
            # 遠
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 80
        # 立ち中
            # 近
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 50
            # 中
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 30
            # 遠
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 20
        # スニーク中
            # 近
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 20
            # 中
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 10
            # 遠
                # execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 20
    # 遮蔽・視野内
        # スプリント中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 150
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 100
            # 遠
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Far,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 50
        # 立ち中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 100
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 50
            # 遠
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 25
        # スニーク中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 10
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 5
            # 遠
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Search 10
    # 遮蔽・視野外は上昇無し

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag

# 別エリアのプレイヤーの警戒度減少
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Dino,scores={Mns.Dino.Search=1..}] run scoreboard players remove @s Mns.Dino.Search 40

# 全プレイヤーの警戒度が0以下になった場合、未発見に戻る
    execute unless entity @a[tag=Ply.State.PlayingQuest,scores={Mns.Dino.Search=1..}] run function mhdp_monster_dino:core/tick/on_relax/start
