within HVDCcomponents.TEST;

model TEST_2VSCs_DCcable_with_all_controls
  OpenIPSL.Electrical.Buses.Bus bus1(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {122, -294}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 1000, V_b = 230, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {114, -330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 1000) annotation(
    Placement(visible = true, transformation(origin = {90.4, -294}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-3, -265}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {-50, -256}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {9, -229}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 1E6) annotation(
    Placement(visible = true, transformation(origin = {-6, -238}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue Pref annotation(
    Placement(visible = true, transformation(origin = {26, -230}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-49, -323}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-105, -301}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control2(Ib = 4350,Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 10E-3, wg = 314) annotation(
    Placement(visible = true, transformation(origin = {-162, -296}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 1000) annotation(
    Placement(visible = true, transformation(origin = {-225.6, -296}, extent = {{6, -5}, {-6, 5}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus bus2(S_b = 1000, V_b = 230, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {-258, -296}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus2(S_b = 1000, V_b = 230, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {-266, -332}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = -300E6, offset = 600E6, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-104, -240}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-127, -247}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step5(height = 300E6, startTime = 2.2) annotation(
    Placement(visible = true, transformation(origin = {-104, -252}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step4(height = 200E6, offset = 100E6, startTime = 1.4) annotation(
    Placement(visible = true, transformation(origin = {-104, -268}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step6(height = -200E6, startTime = 2.6) annotation(
    Placement(visible = true, transformation(origin = {-104, -280}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-127, -273}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step7(height = -64E3, startTime = 3) annotation(
    Placement(visible = true, transformation(origin = {-78, -242}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step8(height = 64E3, offset = 640E3, startTime = 1.8) annotation(
    Placement(visible = true, transformation(origin = {-78, -230}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(
    Placement(visible = true, transformation(origin = {-58, -234}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control1(Ib = 4350,Lr = 100E-3, Rr = 0.0125, Vb = 230E3, tr = 3E-3, wg = 314) annotation(
    Placement(visible = true, transformation(origin = {14, -294}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-49, -301}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  HVDCcomponents.DC_cable dC_cable1(Vinit = 640E3, length = 200) annotation(
    Placement(visible = true, transformation(origin = {-75, -301}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.vdc_control vdc_control1(Cdc = 195E-6, Ksi = 0.7, controlType = "PI+filter", tr = 20E-3) annotation(
    Placement(visible = true, transformation(origin = {-29, -233}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  connect(voltageSensor1.p, capacitor1.p) annotation(
    Line(points = {{-56, -256}, {-50, -256}, {-50, -294}, {-49, -294}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, capacitor1.n) annotation(
    Line(points = {{-44, -256}, {-34, -256}, {-34, -308}, {-49, -308}}, color = {0, 0, 255}));
  connect(vdc_control1.vdc, voltageSensor1.v) annotation(
    Line(points = {{-37, -234}, {-50, -234}, {-50, -249}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control2.pin_p, capacitor2.p) annotation(
    Line(points = {{-151, -298}, {-132, -298}, {-132, -294}, {-105, -294}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control2.pin_n, capacitor2.n) annotation(
    Line(points = {{-151, -302}, {-120, -302}, {-120, -308}, {-105, -308}}, color = {0, 0, 255}));
  connect(pQ_sensor2.p, vSC_station_dq0_with_control2.p) annotation(
    Line(points = {{-220, -296}, {-173, -296}}, color = {0, 0, 255}));
  connect(add1.y, vSC_station_dq0_with_control2.Pref) annotation(
    Line(points = {{-132.5, -247}, {-144, -247}, {-144, -287}, {-151, -287}}, color = {0, 0, 127}));
  connect(add2.y, vSC_station_dq0_with_control2.Qref) annotation(
    Line(points = {{-132.5, -273}, {-138, -273}, {-138, -292}, {-151, -292}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control1.Pref, vdc_control1.Pref) annotation(
    Line(points = {{2, -285}, {-16, -285}, {-16, -232}, {-21, -232}}, color = {0, 0, 127}));
  connect(division1.u1, vdc_control1.Pref) annotation(
    Line(points = {{3, -226}, {-18, -226}, {-18, -232}, {-21, -232}}, color = {0, 0, 127}));
  connect(vdc_control1.vdcref, add3.y) annotation(
    Line(points = {{-37, -230}, {-49.5, -230}, {-49.5, -234}, {-54, -234}}, color = {0, 0, 127}));
  connect(capacitor1.p, dC_cable1.pin_p1) annotation(
    Line(points = {{-49, -294}, {-60, -294}, {-60, -298}, {-68, -298}}, color = {0, 0, 255}));
  connect(capacitor1.n, dC_cable1.pin_n1) annotation(
    Line(points = {{-49, -308}, {-60, -308}, {-60, -304}, {-68, -304}}, color = {0, 0, 255}));
  connect(dC_cable1.pin_n, capacitor2.n) annotation(
    Line(points = {{-82, -304}, {-91, -304}, {-91, -308}, {-105, -308}}, color = {0, 0, 255}));
  connect(capacitor2.p, dC_cable1.pin_p) annotation(
    Line(points = {{-105, -294}, {-88, -294}, {-88, -298}, {-82, -298}}, color = {0, 0, 255}));
  connect(ground1.p, capacitor1.n) annotation(
    Line(points = {{-49, -316}, {-49, -308}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.pin_p, capacitor1.p) annotation(
    Line(points = {{3, -296}, {-23, -296}, {-23, -294}, {-49, -294}}, color = {0, 0, 255}));
  connect(capacitor1.n, vSC_station_dq0_with_control1.pin_n) annotation(
    Line(points = {{-49, -308}, {-6, -308}, {-6, -300}, {3, -300}}, color = {0, 0, 255}));
  connect(pQ_sensor1.p, vSC_station_dq0_with_control1.p) annotation(
    Line(points = {{84, -294}, {25, -294}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control1.Qref, step2.y) annotation(
    Line(points = {{2, -290}, {-22, -290}, {-22, -265}, {-8.5, -265}}, color = {0, 0, 127}));
  connect(add3.u2, step7.y) annotation(
    Line(points = {{-63, -236}, {-70, -236}, {-70, -242}, {-74, -242}}, color = {0, 0, 127}));
  connect(step8.y, add3.u1) annotation(
    Line(points = {{-74, -230}, {-74, -232}, {-63, -232}}, color = {0, 0, 127}));
  connect(step6.y, add2.u2) annotation(
    Line(points = {{-108, -280}, {-116, -280}, {-116, -276}, {-121, -276}}, color = {0, 0, 127}));
  connect(step4.y, add2.u1) annotation(
    Line(points = {{-108, -268}, {-114.5, -268}, {-114.5, -270}, {-121, -270}}, color = {0, 0, 127}));
  connect(step5.y, add1.u2) annotation(
    Line(points = {{-108, -252}, {-114.5, -252}, {-114.5, -250}, {-121, -250}}, color = {0, 0, 127}));
  connect(step1.y, add1.u1) annotation(
    Line(points = {{-108, -240}, {-114, -240}, {-114, -244}, {-121, -244}}, color = {0, 0, 127}));
  connect(pQ_sensor1.n, bus1.p) annotation(
    Line(points = {{96, -294}, {122, -294}}, color = {0, 0, 255}));
  connect(bus1.p, infiniteBus1.p) annotation(
    Line(points = {{122, -294}, {138, -294}, {138, -330}, {124, -330}}, color = {0, 0, 255}));
  connect(bus2.p, infiniteBus2.p) annotation(
    Line(points = {{-258, -296}, {-284, -296}, {-284, -332}, {-276, -332}}, color = {0, 0, 255}));
  connect(pQ_sensor2.n, bus2.p) annotation(
    Line(points = {{-232, -296}, {-258, -296}}, color = {0, 0, 255}));
  connect(Pref.numberPort, division1.y) annotation(
    Line(points = {{21, -230}, {21, -227.5}, {19, -227.5}, {19, -229}, {14.5, -229}}, color = {0, 0, 127}));
  connect(division1.u2, const2.y) annotation(
    Line(points = {{3, -232}, {-4.5, -232}, {-4.5, -238}, {-2, -238}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Line(origin = {5.41703, -288.086}, points = {{0, 0}})}, coordinateSystem(extent = {{-300, -600}, {150, 100}})),
    Icon(coordinateSystem(extent = {{-300, -600}, {150, 100}})),
    __OpenModelica_commandLineOptions = "");


end TEST_2VSCs_DCcable_with_all_controls;
