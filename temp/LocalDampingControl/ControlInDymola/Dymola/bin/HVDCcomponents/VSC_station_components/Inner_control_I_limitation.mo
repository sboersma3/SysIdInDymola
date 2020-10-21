within HVDCcomponents.VSC_station_components;
model Inner_control_I_limitation

parameter Real Lr;
parameter Real Rr;
parameter Real tr;
parameter Real Pref;
parameter Real Qref;
parameter Real Vgd;
parameter Real i_max;
parameter Real I_base;
parameter String Priority;
Modelica.Blocks.Interfaces.RealInput igd annotation (
    Placement(visible = true, transformation(origin = {-117, 19}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-117, 61}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput igq annotation (
    Placement(visible = true, transformation(origin = {-117, -153}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-117, 19}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgd annotation (
    Placement(visible = true, transformation(origin = {107, 119}, extent = {{-17, -17}, {17, 17}}, rotation = -90), iconTransformation(origin = {-117, -21}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgq annotation (
    Placement(visible = true, transformation(origin = {109, -217}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {-117, -61}, extent = {{17, -17}, {-17, 17}}, rotation = 180)));
Modelica.Blocks.Interfaces.RealInput igdref annotation (
    Placement(visible = true, transformation(origin = {-301, 75}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-37, 117}, extent = {{-17, -17}, {17, 17}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealInput igqref annotation (
    Placement(visible = true, transformation(origin = {-295, -103}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {15, 117}, extent = {{-17, -17}, {17, 17}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput vmd annotation (
    Placement(visible = true, transformation(origin = {300, 22}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, 18}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput vmq annotation (
    Placement(visible = true, transformation(origin = {300, -102}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, -68}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1)  annotation (
    Placement(visible = true, transformation(origin = {-48, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Continuous.Integrator integrator1(k = Rr / tr, y_start = Rr * Pref / Vgd)  annotation (
    Placement(visible = true, transformation(origin = {18, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Gain gain1(k = Lr / tr)  annotation (
    Placement(visible = true, transformation(origin = {18, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add add2(k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {78, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add3 add31(k3 = -1)  annotation (
    Placement(visible = true, transformation(origin = {144, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-32, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const(k =  Lr)  annotation (
    Placement(visible = true, transformation(origin = {-110, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-32, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add add3(k1 = +1, k2 = -1) annotation (
    Placement(visible = true, transformation(origin = {-34, -132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Continuous.Integrator integrator2(k = Rr / tr, y_start = -Rr * Qref / Vgd) annotation (
    Placement(visible = true, transformation(origin = {22, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Gain gain2(k = Lr / tr) annotation (
    Placement(visible = true, transformation(origin = {24, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add add4(k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {74, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add3 add32(k1 = +1, k3 = +1) annotation (
    Placement(visible = true, transformation(origin = {142, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput wpll annotation (
    Placement(visible = true, transformation(origin = {-117, -61}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-117, -135}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {-85, -45}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Current_lim2 current_lim2(Ib = I_base, Priority = Priority, i_max = i_max)  annotation (
    Placement(visible = true, transformation(origin = {-240, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Module_calc module_calc annotation (
    Placement(visible = true, transformation(origin = {-154, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-194, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = i_max * I_base, uMin = -i_max * I_base) annotation (
    Placement(visible = true, transformation(origin = {-196, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = i_max * I_base, uMin = -i_max * I_base) annotation (
    Placement(visible = true, transformation(origin = {-188, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  igdref - igd = 0;
  igqref - igq = 0;
equation
  connect(product3.u1, const.y) annotation (
    Line(points = {{-94, -40}, {-96, -40}, {-96, -22}, {-98, -22}, {-98, -22}}, color = {0, 0, 127}));
  connect(product3.u2, wpll) annotation (
    Line(points = {{-94, -50}, {-98, -50}, {-98, -60}, {-116, -60}, {-116, -60}}, color = {0, 0, 127}));
  connect(product3.y, product2.u1) annotation (
    Line(points = {{-78, -44}, {-60, -44}, {-60, -72}, {-44, -72}, {-44, -72}}, color = {0, 0, 127}));
  connect(product3.y, product1.u2) annotation (
    Line(points = {{-78, -44}, {-66, -44}, {-66, -18}, {-44, -18}, {-44, -18}}, color = {0, 0, 127}));
  connect(igq, product2.u2) annotation (
    Line(points = {{-116, -152}, {-66, -152}, {-66, -84}, {-44, -84}, {-44, -84}}, color = {0, 0, 127}));
  connect(product1.y, add32.u1) annotation (
    Line(points = {{-20, -12}, {104, -12}, {104, -122}, {130, -122}, {130, -122}}, color = {0, 0, 127}));
  connect(add31.u1, vgd) annotation (
    Line(points = {{132, 56}, {108, 56}, {108, 120}, {108, 120}}, color = {0, 0, 127}));
  connect(add32.u3, vgq) annotation (
    Line(points = {{130, -138}, {108, -138}, {108, -216}, {110, -216}}, color = {0, 0, 127}));
  connect(add4.y, add32.u2) annotation (
    Line(points = {{86, -130}, {130, -130}}, color = {0, 0, 127}));
  connect(gain2.y, add4.u2) annotation (
    Line(points = {{36, -158}, {46, -158}, {46, -136}, {62, -136}, {62, -136}}, color = {0, 0, 127}));
  connect(integrator2.y, add4.u1) annotation (
    Line(points = {{34, -106}, {48, -106}, {48, -124}, {62, -124}, {62, -124}}, color = {0, 0, 127}));
  connect(add3.y, gain2.u) annotation (
    Line(points = {{-22, -132}, {-4, -132}, {-4, -158}, {12, -158}, {12, -158}}, color = {0, 0, 127}));
  connect(add3.y, integrator2.u) annotation (
    Line(points = {{-22, -132}, {-6, -132}, {-6, -108}, {8, -108}, {8, -106}, {10, -106}}, color = {0, 0, 127}));
  connect(add3.u2, igq) annotation (
    Line(points = {{-46, -138}, {-74, -138}, {-74, -152}, {-116, -152}, {-116, -152}}, color = {0, 0, 127}));
  connect(product2.y, add31.u3) annotation (
    Line(points = {{-20, -78}, {74, -78}, {74, 12}, {120, 12}, {120, 40}, {132, 40}, {132, 40}}, color = {0, 0, 127}));
  connect(add2.y, add31.u2) annotation (
    Line(points = {{90, 48}, {132, 48}}, color = {0, 0, 127}));
  connect(igd, product1.u1) annotation (
    Line(points = {{-116, 20}, {-68, 20}, {-68, -6}, {-44, -6}, {-44, -6}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u1) annotation (
    Line(points = {{30, 78}, {52, 78}, {52, 54}, {66, 54}, {66, 54}}, color = {0, 0, 127}));
  connect(integrator1.y, add2.u2) annotation (
    Line(points = {{30, 40}, {64, 40}, {64, 42}, {66, 42}}, color = {0, 0, 127}));
  connect(gain1.u, add1.y) annotation (
    Line(points = {{6, 78}, {-32, 78}, {-32, 40}, {-36, 40}, {-36, 40}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation (
    Line(points = {{-36, 40}, {6, 40}, {6, 40}, {6, 40}}, color = {0, 0, 127}));
  connect(igd, add1.u2) annotation (
    Line(points = {{-116, 20}, {-80, 20}, {-80, 34}, {-60, 34}, {-60, 34}}, color = {0, 0, 127}));
  connect(add31.y, vmd) annotation (
    Line(points = {{156, 48}, {236, 48}, {236, 24}, {300, 24}, {300, 22}}, color = {0, 0, 127}));
  connect(vmq, add32.y) annotation (
    Line(points = {{300, -102}, {210, -102}, {210, -130}, {154, -130}, {154, -130}}, color = {0, 0, 127}));
  connect(constant1.y, module_calc.Vb) annotation (
    Line(points = {{-182, -12}, {-168, -12}, {-168, -16}, {-166, -16}}, color = {0, 0, 127}));
  connect(module_calc.ui, limiter1.y) annotation (
    Line(points = {{-166, -26}, {-176, -26}, {-176, -84}, {-184, -84}, {-184, -84}}, color = {0, 0, 127}));
  connect(limiter1.y, add3.u1) annotation (
    Line(points = {{-185, -84}, {-104, -84}, {-104, -126}, {-46, -126}}, color = {0, 0, 127}));
  connect(module_calc.ur, limiter.y) annotation (
    Line(points = {{-166, -20}, {-172, -20}, {-172, 48}, {-176, 48}, {-176, 48}, {-176, 48}}, color = {0, 0, 127}));
  connect(limiter.y, add1.u1) annotation (
    Line(points = {{-177, 48}, {-106.5, 48}, {-106.5, 46}, {-60, 46}}, color = {0, 0, 127}));
  connect(current_lim2.id_y, limiter.u) annotation (
    Line(points = {{-230, 18}, {-218, 18}, {-218, 46}, {-200, 46}, {-200, 48}}, color = {0, 0, 127}));
  connect(current_lim2.id_u, igdref) annotation (
    Line(points = {{-250, 18}, {-264, 18}, {-264, 74}, {-300, 74}, {-300, 76}}, color = {0, 0, 127}));
  connect(current_lim2.iq_u, igqref) annotation (
    Line(points = {{-250, 6}, {-262, 6}, {-262, -104}, {-294, -104}, {-294, -102}}, color = {0, 0, 127}));
  connect(current_lim2.iq_y, limiter1.u) annotation (
    Line(points = {{-230, 6}, {-220, 6}, {-220, -84}, {-208, -84}, {-208, -84}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -200}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -200}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");




end Inner_control_I_limitation;
