within HVDCcomponents;
model vdc_control

  parameter String controlType = "PI" "PI, PI+filter or IP";
  parameter Real Cdc = 195E-6 "Capacitance of the DC grid in F";
  parameter Real tr = 20E-3 "response time of the controller in s";
  parameter Real Ksi = 0.7 "damping coefficient";
   parameter Real vdc0 = 230E3 "Reference DC voltage";

  HVDCcomponents.vdc_controls.vdc_IP_control vdc_IP_control1(Cdc = Cdc, Ksi = Ksi, tr = tr) annotation (
    Placement(visible = true, transformation(origin = {2, 20}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  HVDCcomponents.vdc_controls.vdc_PI_control vdc_PI_control1(Cdc = Cdc, Ksi = Ksi, tr = tr) annotation (
    Placement(visible = true, transformation(origin = {2, 70}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdcref annotation (
    Placement(visible = true, transformation(origin = {-120, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdc annotation (
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pref annotation (
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.vdc_controls.vdc_PI_control_with_filter vdc_PI_control_with_filter1(Cdc = Cdc, Ksi = Ksi, tr = tr, vdc0 = vdc0) annotation (
    Placement(visible = true, transformation(origin = {2, -30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));

equation

  if controlType == "PI" then
    vdc = vdc_PI_control1.vdc;
    vdcref = vdc_PI_control1.vdcref;
    vdc_PI_control1.Pref = Pref;
vdc_IP_control1.vdc = 0;
vdc_IP_control1.vdcref = 0;
vdc_PI_control_with_filter1.vdc = 0;
vdc_PI_control_with_filter1.vdcref = 0;
  elseif controlType == "PI+filter" then
    vdc = vdc_PI_control_with_filter1.vdc;
    vdcref = vdc_PI_control_with_filter1.vdcref;
    vdc_PI_control_with_filter1.Pref = Pref;
vdc_IP_control1.vdc = 0;
vdc_IP_control1.vdcref = 0;
vdc_PI_control1.vdc = 0;
vdc_PI_control1.vdcref = 0;
  elseif controlType == "IP" then
    vdc = vdc_IP_control1.vdc;
    vdcref = vdc_IP_control1.vdcref;
    vdc_IP_control1.Pref = Pref;
vdc_PI_control1.vdc = 0;
vdc_PI_control1.vdcref = 0;
vdc_PI_control_with_filter1.vdc = 0;
vdc_PI_control_with_filter1.vdcref = 0;
  else
    vdc = vdc_IP_control1.vdc;
    vdcref = vdc_IP_control1.vdcref;
    vdc_IP_control1.Pref = Pref;
vdc_PI_control1.vdc = 0;
vdc_PI_control1.vdcref = 0;
vdc_PI_control_with_filter1.vdc = 0;
vdc_PI_control_with_filter1.vdcref = 0;
  end if;
annotation (
    Icon);
end vdc_control;
