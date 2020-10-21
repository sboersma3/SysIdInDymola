within HVDCcomponents;

model VSC_station_dq0_with_control_PLL_bis

  parameter Real Rr = 0.0125 "in Ohm";
  parameter Real Lr = 100E-3 "in H";
  parameter Real wg = 314 "2*Pi*f";
  parameter Real tr = 10E-3 "response time of the loop in s";
  parameter Real Vb = 400E3 "base voltage in V";
  parameter Real Ib = 250 "base current in A";
  parameter Real teta_bus = 0 "connection bus angle in rad";
  parameter Real Vgd "connection bus voltage magnitude in V";
  parameter Real P_ref "=Pref";
  parameter Real Q_ref "=-Qref";
  // response time of the inner control loop
  Modelica.Electrical.Analog.Sources.SignalCurrent modulated_d_current annotation(
    Placement(visible = true, transformation(origin = {-90, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalCurrent modulated_q_current annotation (
    Placement(visible = true, transformation(origin = {-94, -26}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage modulated_d_voltage annotation (
    Placement(visible = true, transformation(origin = {64, 70}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalVoltage modulated_q_voltage annotation (
    Placement(visible = true, transformation(origin = {76, -56}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = Rr) annotation (
    Placement(visible = true, transformation(origin = {156, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = Rr) annotation (
    Placement(visible = true, transformation(origin = {166, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = Lr, i(start = P_ref / Vgd)) annotation (
    Placement(visible = true, transformation(origin = {130, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(L = Lr, i(start = -Q_ref / Vgd)) annotation (
    Placement(visible = true, transformation(origin = {134, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage VoltageSource1 annotation (
    Placement(visible = true, transformation(origin = {84, 46}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage VoltageSource2 annotation (
    Placement(visible = true, transformation(origin = {108, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex1 annotation (
    Placement(visible = true, transformation(origin = {340, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor_id annotation (
    Placement(visible = true, transformation(origin = {102, 80}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  HVDCcomponents.SignalCurrent_phasor signalCurrent_phasor1 annotation (
    Placement(visible = true, transformation(origin = {376, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.Ground_phasor ground_phasor1 annotation (
    Placement(visible = true, transformation(origin = {364, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Interfaces.PwPin p annotation (
    Placement(visible = true, transformation(origin = {410, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor_iq annotation (
    Placement(visible = true, transformation(origin = {134, -72}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-24, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-24, 72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor_vdc annotation (
    Placement(visible = true, transformation(origin = {-56, 4}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const1(k = Lr) annotation (
    Placement(visible = true, transformation(origin = {222, 2}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 3) annotation (
    Placement(visible = true, transformation(origin = {175, 21}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct2(nu = 3) annotation (
    Placement(visible = true, transformation(origin = {175, -11}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = wg) annotation (
    Placement(visible = true, transformation(origin = {222, -24}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Idq_to_Icomplex idq_to_Icomplex1 annotation (
    Placement(visible = true, transformation(origin = {277, 49}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {176, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
    Placement(visible = true, transformation(origin = {-204, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
    Placement(visible = true, transformation(origin = {-204, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage vd annotation (
    Placement(visible = true, transformation(origin = {174, 64}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  HVDCcomponents.VSC_station_components.Module_calc module_calc1 annotation (
    Placement(visible = true, transformation(origin = {218, 64}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage vq annotation (
    Placement(visible = true, transformation(origin = {186, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation (
    Placement(visible = true, transformation(origin = {230, -56}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {144, 90}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division4 annotation (
    Placement(visible = true, transformation(origin = {-6, -108}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division5 annotation (
    Placement(visible = true, transformation(origin = {12, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pref annotation (
    Placement(visible = true, transformation(origin = {-215, 83}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-115, 85}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Qref annotation (
    Placement(visible = true, transformation(origin = {-215, 55}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-115, 39}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Idqref_calc_VSC idqref_calc_VSC1 annotation (
    Placement(visible = true, transformation(origin = {-120, 76}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Vb_const(k = Vb)  annotation (
    Placement(visible = true, transformation(origin = {250, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Ib_const(k = Ib)  annotation (
    Placement(visible = true, transformation(origin = {312, 132}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.PLL PLL(kipll = -2.53, kppll = -0.05, teta_bus = teta_bus, w_base = wg, wcpll = 200)  annotation(
    Placement(visible = true, transformation(origin = {286, -46}, extent = {{-28, -14}, {28, 14}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Inner_control_VSC_blocks_PLL inner_control_VSC_blocks_PLL1(Lr = Lr, Pref = P_ref, Qref = Q_ref, Rr = Rr, Vgd = Vgd, tr = tr)  annotation(
    Placement(visible = true, transformation(origin = {55.1301, 4.86995}, extent = {{-15.2992, -30.5984}, {30.5984, 15.2992}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {342, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.from_grid_to_PLL_reference from_grid_to_PLL_reference annotation(
    Placement(visible = true, transformation(origin = {8, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.from_PLL_to_grid_reference from_PLL_to_grid_reference annotation(
    Placement(visible = true, transformation(origin = {102, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Sensors.PwVoltage pwVoltage annotation(
    Placement(visible = true, transformation(origin = {376, 98}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Arctan_bis arctan_bis annotation(
    Placement(visible = true, transformation(origin = {330, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PLL.w_pll, inner_control_VSC_blocks_PLL1.wpll) annotation(
    Line(points = {{302, -38}, {310, -38}, {310, -112}, {44, -112}, {44, -30}, {28, -30}, {28, -6}, {40, -6}, {40, -8}}, color = {0, 0, 127}));
  connect(idqref_calc_VSC1.igdref, inner_control_VSC_blocks_PLL1.igdref) annotation(
    Line(points = {{-92, 86}, {-60, 86}, {-60, 54}, {42, 54}, {42, 26}, {52, 26}, {52, 20}, {52, 20}}, color = {0, 0, 127}));
  connect(inner_control_VSC_blocks_PLL1.igqref, idqref_calc_VSC1.igqref) annotation(
    Line(points = {{60, 20}, {60, 20}, {60, 38}, {12, 38}, {12, 50}, {-72, 50}, {-72, 66}, {-92, 66}, {-92, 66}}, color = {0, 0, 127}));
  connect(PLL.Vgq_ref, const.y) annotation(
    Line(points = {{270, -38}, {216, -38}, {216, -56}, {222, -56}, {222, -56}}, color = {0, 0, 127}));
  connect(Ib_const.y, idq_to_Icomplex1.Ib) annotation(
    Line(points = {{301, 132}, {286, 132}, {286, 88}, {252, 88}, {252, 60}, {259, 60}, {259, 60.4}}, color = {0, 0, 127}));
  connect(module_calc1.Vb, Vb_const.y) annotation(
    Line(points = {{230, 70.4}, {266, 70.4}, {266, 132}, {261, 132}, {261, 132}}, color = {0, 0, 127}));
  connect(multiProduct2.y, VoltageSource2.v) annotation(
    Line(points = {{166.81, -11}, {108, -11}, {108, -26}}, color = {0, 0, 127}));
  connect(vd.v, idqref_calc_VSC1.vgd) annotation(
    Line(points = {{186, 64}, {186, 108}, {-120, 108}, {-120, 105}}, color = {0, 0, 127}));
  connect(idqref_calc_VSC1.Pref, Pref) annotation(
    Line(points = {{-149, 86}, {-215, 86}, {-215, 83}}, color = {0, 0, 127}));
  connect(product2.y, modulated_d_current.i) annotation(
    Line(points = {{-24, 61}, {-24, 46.5}, {-92, 46.5}, {-92, 43.25}, {-90, 43.25}, {-90, 38}}, color = {0, 0, 127}));
  connect(modulated_d_current.p, pin_p) annotation(
    Line(points = {{-100, 26}, {-151, 26}, {-151, 22}, {-204, 22}}, color = {0, 0, 255}));
  connect(modulated_d_current.n, pin_n) annotation(
    Line(points = {{-80, 26}, {-80, 4}, {-174, 4}, {-174, -14}, {-204, -14}, {-204, -16}}, color = {0, 0, 255}));
  connect(modulated_d_voltage.v, division5.u1) annotation(
    Line(points = {{52, 70}, {44, 70}, {44, 88}, {24, 88}}, color = {0, 0, 127}));
  connect(division5.y, product2.u2) annotation(
    Line(points = {{1, 82}, {-4, 82}, {-4, 96}, {-30, 96}, {-30, 84}, {-30, 84}}, color = {0, 0, 127}));
  connect(division5.u2, voltageSensor_vdc.v) annotation(
    Line(points = {{24, 76}, {28, 76}, {28, 34}, {-20, 34}, {-20, 4}, {-45, 4}}, color = {0, 0, 127}));
  connect(division4.y, product1.u1) annotation(
    Line(points = {{-17, -108}, {-30, -108}, {-30, -80}}, color = {0, 0, 127}));
  connect(voltageSensor_vdc.v, division4.u2) annotation(
    Line(points = {{-45, 4}, {-18.5, 4}, {-18.5, -10}, {-10, -10}, {-10, -76}, {42, -76}, {42, -114}, {6, -114}}, color = {0, 0, 127}));
  connect(modulated_q_voltage.v, division4.u1) annotation(
    Line(points = {{64, -56}, {64, -102}, {6, -102}}, color = {0, 0, 127}));
  connect(currentSensor_iq.p, ground4.p) annotation(
    Line(points = {{144, -72}, {176, -72}, {176, -72}, {176, -72}}, color = {0, 0, 255}));
  connect(currentSensor_iq.n, modulated_q_voltage.n) annotation(
    Line(points = {{124, -72}, {76, -72}, {76, -66}, {76, -66}}, color = {0, 0, 255}));
  connect(currentSensor_iq.i, product1.u2) annotation(
    Line(points = {{134, -83}, {134, -84}, {-18, -84}, {-18, -80}}, color = {0, 0, 127}));
  connect(currentSensor_iq.i, multiProduct1.u[2]) annotation(
    Line(points = {{134, -83}, {202, -83}, {202, 18}, {182, 18}, {182, 21}}, color = {0, 0, 127}));
  connect(currentSensor_iq.i, idq_to_Icomplex1.iq) annotation(
    Line(points = {{134, -83}, {244, -83}, {244, 46}, {258, 46}, {258, 44.8}, {259, 44.8}}, color = {0, 0, 127}));
  connect(currentSensor_id.n, modulated_d_voltage.n) annotation(
    Line(points = {{92, 80}, {64, 80}, {64, 80}, {64, 80}}, color = {0, 0, 255}));
  connect(currentSensor_id.p, ground2.p) annotation(
    Line(points = {{112, 80}, {144, 80}, {144, 80}, {144, 80}}, color = {0, 0, 255}));
  connect(currentSensor_id.i, product2.u1) annotation(
    Line(points = {{102, 91}, {102, 104}, {-18, 104}, {-18, 84}}, color = {0, 0, 127}));
  connect(currentSensor_id.i, multiProduct2.u[2]) annotation(
    Line(points = {{102, 91}, {102, 104}, {198, 104}, {198, -11}, {182, -11}}, color = {0, 0, 127}));
  connect(currentSensor_id.i, idq_to_Icomplex1.id) annotation(
    Line(points = {{102, 91}, {102, 104}, {244, 104}, {244, 53.8}, {259, 53.8}}, color = {0, 0, 127}));
  connect(ground2.p, vd.n) annotation(
    Line(points = {{144, 80}, {174, 80}, {174, 74}, {174, 74}}, color = {0, 0, 255}));
  connect(const2.y, multiProduct2.u[3]) annotation(
    Line(points = {{213.2, -24}, {190, -24}, {190, -14}, {182, -14}, {182, -14.2667}}, color = {0, 0, 127}));
  connect(const2.y, multiProduct1.u[3]) annotation(
    Line(points = {{213.2, -24}, {204, -24}, {204, 24}, {182, 24}, {182, 17.7333}}, color = {0, 0, 127}));
  connect(vq.v, const.y) annotation(
    Line(points = {{198, -56}, {222, -56}, {222, -56}, {221.2, -56}}, color = {0, 0, 127}));
  connect(ground4.p, vq.n) annotation(
    Line(points = {{176, -72}, {186, -72}, {186, -66}, {186, -66}}, color = {0, 0, 255}));
  connect(resistor2.n, vq.p) annotation(
    Line(points = {{176, -38}, {186, -38}, {186, -46}, {186, -46}}, color = {0, 0, 255}));
  connect(module_calc1.u_module, vd.v) annotation(
    Line(points = {{206.3, 63.9}, {186, 63.9}, {186, 64}, {186, 64}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.vi, module_calc1.ui) annotation(
    Line(points = {{281.8, 67}, {281.8, 67}, {281.8, 74}, {234, 74}, {234, 60}, {230, 60}, {230, 60.8}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.vr, module_calc1.ur) annotation(
    Line(points = {{272.2, 67}, {232, 67}, {232, 66.2}, {230, 66.2}}, color = {0, 0, 127}));
  connect(resistor1.n, vd.p) annotation(
    Line(points = {{166, 46}, {174, 46}, {174, 54}, {174, 54}}, color = {0, 0, 255}));
  connect(pin_n, voltageSensor_vdc.n) annotation(
    Line(points = {{-204, -16}, {-56, -16}, {-56, -6}}, color = {0, 0, 255}));
  connect(pin_p, voltageSensor_vdc.p) annotation(
    Line(points = {{-204, 22}, {-99, 22}, {-99, 14}, {-56, 14}}, color = {0, 0, 255}));
  connect(modulated_q_current.p, pin_p) annotation(
    Line(points = {{-84, -26}, {-73, -26}, {-73, -24}, {-72, -24}, {-72, 20}, {-204, 20}, {-204, 22}}, color = {0, 0, 255}));
  connect(modulated_q_current.n, pin_n) annotation(
    Line(points = {{-104, -26}, {-176, -26}, {-176, -16}, {-204, -16}}, color = {0, 0, 255}));
  connect(idq_to_Icomplex1.Ii, realToComplex1.im) annotation(
    Line(points = {{294.85, 45.85}, {328, 45.85}, {328, 44}, {328, 44}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.Ir, realToComplex1.re) annotation(
    Line(points = {{294.85, 53.65}, {328, 53.65}, {328, 56}, {328, 56}}, color = {0, 0, 127}));
  connect(signalCurrent_phasor1.p, ground_phasor1.p) annotation(
    Line(points = {{365.8, 32}, {365.8, 23}, {365.8, 23}, {365.8, 14}, {363.8, 14}, {363.8, 6}, {363.8, -2.2}, {364, -2.2}}, color = {0, 0, 255}));
  connect(realToComplex1.y, signalCurrent_phasor1.i) annotation(
    Line(points = {{351, 50}, {377, 50}, {377, 45}, {376, 45}, {376, 39.8}}, color = {85, 170, 255}));
  connect(p, signalCurrent_phasor1.n) annotation(
    Line(points = {{410, 34}, {398, 34}, {398, 34}, {386, 34}, {386, 33}, {386, 31.8}, {386.4, 31.8}}, color = {0, 0, 255}));
  connect(const1.y, multiProduct2.u[1]) annotation(
    Line(points = {{213.2, 2}, {188, 2}, {188, -8}, {182, -8}, {182, -7.73333}}, color = {0, 0, 127}));
  connect(multiProduct1.y, VoltageSource1.v) annotation(
    Line(points = {{166.81, 21}, {84, 21}, {84, 34}, {84, 34}, {84, 34}}, color = {0, 0, 127}));
  connect(const1.y, multiProduct1.u[1]) annotation(
    Line(points = {{213.2, 2}, {208, 2}, {208, 24.2667}, {182, 24.2667}}, color = {0, 0, 127}));
  connect(VoltageSource1.p, inductor1.p) annotation(
    Line(points = {{94, 46}, {120, 46}}, color = {0, 0, 255}));
  connect(modulated_d_voltage.p, VoltageSource1.n) annotation(
    Line(points = {{64, 60}, {64, 56.5}, {64, 56.5}, {64, 53}, {62, 53}, {62, 46}, {69, 46}, {69, 46}, {71.5, 46}, {71.5, 46}, {74, 46}}, color = {0, 0, 255}));
  connect(inductor1.n, resistor1.p) annotation(
    Line(points = {{140, 46}, {146, 46}}, color = {0, 0, 255}));
  connect(VoltageSource2.n, inductor2.p) annotation(
    Line(points = {{118, -38}, {124, -38}}, color = {0, 0, 255}));
  connect(modulated_q_voltage.p, VoltageSource2.p) annotation(
    Line(points = {{76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}}, color = {0, 0, 255}));
  connect(inductor2.n, resistor2.p) annotation(
    Line(points = {{144, -38}, {150, -38}, {150, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}}, color = {0, 0, 255}));
  connect(product1.y, modulated_q_current.i) annotation(
    Line(points = {{-24, -57}, {-24, -51.5}, {-94, -51.5}, {-94, -38}}, color = {0, 0, 127}));
  connect(PLL.teta_pll, add.u1) annotation(
    Line(points = {{302, -46}, {320, -46}, {320, -98}, {330, -98}}, color = {0, 0, 127}));
  connect(PLL.teta_g, add.u2) annotation(
    Line(points = {{292, -62}, {292, -104}, {322, -104}, {322, -110}, {330, -110}}, color = {0, 0, 127}));
  connect(currentSensor_id.i, from_grid_to_PLL_reference.id) annotation(
    Line(points = {{102, 92}, {-8, 92}, {-8, 16}, {-4, 16}, {-4, 16}}, color = {0, 0, 127}));
  connect(vd.v, from_grid_to_PLL_reference.vd) annotation(
    Line(points = {{186, 64}, {184, 64}, {184, 98}, {-12, 98}, {-12, 12}, {-4, 12}, {-4, 12}}, color = {0, 0, 127}));
  connect(currentSensor_iq.i, from_grid_to_PLL_reference.iq) annotation(
    Line(points = {{134, -82}, {-12, -82}, {-12, 6}, {-4, 6}, {-4, 4}}, color = {0, 0, 127}));
  connect(vq.v, from_grid_to_PLL_reference.vq) annotation(
    Line(points = {{198, -56}, {198, -56}, {198, -88}, {-6, -88}, {-6, -6}, {-10, -6}, {-10, 0}, {-4, 0}, {-4, 0}}, color = {0, 0, 127}));
  connect(add.y, from_grid_to_PLL_reference.delta_teta) annotation(
    Line(points = {{354, -104}, {362, -104}, {362, -124}, {14, -124}, {14, -18}, {8, -18}, {8, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(from_grid_to_PLL_reference.id_pll, inner_control_VSC_blocks_PLL1.igd) annotation(
    Line(points = {{20, 16}, {32, 16}, {32, 12}, {40, 12}, {40, 12}}, color = {0, 0, 127}));
  connect(from_grid_to_PLL_reference.iq_pll, inner_control_VSC_blocks_PLL1.igq) annotation(
    Line(points = {{20, 12}, {28, 12}, {28, 6}, {40, 6}, {40, 6}}, color = {0, 0, 127}));
  connect(from_grid_to_PLL_reference.vd_pll, inner_control_VSC_blocks_PLL1.vgd) annotation(
    Line(points = {{20, 6}, {24, 6}, {24, 0}, {34, 0}, {34, -2}, {40, -2}, {40, -4}}, color = {0, 0, 127}));
  connect(from_grid_to_PLL_reference.vq_pll, inner_control_VSC_blocks_PLL1.vgq) annotation(
    Line(points = {{20, 2}, {22, 2}, {22, -10}, {40, -10}, {40, -10}}, color = {0, 0, 127}));
  connect(inner_control_VSC_blocks_PLL1.vmd, from_PLL_to_grid_reference.vd_pll) annotation(
    Line(points = {{76, 4}, {82, 4}, {82, 10}, {90, 10}, {90, 8}}, color = {0, 0, 127}));
  connect(inner_control_VSC_blocks_PLL1.vmq, from_PLL_to_grid_reference.vq_pll) annotation(
    Line(points = {{76, -8}, {84, -8}, {84, 2}, {90, 2}, {90, 2}}, color = {0, 0, 127}));
  connect(from_PLL_to_grid_reference.delta_teta, from_grid_to_PLL_reference.delta_teta) annotation(
    Line(points = {{102, -8}, {102, -8}, {102, -24}, {8, -24}, {8, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(from_PLL_to_grid_reference.vq, modulated_q_voltage.v) annotation(
    Line(points = {{114, 2}, {126, 2}, {126, -22}, {56, -22}, {56, -56}, {64, -56}, {64, -56}}, color = {0, 0, 127}));
  connect(from_PLL_to_grid_reference.vd, modulated_d_voltage.v) annotation(
    Line(points = {{114, 8}, {128, 8}, {128, 28}, {56, 28}, {56, 50}, {52, 50}, {52, 70}, {52, 70}}, color = {0, 0, 127}));
  connect(p, pwVoltage.p) annotation(
    Line(points = {{410, 34}, {406, 34}, {406, 98}, {386, 98}, {386, 98}}, color = {0, 0, 255}));
  connect(pwVoltage.vr, idq_to_Icomplex1.vr) annotation(
    Line(points = {{364, 104}, {272, 104}, {272, 68}, {272, 68}}, color = {0, 0, 127}));
  connect(pwVoltage.vi, idq_to_Icomplex1.vi) annotation(
    Line(points = {{364, 98}, {282, 98}, {282, 68}, {282, 68}}, color = {0, 0, 127}));
  connect(idqref_calc_VSC1.Qref, Qref) annotation(
    Line(points = {{-148, 66}, {-182, 66}, {-182, 54}, {-214, 54}, {-214, 56}}, color = {0, 0, 127}));
  connect(pwVoltage.v, PLL.V_g) annotation(
    Line(points = {{366, 92}, {314, 92}, {314, 16}, {260, 16}, {260, -72}, {278, -72}, {278, -62}, {278, -62}}, color = {0, 0, 127}));
  connect(pwVoltage.vi, arctan_bis.u1) annotation(
    Line(points = {{366, 98}, {310, 98}, {310, -2}, {318, -2}}, color = {0, 0, 127}));
  connect(pwVoltage.vr, arctan_bis.u2) annotation(
    Line(points = {{366, 104}, {306, 104}, {306, -12}, {318, -12}, {318, -10}}, color = {0, 0, 127}));
  connect(arctan_bis.y, PLL.teta_g) annotation(
    Line(points = {{342, -8}, {346, -8}, {346, -76}, {292, -76}, {292, -62}, {292, -62}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -130}, {400, 120}})),
    Icon(coordinateSystem(extent = {{-200, -130}, {400, 120}})),
    __OpenModelica_commandLineOptions = "");


end VSC_station_dq0_with_control_PLL_bis;
