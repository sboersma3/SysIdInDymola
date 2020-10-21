within HVDCcomponents.Examples;
model TEST_dynamic_line
  inner OpenIPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation (
    Placement(visible = true, transformation(extent = {{-98, -56}, {-50, -42}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus annotation (
    Placement(visible = true, transformation(origin = {82, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HVDCcomponents.DynamicLine dynamicLine(B = 0.00001, G = 0.00001, R = 0.03, V10 = 1, V20 = 1, X = 0.3, angle10 = 17.46, angle20 = 0) annotation (
    Placement(visible = true, transformation(origin = {6, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(angle_0 = 17.46)  annotation (
    Placement(visible = true, transformation(origin = {-84, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.IdealCommutingSwitch_phasor idealCommutingSwitch_phasor annotation (
    Placement(visible = true, transformation(origin = {-48, 48}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus2(angle_0 = 21.10) annotation (
    Placement(visible = true, transformation(origin = {-84, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime = 10)  annotation (
    Placement(visible = true, transformation(origin = {-32, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(dynamicLine.n, infiniteBus.p) annotation (
    Line(points = {{16, 48}, {72, 48}, {72, 48}, {72, 48}}, color = {0, 0, 255}));
  connect(dynamicLine.p, idealCommutingSwitch_phasor.p) annotation (
    Line(points = {{-2, 48}, {-38, 48}, {-38, 48}, {-38, 48}}, color = {0, 0, 255}));
  connect(idealCommutingSwitch_phasor.n2, infiniteBus1.p) annotation (
    Line(points = {{-58, 48}, {-74, 48}, {-74, 48}, {-74, 48}}, color = {0, 0, 255}));
  connect(idealCommutingSwitch_phasor.n1, infiniteBus2.p) annotation (
    Line(points = {{-58, 44}, {-66, 44}, {-66, 12}, {-74, 12}, {-74, 12}}, color = {0, 0, 255}));
  connect(idealCommutingSwitch_phasor.control, booleanStep.y) annotation (
    Line(points = {{-48, 36}, {-48, 36}, {-48, 10}, {-44, 10}, {-44, 10}}, color = {255, 0, 255}));
end TEST_dynamic_line;
