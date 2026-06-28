#> mhdp_monster_dino:core/tick/on_relax/update_caution
#
# tick処理 非発見時
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Dino",DistNear:12,DistFar:38,Fov:60.0}

# 警戒度更新
    # 非遮蔽・視野内
        # スプリント中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 300
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 200
            # 遠
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 50
        # 立ち中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 250
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 100
            # 遠
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 25
        # スニーク中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 250
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 40
            # 遠
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 10
    # 非遮蔽・視野外
        # スプリント中
            # 近
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 150
            # 中
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 50
            # 遠
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 30
        # 立ち中
            # 近
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 50
            # 中
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 30
            # 遠
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 20
        # スニーク中
            # 近
                execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 20
            # 中
                # execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 20
            # 遠
                # execute as @a[tag=!Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=!Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 20
    # 遮蔽・視野内
        # スプリント中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 150
            # 中
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 50
            # 遠
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.Far,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 50
        # 立ち中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 30
            # 中
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 100
            # 遠
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=!Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 25
        # スニーク中
            # 近
                execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 5
            # 中
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Middle,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 40
            # 遠
                # execute as @a[tag=Mns.Temp.Situation.InFov,tag=!Mns.Temp.Situation.IsSprinting,tag=Mns.Temp.Situation.IsSneaking,tag=Mns.Temp.Situation.Far,tag=Mns.Temp.Situation.IsCovering] run scoreboard players add @s Mns.Dino.Caution 10
    # 遮蔽・視野外は上昇無し

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag
