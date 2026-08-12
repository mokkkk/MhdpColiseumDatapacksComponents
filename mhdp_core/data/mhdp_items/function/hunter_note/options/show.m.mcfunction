#> mhdp_items:hunter_note/options/show.m
#
# ハンターノート操作 オプション
#
# @within function mhdp_core:player/tick

# 表示
    $return run dialog show @s {\
        type:"minecraft:confirmation",title:{translate:"ui.hunter_note.options",bold:1b},body:[],can_close_with_escape:1b,\
        inputs:[\
            {type:"minecraft:boolean",key:"OptMoveJump",label:{translate:"ui.hunter_note.options.move_jump",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.tooltip"}}},initial:$(MoveJump),on_true:"1",on_false:"2"},\
            {type:"minecraft:boolean",key:"OptCameraEffect",label:{translate:"ui.hunter_note.options.camera_effect",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.camera_effect.tooltip"}}},initial:$(CameraEffect),on_true:"1",on_false:"2"}\
        ],\
        yes:{label:{translate:"ui.hunter_note.button_confirm"},action:{\
            $(ConfirmCommand)\
        }},\
        no:{label:{translate:"ui.hunter_note.button_cancel"}}\
    }

# 保持
    # dialog show @s {\
    #     type:"minecraft:confirmation",title:{translate:"ui.hunter_note.options",bold:1b},body:[],can_close_with_escape:1b,\
    #     inputs:[\
    #         {type:"minecraft:boolean",key:"OptMoveJump",label:{translate:"ui.hunter_note.options.move_jump",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.move_jump.tooltip"}}},initial:1b,on_true:"1",on_false:"2"},\
    #         {type:"minecraft:boolean",key:"OptCameraEffect",label:{translate:"ui.hunter_note.options.camera_effect",hover_event:{action:"show_text",value:{translate:"ui.hunter_note.options.camera_effect.tooltip"}}},initial:1b,on_true:"1",on_false:"2"}\
    #     ],\
    #     yes:{label:{translate:"ui.hunter_note.button_confirm"},action:{\
    #         type:"minecraft:dynamic/run_command",template:"trigger Ply.Ope.HunterNote.Options set $(OptCameraEffect)$(OptMoveJump)"\
    #     }},\
    #     no:{label:{translate:"ui.hunter_note.button_cancel"}}\
    # }
