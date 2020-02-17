within HVDCcomponents.TEST;

model TEST_3VSCs_DCcable_with_all_controls
  OpenIPSL.Electrical.Buses.Bus bus1(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {116, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 1000, V_b = 230, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {120, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 1000) annotation(
    Placement(visible = true, transformation(origin = {80.4, 8}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-13, 37}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {-60, 46}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-1, 73}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 1E6) annotation(
    Placement(visible = true, transformation(origin = {-16, 64}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue Pref annotation(
    Placement(visible = true, transformation(origin = {16, 72}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-59, -21}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-115, 1}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control2(Ib = 4350,Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 10E-3, wg = 314) annotation(
    Placement(visible = true, transformation(origin = {-172, 6}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 1000) annotation(
    Placement(visible = true, transformation(origin = {-235.6, 6}, extent = {{6, -5}, {-6, 5}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus bus2(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {-264, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus2(S_b = 1000, V_b = 230, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {-276, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = -300E6, offset = 600E6, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-114, 62}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-137, 55}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step5(height = 300E6, startTime = 2.2) annotation(
    Placement(visible = true, transformation(origin = {-114, 50}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step4(height = 200E6, offset = 100E6, startTime = 1.4) annotation(
    Placement(visible = true, transformation(origin = {-114, 34}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step6(height = -200E6, startTime = 2.6) annotation(
    Placement(visible = true, transformation(origin = {-114, 22}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-137, 29}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step7(height = -64E3, startTime = 3) annotation(
    Placement(visible = true, transformation(origin = {-88, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step8(height = 64E3, offset = 640E3, startTime = 1.8) annotation(
    Placement(visible = true, transformation(origin = {-88, 72}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(
    Placement(visible = true, transformation(origin = {-68, 68}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control1(Ib = 4350,Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 3E-3, wg = 314) annotation(
    Placement(visible = true, transformation(origin = {4,8}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-59, 1}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  HVDCcomponents.DC_cable dC_cable1(Vinit = 640E3, length = 200) annotation(
    Placement(visible = true, transformation(origin = {-85, 1}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.vdc_control vdc_control1(Cdc = 195E-6, Ksi = 0.7, controlType = "PI+filter", tr = 20E-3) annotation(
    Placement(visible = true, transformation(origin = {-39, 69}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control3(Ib = 4350, Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 10E-3, wg = 314) annotation(
    Placement(visible = true, transformation(origin = {-174, -92}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor3(S_b = 1000) annotation(
    Placement(visible = true, transformation(origin = {-225.6, -92}, extent = {{6, -5}, {-6, 5}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus bus3(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {-252, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus3(S_b = 1000, V_b = 230, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {-274, -132}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor3(C = 195E-6, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-137, -19}, extent = {{-7, -7}, {7, 7}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor4(C = 195E-6, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-137, -69}, extent = {{-7, -7}, {7, 7}}, rotation = 180)));
  HVDCcomponents.DC_cable dC_cable2(Vinit = 640E3, length = 200) annotation(
    Placement(visible = true, transformation(origin = {-137, -43}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Sources.Step step3(height = 0, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-111, -99}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step9(height = 300E6, offset = 0, startTime = 4) annotation(
    Placement(visible = true, transformation(origin = {-109, -79}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
equation
  connect(vSC_station_dq0_with_control3.Pref, step9.y) annotation(
    Line(points = {{-163, -83}, {-44, -83}, {-44, -79}, {-114.5, -79}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control3.Qref, step3.y) annotation(
    Line(points = {{-163, -88}, {-124, -88}, {-124, -99}, {-116.5, -99}}, color = {0, 0, 127}));
  connect(step4.y, add2.u1) annotation(
    Line(points = {{-118, 34}, {-119.5, 34}, {-119.5, 32}, {-131, 32}}, color = {0, 0, 127}));
  connect(add2.u2, step6.y) annotation(
    Line(points = {{-131, 26}, {-124, 26}, {-124, 22}, {-118, 22}}, color = {0, 0, 127}));
  connect(capacitor4.p, vSC_station_dq0_with_control3.pin_p) annotation(
    Line(points = {{-130, -69}, {-130, -94}, {-163, -94}}, color = {0, 0, 255}));
  connect(capacitor4.n, vSC_station_dq0_with_control3.pin_n) annotation(
    Line(points = {{-144, -69}, {-144, -98}, {-163, -98}}, color = {0, 0, 255}));
  connect(dC_cable2.pin_p1, capacitor4.p) annotation(
    Line(points = {{-134, -50}, {-134, -55.5}, {-130, -55.5}, {-130, -69}}, color = {0, 0, 255}));
  connect(dC_cable2.pin_n1, capacitor4.n) annotation(
    Line(points = {{-140, -50}, {-140, -21.5}, {-144, -21.5}, {-144, -69}}, color = {0, 0, 255}));
  connect(capacitor3.p, dC_cable2.pin_p) annotation(
    Line(points = {{-130, -19}, {-130, -31}, {-134, -31}, {-134, -36}}, color = {0, 0, 255}));
  connect(capacitor3.n, dC_cable2.pin_n) annotation(
    Line(points = {{-144, -19}, {-144, 10.5}, {-140, 10.5}, {-140, -36}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control2.pin_p, capacitor3.p) annotation(
    Line(points = {{-161, 4}, {-136, 4}, {-136, 6.5}, {-130, 6.5}, {-130, -19}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control2.pin_n, capacitor3.n) annotation(
    Line(points = {{-161, 0}, {-144, 0}, {-144, -19}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control3.p, pQ_sensor3.p) annotation(
    Line(points = {{-185, -92}, {-220, -92}}, color = {0, 0, 255}));
  connect(bus3.p, pQ_sensor3.n) annotation(
    Line(points = {{-252, -98}, {-234, -98}, {-234, -92}, {-232, -92}}, color = {0, 0, 255}));
  connect(bus3.p, infiniteBus3.p) annotation(
    Line(points = {{-252, -98}, {-292, -98}, {-292, -132}, {-284, -132}}, color = {0, 0, 255}));
  connect(bus2.p, infiniteBus2.p) annotation(
    Line(points = {{-264, 0}, {-290, 0}, {-290, -38}, {-286, -38}}, color = {0, 0, 255}));
  connect(voltageSensor1.p, capacitor1.p) annotation(
    Line(points = {{-66, 46}, {-72, 46}, {-72, 14}, {-59, 14}, {-59, 8}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, capacitor1.n) annotation(
    Line(points = {{-54, 46}, {-54, 36}, {-44, 36}, {-44, -6}, {-59, -6}}, color = {0, 0, 255}));
  connect(vdc_control1.vdc, voltageSensor1.v) annotation(
    Line(points = {{-47, 68}, {-54, 68}, {-54, 62}, {-60, 62}, {-60, 53}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control2.pin_p, capacitor2.p) annotation(
    Line(points = {{-161, 4}, {-115, 4}, {-115, 8}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control2.pin_n, capacitor2.n) annotation(
    Line(points = {{-161, 0}, {-115, 0}, {-115, -6}}, color = {0, 0, 255}));
  connect(pQ_sensor2.p, vSC_station_dq0_with_control2.p) annotation(
    Line(points = {{-230, 6}, {-183, 6}}, color = {0, 0, 255}));
  connect(add1.y, vSC_station_dq0_with_control2.Pref) annotation(
    Line(points = {{-142.5, 55}, {-154, 55}, {-154, 15}, {-161, 15}}, color = {0, 0, 127}));
  connect(add2.y, vSC_station_dq0_with_control2.Qref) annotation(
    Line(points = {{-142.5, 29}, {-148, 29}, {-148, 10}, {-161, 10}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control1.Pref, vdc_control1.Pref) annotation(
    Line(points = {{-8, 17}, {-14, 17}, {-14, 15}, {-26, 15}, {-26, 70}, {-31, 70}}, color = {0, 0, 127}));
  connect(division1.u1, vdc_control1.Pref) annotation(
    Line(points = {{-7, 76}, {24, 76}, {24, 70}, {-31, 70}}, color = {0, 0, 127}));
  connect(vdc_control1.vdcref, add3.y) annotation(
    Line(points = {{-47, 72}, {15.5, 72}, {15.5, 68}, {-64, 68}}, color = {0, 0, 127}));
  connect(capacitor1.p, dC_cable1.pin_p1) annotation(
    Line(points = {{-59, 8}, {-22, 8}, {-22, 4}, {-78, 4}}, color = {0, 0, 255}));
  connect(capacitor1.n, dC_cable1.pin_n1) annotation(
    Line(points = {{-59, -6}, {-70, -6}, {-70, -2}, {-78, -2}}, color = {0, 0, 255}));
  connect(dC_cable1.pin_n, capacitor2.n) annotation(
    Line(points = {{-92, -2}, {-92, -6}, {-115, -6}}, color = {0, 0, 255}));
  connect(capacitor2.p, dC_cable1.pin_p) annotation(
    Line(points = {{-115, 8}, {-92, 8}, {-92, 4}}, color = {0, 0, 255}));
  connect(ground1.p, capacitor1.n) annotation(
    Line(points = {{-59, -14}, {-59, -19}, {-52, -19}, {-52, -20}, {-59, -20}, {-59, -6}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.pin_p, capacitor1.p) annotation(
    Line(points = {{-7, 6}, {51, 6}, {51, 8}, {-59, 8}}, color = {0, 0, 255}));
  connect(capacitor1.n, vSC_station_dq0_with_control1.pin_n) annotation(
    Line(points = {{-59, -6}, {-16, -6}, {-16, 2}, {-7, 2}}, color = {0, 0, 255}));
  connect(pQ_sensor1.p, vSC_station_dq0_with_control1.p) annotation(
    Line(points = {{74, 8}, {15, 8}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.Qref, step2.y) annotation(
    Line(points = {{-8, 12}, {-32, 12}, {-32, 37}, {-18.5, 37}}, color = {0, 0, 127}));
  connect(add3.u2, step7.y) annotation(
    Line(points = {{-73, 66}, {-84, 66}, {-84, 60}}, color = {0, 0, 127}));
  connect(step8.y, add3.u1) annotation(
    Line(points = {{-84, 72}, {-76, 72}, {-76, 70}, {-73, 70}}, color = {0, 0, 127}));
  connect(step5.y, add1.u2) annotation(
    Line(points = {{-118, 50}, {-40.5, 50}, {-40.5, 52}, {-131, 52}}, color = {0, 0, 127}));
  connect(step1.y, add1.u1) annotation(
    Line(points = {{-118, 62}, {-118, 58}, {-131, 58}}, color = {0, 0, 127}));
  connect(pQ_sensor1.n, bus1.p) annotation(
    Line(points = {{86, 8}, {109.2, 8}, {109.2, 2}, {116.4, 2}}, color = {0, 0, 255}));
  connect(bus1.p, infiniteBus1.p) annotation(
    Line(points = {{116, 2}, {132, 2}, {132, -44}, {130, -44}}, color = {0, 0, 255}));
  connect(pQ_sensor2.n, bus2.p) annotation(
    Line(points = {{-242, 6}, {-245, 6}, {-245, 0}, {-264, 0}}, color = {0, 0, 255}));
  connect(Pref.numberPort, division1.y) annotation(
    Line(points = {{11, 72}, {11, 72.5}, {9, 72.5}, {9, 73}, {4.5, 73}}, color = {0, 0, 127}));
  connect(division1.u2, const2.y) annotation(
    Line(points = {{-7, 70}, {-7, 107}, {-9, 107}, {-9, 64}, {-12, 64}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Line(origin = {-3.58127, 13.0138}, points = {{0, 0}})}, coordinateSystem(extent = {{-300, -150}, {150, 100}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-300, -150}, {150, 100}})),
    __OpenModelica_commandLineOptions = "");


end TEST_3VSCs_DCcable_with_all_controls;
