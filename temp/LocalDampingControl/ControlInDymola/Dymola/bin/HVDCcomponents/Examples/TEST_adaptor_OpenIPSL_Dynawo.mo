within HVDCcomponents.Examples;
model TEST_adaptor_OpenIPSL_Dynawo
  Dynawo.Electrical.Buses.InfiniteBus infiniteBus1(UPhase = 0.3047, UPu = 1)  annotation (
    Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Dynawo.Electrical.Buses.InfiniteBus infiniteBus2(UPhase = 0, UPu = 1)  annotation (
    Placement(visible = true, transformation(origin = {64, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0, G = 0, R = 0.03, X = 0.3)  annotation (
    Placement(visible = true, transformation(origin = {2, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.adaptor_OpenIPSL_Dynawo adaptor_OpenIPSL_Dynawo1 annotation (
    Placement(visible = true, transformation(origin = {-35, 15}, extent = {{7, 7}, {-7, -7}}, rotation = 0)));
  HVDCcomponents.adaptor_OpenIPSL_Dynawo adaptor_OpenIPSL_Dynawo2 annotation (
    Placement(visible = true, transformation(origin = {37, 15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  connect(adaptor_OpenIPSL_Dynawo2.DynawoTerminal, infiniteBus2.terminal) annotation (
    Line(points = {{44, 16}, {58, 16}, {58, 14}, {64, 14}, {64, 14}}, color = {0, 0, 255}));
  connect(adaptor_OpenIPSL_Dynawo2.OpenIPSLTerminal, pwLine1.n) annotation (
    Line(points = {{30, 16}, {12, 16}, {12, 14}, {12, 14}}, color = {0, 0, 255}));
  connect(infiniteBus1.terminal, adaptor_OpenIPSL_Dynawo1.DynawoTerminal) annotation (
    Line(points = {{-68, 16}, {-44, 16}, {-44, 14}, {-42, 14}}, color = {0, 0, 255}));
  connect(pwLine1.p, adaptor_OpenIPSL_Dynawo1.OpenIPSLTerminal) annotation (
    Line(points = {{-8, 14}, {-26, 14}, {-26, 14}, {-28, 14}}, color = {0, 0, 255}));
end TEST_adaptor_OpenIPSL_Dynawo;
