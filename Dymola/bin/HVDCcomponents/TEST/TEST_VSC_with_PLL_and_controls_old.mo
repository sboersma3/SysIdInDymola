within HVDCcomponents.TEST;

model TEST_VSC_with_PLL_and_controls_old
  OpenIPSL.Electrical.Buses.Bus bus1(S_b = 100, displayPF = true, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 100, V_b = 400, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {62, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-83, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 100) annotation(
    Placement(visible = true, transformation(origin = {56.4, 2}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = -185E6, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-59, 37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 400E3)  annotation(
    Placement(visible = true, transformation(origin = {-84, 12}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Sources.Step step(height = 700E6, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-57, 63}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL vSC_station_dq0_with_control_PLL(Lr = 0.05, Rr = 0.5, tr = 0.003)  annotation(
    Placement(visible = true, transformation(origin = {-17.0635, 15.8381}, extent = {{-26.9365, -17.5087}, {53.873, 16.1619}}, rotation = 0)));
equation
  connect(pQ_sensor1.n, bus1.p) annotation(
    Line(points = {{62, 2}, {70, 2}}, color = {0, 0, 255}));
  connect(bus1.p, infiniteBus1.p) annotation(
    Line(points = {{70, 2}, {86, 2}, {86, -34}, {72, -34}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground1.p) annotation(
    Line(points = {{-84, 4}, {-86, 4}, {-86, -8}, {-83, -8}}, color = {0, 0, 255}));
  connect(constantVoltage.p, vSC_station_dq0_with_control_PLL.pin_p) annotation(
    Line(points = {{-84, 20}, {-58, 20}, {-58, 12}, {-28, 12}, {-28, 12}}, color = {0, 0, 255}));
  connect(constantVoltage.n, vSC_station_dq0_with_control_PLL.pin_n) annotation(
    Line(points = {{-84, 4}, {-30, 4}, {-30, 8}, {-28, 8}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL.p, pQ_sensor1.p) annotation(
    Line(points = {{2, 16}, {22, 16}, {22, 2}, {50, 2}, {50, 2}}, color = {0, 0, 255}));
  connect(step2.y, vSC_station_dq0_with_control_PLL.Qref) annotation(
    Line(points = {{-54, 38}, {-44, 38}, {-44, 20}, {-30, 20}, {-30, 20}}, color = {0, 0, 127}));
  connect(step.y, vSC_station_dq0_with_control_PLL.Pref) annotation(
    Line(points = {{-52, 64}, {-38, 64}, {-38, 28}, {-30, 28}, {-30, 28}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Line(origin = {0, 8}, points = {{0, 0}})}, coordinateSystem(initialScale = 0.1)));



end TEST_VSC_with_PLL_and_controls_old;
