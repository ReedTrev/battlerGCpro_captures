extends Node

@export var device: int = 0
var output_file = FileAccess.open("output.txt", FileAccess.WRITE)
@export var fps_counter: TextEdit


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    fps_counter.text = "%dfps" % Engine.get_frames_per_second()
    var datum = "%f, %f\n" % [Time.get_unix_time_from_system(), Input.get_joy_axis(device, JOY_AXIS_TRIGGER_RIGHT)]
    #var datum = "%f, %f\n" % [Time.get_unix_time_from_system(), Input.get_joy_axis(device, JOY_AXIS_TRIGGER_LEFT)]
    output_file.store_string(datum)


func _notification(what):
    if what == NOTIFICATION_WM_CLOSE_REQUEST:
        output_file.close()
        get_tree().quit()
