within HVDCcomponents.TEST;

model TEST_VSC_with_all_controls
  OpenIPSL.Electrical.Buses.Bus bus1(S_b = 1000, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 1000, V_b = 320, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {62, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-93, 29}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 1000) annotation(
    Placement(visible = true, transformation(origin = {56.4, 2}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 700, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-89, -15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 200E6, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-45, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent1 annotation(
    Placement(visible = true, transformation(origin = {-83, 13}, extent = {{-7, 7}, {7, -7}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {-56, 38}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step3(height = 0, offset = 640E3, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-72, 56}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HVDCcomponents.vdc_controls.vdc_PI_control vdc_PI_control1(Cdc = 7.8125e-04, Ksi = 0.7, tr = 0.03) annotation(
    Placement(visible = true, transformation(origin = {-39, 59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control1(Lr = 0.05, Rr = 0.5, tr = 0.003, wg = 314) annotation(
    Placement(visible = true, transformation(origin = {-2, 2}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 7.8125e-04, v(start = 640E3)) annotation(
    Placement(visible = true, transformation(origin = {-63, 13}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {3, 67}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 1E6) annotation(
    Placement(visible = true, transformation(origin = {-12, 58}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue Pref annotation(
    Placement(visible = true, transformation(origin = {22, 68}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
equation
  connect(vdc_PI_control1.vdcref, step3.y) annotation(
    Line(points = {{-47, 62}, {-60, 62}, {-60, 56}, {-68, 56}}, color = {0, 0, 127}));
  connect(step1.y, signalCurrent1.i) annotation(
    Line(points = {{-84, -14}, {-78, -14}, {-78, 0}, {-96, 0}, {-96, 14}, {-92, 14}}, color = {0, 0, 127}));
  connect(vdc_PI_control1.Pref, vSC_station_dq0_with_control1.Pref) annotation(
    Line(points = {{-31, 59}, {-24, 59}, {-24, 10}, {-14, 10}}, color = {0, 0, 127}));
  connect(division1.u1, vdc_PI_control1.Pref) annotation(
    Line(points = {{-4, 70}, {-31, 70}, {-31, 59}}, color = {0, 0, 127}));
  connect(vdc_PI_control1.vdc, voltageSensor1.v) annotation(
    Line(points = {{-47, 56}, {-56, 56}, {-56, 44}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control1.Qref, step2.y) annotation(
    Line(points = {{-14, 6}, {-28, 6}, {-28, -19}, {-39.5, -19}}, color = {0, 0, 127}));
  connect(Pref.numberPort, division1.y) annotation(
    Line(points = {{18, 68}, {8, 68}, {8, 68}, {8, 68}}, color = {0, 0, 127}));
  connect(division1.u2, const2.y) annotation(
    Line(points = {{-4, 64}, {-6, 64}, {-6, 58}, {-8, 58}, {-8, 58}}, color = {0, 0, 127}));
  connect(voltageSensor1.n, capacitor1.n) annotation(
    Line(points = {{-50, 38}, {-44, 38}, {-44, 6}, {-62, 6}, {-62, 6}}, color = {0, 0, 255}));
  connect(voltageSensor1.p, capacitor1.p) annotation(
    Line(points = {{-62, 38}, {-62, 38}, {-62, 20}, {-62, 20}}, color = {0, 0, 255}));
  connect(capacitor1.n, vSC_station_dq0_with_control1.pin_n) annotation(
    Line(points = {{-62, 6}, {-52, 6}, {-52, -4}, {-12, -4}, {-12, -4}}, color = {0, 0, 255}));
  connect(capacitor1.p, vSC_station_dq0_with_control1.pin_p) annotation(
    Line(points = {{-62, 20}, {-40, 20}, {-40, 0}, {-14, 0}, {-14, 0}}, color = {0, 0, 255}));
  connect(signalCurrent1.n, capacitor1.n) annotation(
    Line(points = {{-82, 6}, {-62, 6}, {-62, 6}, {-62, 6}}, color = {0, 0, 255}));
  connect(signalCurrent1.p, capacitor1.p) annotation(
    Line(points = {{-82, 20}, {-64, 20}, {-64, 20}, {-62, 20}}, color = {0, 0, 255}));
  connect(pQ_sensor1.p, vSC_station_dq0_with_control1.p) annotation(
    Line(points = {{50, 2}, {10, 2}, {10, 2}, {10, 2}}, color = {0, 0, 255}));
  connect(pQ_sensor1.n, bus1.p) annotation(
    Line(points = {{62, 2}, {70, 2}}, color = {0, 0, 255}));
  connect(ground1.p, signalCurrent1.p) annotation(
    Line(points = {{-93, 36}, {-84, 36}, {-84, 20}, {-82, 20}}, color = {0, 0, 255}));
  connect(bus1.p, infiniteBus1.p) annotation(
    Line(points = {{70, 2}, {86, 2}, {86, -34}, {72, -34}}, color = {0, 0, 255}));
  annotation(
    Diagram(graphics = {Line(origin = {0, 8}, points = {{0, 0}})}));

end TEST_VSC_with_all_controls;
