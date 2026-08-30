#> mhdp_items:hunter_note/show_menu/training/show.m
#
# ハンターノート操作 メインメニュー 訓練中のメニュー表示
#
# @within function mhdp_core:player/tick

# 表示
    # $return run dialog show @s {\
    #     type:"minecraft:multi_action",\
    #     title:{translate:"ui.hunter_note.menu.quest",bold:1b},external_title:{translate:"ui.hunter_note.menu.quest"},\
    #     body:[],inputs:[],can_close_with_escape:1b,after_action:"wait_for_response",columns:1,\
    #     actions:[\
    #         {label:[{translate:"ui.hunter_note.menu.quest.retire"}," ($(RetiredPlayerCount) / $(PlayerCount))"],tooltip:{translate:"ui.hunter_note.menu.quest.retire.tooltip"},"action": {\
    #             "type": "minecraft:run_command","command": "trigger Ply.Ope.HunterNote.ShowMenu set 21"\
    #         }}\
    #     ],\
    #     exit_action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:show_dialog",dialog:"mhdp_items:hunter_note/general"}}\
    # }

# 保持
    dialog show @s {\
        type:"minecraft:multi_action",\
        title:{translate:"ui.hunter_note.menu.training",bold:1b},external_title:{translate:"ui.hunter_note.menu.training"},\
        body:[],inputs:[],can_close_with_escape:1b,after_action:"wait_for_response",columns:1,\
        actions:[\
            {label:[{translate:"ui.hunter_note.menu.training.show_weapon_guide"}],tooltip:{translate:"ui.hunter_note.menu.training.show_weapon_guide.tooltip"},"action": {\
                "type": "minecraft:run_command","command": "trigger Ply.Ope.HunterNote.ShowMenu set 11"\
            }},\
            {label:[{translate:"ui.hunter_note.menu.training.show_option"}],tooltip:{translate:"ui.hunter_note.menu.training.show_option.tooltip"},"action": {\
                "type": "minecraft:run_command","command": "trigger Ply.Ope.HunterNote.ShowMenu set 12"\
            }}\
        ],\
        exit_action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:show_dialog",dialog:"mhdp_items:hunter_note/general"}}\
    }
