within HVDCcomponents.Examples;
model TEST_2VSCs_DCcable_with_all_controls_bis
  OpenIPSL.Electrical.Buses.Bus bus1(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {116, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 1000, V_b = 230, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {108, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 1000) annotation (
    Placement(visible = true, transformation(origin = {84.4, 2}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0, startTime = 2) annotation (
    Placement(visible = true, transformation(origin = {-9, 31}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
    Placement(visible = true, transformation(origin = {-56, 40}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin = {3, 67}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 1E6) annotation (
    Placement(visible = true, transformation(origin = {-12, 58}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue Pref annotation (
    Placement(visible = true, transformation(origin = {20, 66}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-55, -27}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 640E3)) annotation (
    Placement(visible = true, transformation(origin = {-111, -5}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control2(Ib = 4350,Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 10E-3, wg = 314) annotation (
    Placement(visible = true, transformation(origin = {-168, 0}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 1000) annotation (
    Placement(visible = true, transformation(origin = {-231.6, 0}, extent = {{6, -5}, {-6, 5}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus bus2(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {-264, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus2(S_b = 1000, V_b = 230, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {-272, -36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step5(height = 500E6, startTime = 10) annotation (
    Placement(visible = true, transformation(origin = {-110, 44}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step4(height = 0, offset = 0, startTime = 2) annotation (
    Placement(visible = true, transformation(origin = {-110, 28}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step8(height = 640E3, offset = 0, startTime = 0) annotation (
    Placement(visible = true, transformation(origin = {-84, 66}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control1(Ib = 4350,Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 3E-3, wg = 314) annotation (
    Placement(visible = true, transformation(origin = {8, 2}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 640E3)) annotation (
    Placement(visible = true, transformation(origin = {-55, -5}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  HVDCcomponents.DC_cable dC_cable1(Vinit = 640E3, length = 200) annotation (
    Placement(visible = true, transformation(origin = {-81, -5}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.vdc_control vdc_control1(Cdc = 195E-6, Ksi = 0.7, controlType = "PI+filter", tr = 20E-3) annotation (
    Placement(visible = true, transformation(origin = {-35, 63}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  connect(voltageSensor1.p, capacitor1.p) annotation (
    Line(points = {{-62, 40}, {-68, 40}, {-68, 8}, {-56, 8}, {-56, 2}, {-54, 2}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, capacitor1.n) annotation (
    Line(points = {{-50, 40}, {-40, 40}, {-40, -12}, {-54, -12}}, color = {0, 0, 255}));
  connect(vdc_control1.vdc, voltageSensor1.v) annotation (
    Line(points = {{-44, 62}, {-50, 62}, {-50, 46}, {-56, 46}, {-56, 47}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control2.pin_p, capacitor2.p) annotation (
    Line(points = {{-157, -2}, {-133.5, -2}, {-133.5, 2}, {-110, 2}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control2.pin_n, capacitor2.n) annotation (
    Line(points = {{-157, -6}, {-126, -6}, {-126, -12}, {-110, -12}}, color = {0, 0, 255}));
  connect(pQ_sensor2.p, vSC_station_dq0_with_control2.p) annotation (
    Line(points = {{-226, 0}, {-179, 0}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.Pref, vdc_control1.Pref) annotation (
    Line(points = {{-4, 10}, {-22, 10}, {-22, 64}, {-28, 64}, {-28, 64}}, color = {0, 0, 127}));
  connect(division1.u1, vdc_control1.Pref) annotation (
    Line(points = {{-2, 70}, {-24, 70}, {-24, 64}, {-28, 64}, {-28, 64}}, color = {0, 0, 127}));
  connect(capacitor1.p, dC_cable1.pin_p1) annotation (
    Line(points = {{-54, 2}, {-66, 2}, {-66, -2}, {-74, -2}, {-74, -2}}, color = {0, 0, 255}));
  connect(capacitor1.n, dC_cable1.pin_n1) annotation (
    Line(points = {{-54, -12}, {-66, -12}, {-66, -8}, {-74, -8}, {-74, -8}}, color = {0, 0, 255}));
  connect(dC_cable1.pin_n, capacitor2.n) annotation (
    Line(points = {{-88, -8}, {-94, -8}, {-94, -12}, {-110, -12}, {-110, -12}}, color = {0, 0, 255}));
  connect(capacitor2.p, dC_cable1.pin_p) annotation (
    Line(points = {{-110, 2}, {-94, 2}, {-94, -2}, {-88, -2}, {-88, -2}}, color = {0, 0, 255}));
  connect(ground1.p, capacitor1.n) annotation (
    Line(points = {{-54, -20}, {-54, -20}, {-54, -12}, {-54, -12}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.pin_p, capacitor1.p) annotation (
    Line(points = {{-4, 0}, {-50, 0}, {-50, 2}, {-54, 2}, {-54, 2}}, color = {0, 0, 255}));
  connect(capacitor1.n, vSC_station_dq0_with_control1.pin_n) annotation (
    Line(points = {{-54, -12}, {-12, -12}, {-12, -4}, {-2, -4}, {-2, -4}}, color = {0, 0, 255}));
  connect(pQ_sensor1.p, vSC_station_dq0_with_control1.p) annotation (
    Line(points = {{78, 2}, {19, 2}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.Qref, step2.y) annotation (
    Line(points = {{-4, 6}, {-28, 6}, {-28, 31}, {-14.5, 31}}, color = {0, 0, 127}));
  connect(pQ_sensor1.n, bus1.p) annotation (
    Line(points = {{90, 2}, {116.4, 2}}, color = {0, 0, 255}));
  connect(bus1.p, infiniteBus1.p) annotation (
    Line(points = {{116, 2}, {132, 2}, {132, -34}, {125, -34}, {125, -34}, {123.5, -34}, {123.5, -34}, {118, -34}}, color = {0, 0, 255}));
  connect(bus2.p, infiniteBus2.p) annotation (
    Line(points = {{-264, 0}, {-290, 0}, {-290, -36}, {-282, -36}, {-282, -36}}, color = {0, 0, 255}));
  connect(pQ_sensor2.n, bus2.p) annotation (
    Line(points = {{-238, 0}, {-264, 0}, {-264, 0}, {-264, 0}}, color = {0, 0, 255}));
  connect(Pref.numberPort, division1.y) annotation (
    Line(points = {{15, 66}, {13, 66}, {13, 68}, {8, 68}}, color = {0, 0, 127}));
  connect(division1.u2, const2.y) annotation (
    Line(points = {{-4, 64}, {-6, 64}, {-6, 58}, {-8, 58}, {-8, 58}}, color = {0, 0, 127}));
  connect(step4.y, vSC_station_dq0_with_control2.Qref) annotation (
    Line(points = {{-114, 28}, {-136, 28}, {-136, 4}, {-156, 4}, {-156, 4}}, color = {0, 0, 127}));
  connect(step5.y, vSC_station_dq0_with_control2.Pref) annotation (
    Line(points = {{-114, 44}, {-146, 44}, {-146, 10}, {-156, 10}, {-156, 8}}, color = {0, 0, 127}));
  connect(vdc_control1.vdcref, step8.y) annotation (
    Line(points = {{-44, 66}, {-66, 66}, {-66, 66}, {-80, 66}, {-80, 66}}, color = {0, 0, 127}));
  annotation (
    Diagram(graphics = {Line(origin = {0, 8}, points = {{0, 0}})}, coordinateSystem(extent = {{-300, -100}, {150, 100}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-300, -100}, {150, 100}})),
    __OpenModelica_commandLineOptions = "");
end TEST_2VSCs_DCcable_with_all_controls_bis;
