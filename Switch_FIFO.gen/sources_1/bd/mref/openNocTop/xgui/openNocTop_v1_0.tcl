# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "X" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "if_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "pkt_no_field_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "total_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "x_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "y_size" -parent ${Page_0}


}

proc update_PARAM_VALUE.X { PARAM_VALUE.X } {
	# Procedure called to update X when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.X { PARAM_VALUE.X } {
	# Procedure called to validate X
	return true
}

proc update_PARAM_VALUE.Y { PARAM_VALUE.Y } {
	# Procedure called to update Y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Y { PARAM_VALUE.Y } {
	# Procedure called to validate Y
	return true
}

proc update_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to update data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to validate data_width
	return true
}

proc update_PARAM_VALUE.if_width { PARAM_VALUE.if_width } {
	# Procedure called to update if_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.if_width { PARAM_VALUE.if_width } {
	# Procedure called to validate if_width
	return true
}

proc update_PARAM_VALUE.pkt_no_field_size { PARAM_VALUE.pkt_no_field_size } {
	# Procedure called to update pkt_no_field_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.pkt_no_field_size { PARAM_VALUE.pkt_no_field_size } {
	# Procedure called to validate pkt_no_field_size
	return true
}

proc update_PARAM_VALUE.total_width { PARAM_VALUE.total_width } {
	# Procedure called to update total_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.total_width { PARAM_VALUE.total_width } {
	# Procedure called to validate total_width
	return true
}

proc update_PARAM_VALUE.x_size { PARAM_VALUE.x_size } {
	# Procedure called to update x_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.x_size { PARAM_VALUE.x_size } {
	# Procedure called to validate x_size
	return true
}

proc update_PARAM_VALUE.y_size { PARAM_VALUE.y_size } {
	# Procedure called to update y_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.y_size { PARAM_VALUE.y_size } {
	# Procedure called to validate y_size
	return true
}


proc update_MODELPARAM_VALUE.X { MODELPARAM_VALUE.X PARAM_VALUE.X } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.X}] ${MODELPARAM_VALUE.X}
}

proc update_MODELPARAM_VALUE.Y { MODELPARAM_VALUE.Y PARAM_VALUE.Y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Y}] ${MODELPARAM_VALUE.Y}
}

proc update_MODELPARAM_VALUE.data_width { MODELPARAM_VALUE.data_width PARAM_VALUE.data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width}] ${MODELPARAM_VALUE.data_width}
}

proc update_MODELPARAM_VALUE.pkt_no_field_size { MODELPARAM_VALUE.pkt_no_field_size PARAM_VALUE.pkt_no_field_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pkt_no_field_size}] ${MODELPARAM_VALUE.pkt_no_field_size}
}

proc update_MODELPARAM_VALUE.x_size { MODELPARAM_VALUE.x_size PARAM_VALUE.x_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.x_size}] ${MODELPARAM_VALUE.x_size}
}

proc update_MODELPARAM_VALUE.y_size { MODELPARAM_VALUE.y_size PARAM_VALUE.y_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.y_size}] ${MODELPARAM_VALUE.y_size}
}

proc update_MODELPARAM_VALUE.total_width { MODELPARAM_VALUE.total_width PARAM_VALUE.total_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.total_width}] ${MODELPARAM_VALUE.total_width}
}

proc update_MODELPARAM_VALUE.if_width { MODELPARAM_VALUE.if_width PARAM_VALUE.if_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.if_width}] ${MODELPARAM_VALUE.if_width}
}

