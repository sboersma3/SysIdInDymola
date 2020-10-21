within HVDCcomponents;
model VSC_new_pll
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Real Rr = 0.002 "Connection resistance(pu)" annotation (
    Dialog(group = "Physical parameters"));
  parameter String Control_Type = "Droop" "Droop, Master, P_mode"  annotation (
    Dialog(group = "Control"));
  parameter String PLL_Type = "PI" "Ideal, PI"  annotation (
    Dialog(group = "Control"));
  parameter Real Xr = 100E-3 " Connection reactance (pu)" annotation (
    Dialog(group = "Physical parameters"));
  parameter Real C_dc = 195E-6 "DC capacitor (F)" annotation (
    Dialog(group = "Physical parameters"));
  parameter Real S_b = SysData.S_b "System base power (MVA)" annotation (
    Dialog(group = "Base values"));
  parameter Real MVAb = 1000 "Rated power (MVA)" annotation (
    Dialog(group = "Base values"));
  parameter Real fb = SysData.fn "Frequency (Hz)" annotation (
    Dialog(group = "Base values"));
  parameter Real Q_max = 0.5 "Maximum reactive power injection (pu)" annotation (
    Dialog(group = "Control"));
  parameter Real Q_min = -0.5 "Minimum reactive power injection (pu)" annotation (
    Dialog(group = "Control"));
  parameter Real tr = 3E-3 "response time of the current loop (s)" annotation (
    Dialog(group = "Control"));
  parameter Real tr_dc = 40E-3 "response time of the DC voltage loop (s)" annotation (
    Dialog(group = "Control"));
  parameter Real I_max = 1.1 "Maximum current (pu)" annotation (
    Dialog(group = "Control"));
  parameter String Priority = "q" "d, q - Axis priority" annotation (
    Dialog(group = "Control"));
  parameter Real k_droop = 10 "voltage droop (MW/kV)" annotation (Dialog(group = "Control"));
  parameter Real Vb = 400 "base voltage (kV)" annotation (
    Dialog(group = "Base values"));
  parameter Real Vdcb = 230 "Base DC voltage (kV)" annotation (
    Dialog(group = "Base values"));
  parameter Real teta_bus = 0 "connection bus angle (rad)" annotation (
    Dialog(group = "Power flow data"));
  parameter Real Vgd "connection bus voltage magnitude (V)" annotation (
    Dialog(group = "Power flow data"));
  parameter Real Vdc0 = 1 "DC voltage reference (pu)" annotation (
    Dialog(group = "Power flow data"));
  parameter Real P_ref "=Pref (W)" annotation (
    Dialog(group = "Power flow data"));
  parameter Real Q_ref "=-Qref (W)" annotation (
    Dialog(group = "Power flow data"));
  Modelica.Electrical.Analog.Sources.SignalCurrent modulated_d_current annotation (
    Placement(visible = true, transformation(origin = {-90, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalCurrent modulated_q_current annotation (
    Placement(visible = true, transformation(origin = {-94, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage modulated_d_voltage annotation (
    Placement(visible = true, transformation(origin = {64, 70}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalVoltage modulated_q_voltage annotation (
    Placement(visible = true, transformation(origin = {76, -56}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = Rr*Vb*Vb/MVAb) annotation (
    Placement(visible = true, transformation(origin = {156, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = Rr*Vb*Vb/MVAb) annotation (
    Placement(visible = true, transformation(origin = {166, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = Xr*Vb*Vb/(2*MVAb*fb*Modelica.Constants.pi), i(start = P_ref / Vgd)) annotation (
    Placement(visible = true, transformation(origin = {130, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(L = Xr*Vb*Vb/(2*MVAb*fb*Modelica.Constants.pi), i(start = -Q_ref / Vgd)) annotation (
    Placement(visible = true, transformation(origin = {134, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage VoltageSource1 annotation (
    Placement(visible = true, transformation(origin = {84, 46}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage VoltageSource2 annotation (
    Placement(visible = true, transformation(origin = {108, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex1 annotation (
    Placement(visible = true, transformation(origin = {362, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {-25, -67}, extent = {{-9, -9}, {9, 9}}, rotation = 90)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-20, 68}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor_vdc annotation (
    Placement(visible = true, transformation(origin = {-56, 4}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const1(k = Xr*Vb*Vb/(2*MVAb*fb*Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {222, 2}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 3) annotation (
    Placement(visible = true, transformation(origin = {175, 21}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct2(nu = 3) annotation (
    Placement(visible = true, transformation(origin = {175, -11}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {176, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
    Placement(visible = true, transformation(origin = {-204, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
    Placement(visible = true, transformation(origin = {-204, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage vd annotation (
    Placement(visible = true, transformation(origin = {174, 64}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalVoltage vq annotation (
    Placement(visible = true, transformation(origin = {186, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {144, 90}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division4 annotation (
    Placement(visible = true, transformation(origin = {-10, -104}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Division division5 annotation (
    Placement(visible = true, transformation(origin = {10, 84}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pref annotation (
    Placement(visible = true, transformation(origin = {-277, 77}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-115, 85}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Qref annotation (
    Placement(visible = true, transformation(origin = {-263, 55}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-115, 39}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Idqref_calc_VSC idqref_calc_VSC1 annotation (
    Placement(visible = true, transformation(origin = {-120, 76}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  OpenIPSL.Electrical.Sensors.PwVoltage pwVoltage annotation (
    Placement(visible = true, transformation(origin = {380, 94}, extent = {{14, -14}, {-14, 14}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = C_dc, v(fixed = true, start = Vdc0 * 1000 * Vdcb)) annotation (
    Placement(visible = true, transformation(origin = {-186, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HVDCcomponents.Vdc_droop vdc_droop(g_droop = k_droop * 1000) annotation (
    Placement(visible = true, transformation(origin = {-182, -78}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = Vdc0 * 1000 * Vdcb) annotation (
    Placement(visible = true, transformation(origin = {-125, -49}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.PLL2 pll2(kipll = -2.53 * 500, kppll = -0.05 * 100, teta_bus = teta_bus, w_base = 377, wcpll = 2000) annotation (
    Placement(visible = true, transformation(origin = {298, -40}, extent = {{20, -10}, {-20, 10}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.ri_to_dq ri_to_dq_i annotation (
    Placement(visible = true, transformation(origin = {14, 12}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.ri_to_dq ri_to_dq_v annotation (
    Placement(visible = true, transformation(origin = {14, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Vb * 1000) annotation (
    Placement(visible = true, transformation(origin = {289, -121}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = Vb * 1000) annotation (
    Placement(visible = true, transformation(origin = {289, -157}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = Vb / (S_b * 1000)) annotation (
    Placement(visible = true, transformation(origin = {334, 38}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = Vb / (S_b * 1000)) annotation (
    Placement(visible = true, transformation(origin = {337, 55}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  HVDCcomponents.VSC_station_components.dq_to_ri dq_to_ri annotation (
    Placement(visible = true, transformation(origin = {289, 59}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.ri_to_dq ri_to_dq annotation (
    Placement(visible = true, transformation(origin = {224, 58}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = Vb * 1000) annotation (
    Placement(visible = true, transformation(origin = {206, 68}, extent = {{-4, -4}, {4, 4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain6(k = Vb * 1000) annotation (
    Placement(visible = true, transformation(origin = {218, -52}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const2(k = 2 * Modelica.Constants.pi * fb) annotation (
    Placement(visible = true, transformation(origin = {222, -24}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Inner_control_I_limitation inner_control_I_limitation(I_base = S_b * 1000 / Vb,Lr = Xr*Vb*Vb/(2*MVAb*fb*Modelica.Constants.pi), Pref = P_ref, Priority = Priority, Qref = Q_ref, Rr = Rr*Vb*Vb/MVAb, Vgd = Vgd, i_max = I_max, tr = tr)  annotation (
    Placement(visible = true, transformation(origin = {60, 2}, extent = {{-10, -20}, {20, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = MVAb * Q_max * 1000000, uMin = MVAb * Q_min * 1000000)  annotation (
    Placement(visible = true, transformation(origin = {-220, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = MVAb * 1000000, uMin = -MVAb * 1000000) annotation (
    Placement(visible = true, transformation(origin = {-176, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.vdc_control vdc_control_master(Cdc = C_dc, Ksi = 0.7, controlType = "PI+filter", tr = tr_dc, vdc0 = Vdc0 * 1000 * Vdcb)  annotation (
    Placement(visible = true, transformation(origin = {-180, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add3(k1 = -1, k2 = 1, k3 = 1)  annotation (
    Placement(visible = true, transformation(origin = {-221, 91}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.PLL_ideal pLL_ideal annotation (
    Placement(visible = true, transformation(origin = {352, 142}, extent = {{20, -10}, {-20, 10}}, rotation = 0)));
equation
  if Control_Type == "Droop" then
    add3.u1 = vdc_droop.Pref;
    add3.u2 = 0;
    add3.u3 = Pref;
  elseif Control_Type == "Master" then
    add3.u1 = 0;
    add3.u2 = vdc_control_master.Pref;
    add3.u3 = 0;
  else
    add3.u1 = 0;
    add3.u2 = 0;
    add3.u3 = Pref;
  end if;
  if PLL_Type == "Ideal" then
    ri_to_dq_v.angle = pLL_ideal.teta_pll;
    ri_to_dq_i.angle = pLL_ideal.teta_pll;
    dq_to_ri.angle = pLL_ideal.teta_pll;
    ri_to_dq.angle = pLL_ideal.teta_pll;
  elseif PLL_Type == "PI" then
    ri_to_dq_v.angle = pll2.teta_pll;
    ri_to_dq_i.angle = pll2.teta_pll;
    dq_to_ri.angle = pll2.teta_pll;
    ri_to_dq.angle = pll2.teta_pll;
  end if;
  connect(multiProduct2.y, VoltageSource2.v) annotation (
    Line(points = {{166.81, -11}, {108, -11}, {108, -26}}, color = {0, 0, 127}));
  connect(vd.v, idqref_calc_VSC1.vgd) annotation (
    Line(points={{186,64},{186,108},{-120,108},{-120,104.8}},        color = {0, 0, 127}));
  connect(product2.y, modulated_d_current.i) annotation (
    Line(points={{-20,61.4},{-20,46.5},{-92,46.5},{-92,43.25},{-90,43.25},{-90,
          38}},                                                                                 color = {0, 0, 127}));
  connect(modulated_d_current.p, pin_p) annotation (
    Line(points = {{-100, 26}, {-151, 26}, {-151, 22}, {-204, 22}}, color = {0, 0, 255}));
  connect(modulated_d_current.n, pin_n) annotation (
    Line(points = {{-80, 26}, {-80, 4}, {-174, 4}, {-174, -14}, {-204, -14}, {-204, -22}}, color = {0, 0, 255}));
  connect(modulated_d_voltage.v, division5.u1) annotation (
    Line(points={{52,70},{44,70},{44,88.8},{19.6,88.8}},    color = {0, 0, 127}));
  connect(division5.y, product2.u2) annotation (
    Line(points={{1.2,84},{-4,84},{-4,96},{-23.6,96},{-23.6,75.2}},    color = {0, 0, 127}));
  connect(division5.u2, voltageSensor_vdc.v) annotation (
    Line(points={{19.6,79.2},{28,79.2},{28,34},{-20,34},{-20,4},{-45,4}},        color = {0, 0, 127}));
  connect(division4.y, product1.u1) annotation (
    Line(points={{-16.6,-104},{-30.4,-104},{-30.4,-77.8}},color = {0, 0, 127}));
  connect(voltageSensor_vdc.v, division4.u2) annotation (
    Line(points={{-45,4},{-18.5,4},{-18.5,-10},{-10,-10},{-10,-76},{42,-76},{42,
          -107.6},{-2.8,-107.6}},                                                                                  color = {0, 0, 127}));
  connect(modulated_q_voltage.v, division4.u1) annotation (
    Line(points={{64,-56},{64,-100.4},{-2.8,-100.4}},  color = {0, 0, 127}));
  connect(currentSensor_iq.p, ground4.p) annotation (
    Line(points = {{144, -72}, {176, -72}, {176, -72}, {176, -72}}, color = {0, 0, 255}));
  connect(currentSensor_iq.n, modulated_q_voltage.n) annotation (
    Line(points = {{124, -72}, {76, -72}, {76, -66}, {76, -66}}, color = {0, 0, 255}));
  connect(currentSensor_iq.i, product1.u2) annotation (
    Line(points={{134,-83},{134,-84},{-19.6,-84},{-19.6,-77.8}},    color = {0, 0, 127}));
  connect(currentSensor_iq.i, multiProduct1.u[2]) annotation (
    Line(points = {{134, -83}, {202, -83}, {202, 18}, {182, 18}, {182, 21}}, color = {0, 0, 127}));
  connect(currentSensor_id.n, modulated_d_voltage.n) annotation (
    Line(points = {{92, 80}, {64, 80}, {64, 80}, {64, 80}}, color = {0, 0, 255}));
  connect(currentSensor_id.p, ground2.p) annotation (
    Line(points = {{112, 80}, {144, 80}, {144, 80}, {144, 80}}, color = {0, 0, 255}));
  connect(currentSensor_id.i, product2.u1) annotation (
    Line(points={{102,91},{102,104},{-16.4,104},{-16.4,75.2}},    color = {0, 0, 127}));
  connect(currentSensor_id.i, multiProduct2.u[2]) annotation (
    Line(points = {{102, 91}, {102, 104}, {198, 104}, {198, -11}, {182, -11}}, color = {0, 0, 127}));
  connect(ground2.p, vd.n) annotation (
    Line(points = {{144, 80}, {174, 80}, {174, 74}, {174, 74}}, color = {0, 0, 255}));
  connect(ground4.p, vq.n) annotation (
    Line(points = {{176, -72}, {186, -72}, {186, -66}, {186, -66}}, color = {0, 0, 255}));
  connect(resistor2.n, vq.p) annotation (
    Line(points = {{176, -38}, {186, -38}, {186, -46}, {186, -46}}, color = {0, 0, 255}));
  connect(resistor1.n, vd.p) annotation (
    Line(points = {{166, 46}, {174, 46}, {174, 54}, {174, 54}}, color = {0, 0, 255}));
  connect(pin_n, voltageSensor_vdc.n) annotation (
    Line(points = {{-204, -22}, {-56, -22}, {-56, -6}}, color = {0, 0, 255}));
  connect(pin_p, voltageSensor_vdc.p) annotation (
    Line(points = {{-204, 22}, {-99, 22}, {-99, 14}, {-56, 14}}, color = {0, 0, 255}));
  connect(modulated_q_current.p, pin_p) annotation (
    Line(points = {{-84, -30}, {-73, -30}, {-73, -24}, {-72, -24}, {-72, 20}, {-204, 20}, {-204, 22}}, color = {0, 0, 255}));
  connect(modulated_q_current.n, pin_n) annotation (
    Line(points = {{-104, -30}, {-176, -30}, {-176, -22}, {-204, -22}}, color = {0, 0, 255}));
  connect(signalCurrent_phasor1.p, ground_phasor1.p) annotation (
    Line(points = {{365.8, 32}, {365.8, 23}, {365.8, 23}, {365.8, 14}, {363.8, 14}, {363.8, 6}, {363.8, -2.2}, {364, -2.2}}, color = {0, 0, 255}));
  connect(realToComplex1.y, signalCurrent_phasor1.i) annotation (
    Line(points={{368.6,52},{377,52},{377,45},{376,45},{376,39.8}},          color = {85, 170, 255}));
  connect(p, signalCurrent_phasor1.n) annotation (
    Line(points = {{410, 34}, {398, 34}, {398, 34}, {386, 34}, {386, 33}, {386, 31.8}, {386.4, 31.8}}, color = {0, 0, 255}));
  connect(const1.y, multiProduct2.u[1]) annotation (
    Line(points = {{213.2, 2}, {188, 2}, {188, -8}, {182, -8}, {182, -7.73333}}, color = {0, 0, 127}));
  connect(multiProduct1.y, VoltageSource1.v) annotation (
    Line(points = {{166.81, 21}, {84, 21}, {84, 34}, {84, 34}, {84, 34}}, color = {0, 0, 127}));
  connect(const1.y, multiProduct1.u[1]) annotation (
    Line(points={{213.2,2},{208,2},{208,24.2667},{182,24.2667}},          color = {0, 0, 127}));
  connect(VoltageSource1.p, inductor1.p) annotation (
    Line(points = {{94, 46}, {120, 46}}, color = {0, 0, 255}));
  connect(modulated_d_voltage.p, VoltageSource1.n) annotation (
    Line(points = {{64, 60}, {64, 56.5}, {64, 56.5}, {64, 53}, {62, 53}, {62, 46}, {69, 46}, {69, 46}, {71.5, 46}, {71.5, 46}, {74, 46}}, color = {0, 0, 255}));
  connect(inductor1.n, resistor1.p) annotation (
    Line(points = {{140, 46}, {146, 46}}, color = {0, 0, 255}));
  connect(VoltageSource2.n, inductor2.p) annotation (
    Line(points = {{118, -38}, {124, -38}}, color = {0, 0, 255}));
  connect(modulated_q_voltage.p, VoltageSource2.p) annotation (
    Line(points = {{76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}}, color = {0, 0, 255}));
  connect(inductor2.n, resistor2.p) annotation (
    Line(points = {{144, -38}, {150, -38}, {150, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}}, color = {0, 0, 255}));
  connect(product1.y, modulated_q_current.i) annotation (
    Line(points={{-25,-57.1},{-25,-51.5},{-94,-51.5},{-94,-42}},        color = {0, 0, 127}));
  connect(p, pwVoltage.p) annotation (
    Line(points = {{410, 34}, {406, 34}, {406, 94}, {394, 94}}, color = {0, 0, 255}));
  connect(capacitor2.p, pin_p) annotation (
    Line(points = {{-186, 12}, {-186, 12}, {-186, 20}, {-204, 20}, {-204, 22}}, color = {0, 0, 255}));
  connect(capacitor2.n, pin_n) annotation (
    Line(points = {{-186, -8}, {-186, -8}, {-186, -22}, {-204, -22}, {-204, -22}}, color = {0, 0, 255}));
  connect(vdc_droop.vdc, voltageSensor_vdc.v) annotation (
    Line(points={{-170,-80},{-46,-80},{-46,4},{-45,4}},          color = {0, 0, 127}));
  connect(const3.y, vdc_droop.vdcref) annotation (
    Line(points={{-130.5,-49},{-148,-49},{-148,-73.6},{-170,-73.6}},    color = {0, 0, 127}));
  connect(pll2.Vi, pwVoltage.vi) annotation (
    Line(points={{294,-52},{294,-64},{458,-64},{458,122},{344,122},{344,94},{
          364.6,94}},                                                                                 color = {0, 0, 127}));
  connect(pwVoltage.vr, pll2.Vr) annotation (
    Line(points={{364.6,102.4},{354,102.4},{354,116},{442,116},{442,-60},{303.8,
          -60},{303.8,-52}},                                                                            color = {0, 0, 127}));
  connect(gain.u, pll2.Vi) annotation (
    Line(points={{297.4,-121},{308,-121},{308,-78},{294,-78},{294,-52}},          color = {0, 0, 127}));
  connect(pll2.Vr, gain1.u) annotation (
    Line(points={{303.8,-52},{303.8,-74},{318,-74},{318,-157},{297.4,-157}},      color = {0, 0, 127}));
  connect(gain.y, ri_to_dq_v.xi) annotation (
    Line(points={{281.3,-121},{14,-121},{14,-24},{-2,-24},{-2,-12.24},{4.4,
          -12.24}},                                                                     color = {0, 0, 127}));
  connect(ri_to_dq_v.xr, gain1.y) annotation (
    Line(points={{4.4,-7.44},{-4,-7.44},{-4,-58},{34,-58},{34,-157},{281.3,-157}},    color = {0, 0, 127}));
  connect(dq_to_ri.xd, currentSensor_id.i) annotation (
    Line(points={{275.8,62.52},{252,62.52},{252,104},{102,104},{102,92},{102,91},
          {102,91}},                                                                               color = {0, 0, 127}));
  connect(dq_to_ri.xq, currentSensor_iq.i) annotation (
    Line(points={{275.8,55.92},{254,55.92},{254,-88},{134,-88},{134,-83},{134,
          -83}},                                                                          color = {0, 0, 127}));
  connect(dq_to_ri.xr, ri_to_dq_i.xr) annotation (
    Line(points={{302.09,62.41},{310,62.41},{310,112},{-6,112},{-6,14},{4.4,14},
          {4.4,14.56}},                                                                      color = {0, 0, 127}));
  connect(dq_to_ri.xi, ri_to_dq_i.xi) annotation (
    Line(points={{302.09,56.69},{316,56.69},{316,116},{-2,116},{-2,10},{4.4,10},
          {4.4,9.76}},                                                                       color = {0, 0, 127}));
  connect(gain3.y, realToComplex1.re) annotation (
    Line(points={{342.5,55},{354,55},{354,55.6},{354.8,55.6}},  color = {0, 0, 127}));
  connect(gain2.y, realToComplex1.im) annotation (
    Line(points={{338.4,38},{350,38},{350,48},{354.8,48},{354.8,48.4}},    color = {0, 0, 127}));
  connect(dq_to_ri.xr, gain3.u) annotation (
    Line(points={{302.09,62.41},{324,62.41},{324,54},{331,54},{331,55}},   color = {0, 0, 127}));
  connect(dq_to_ri.xi, gain2.u) annotation (
    Line(points={{302.09,56.69},{316,56.69},{316,38},{329.2,38},{329.2,38}},
                                                                           color = {0, 0, 127}));
  connect(ri_to_dq.xr, pwVoltage.vr) annotation (
    Line(points={{233.6,60.56},{244,60.56},{244,102},{364.6,102},{364.6,102.4}},
                                                                              color = {0, 0, 127}));
  connect(pwVoltage.vi, ri_to_dq.xi) annotation (
    Line(points={{364.6,94},{240,94},{240,56},{233.6,56},{233.6,55.76}},   color = {0, 0, 127}));
  connect(ri_to_dq.xd, gain5.u) annotation (
    Line(points={{214.48,60.48},{214.48,66},{210.8,66},{210.8,68}},
                                                                color = {0, 0, 127}));
  connect(gain5.y, vd.v) annotation (
    Line(points={{201.6,68},{194,68},{194,64},{186,64}},        color = {0, 0, 127}));
  connect(ri_to_dq.xq, gain6.u) annotation (
    Line(points={{214.48,56.32},{208,56.32},{208,34},{240,34},{240,-52},{225.2,
          -52}},                                                                        color = {0, 0, 127}));
  connect(vq.v, gain6.y) annotation (
    Line(points={{198,-56},{211.4,-56},{211.4,-52}},    color = {0, 0, 127}));
  connect(const2.y, multiProduct2.u[3]) annotation (
    Line(points={{213.2,-24},{190,-24},{190,-14},{182,-14},{182,-14.2667}},          color = {0, 0, 127}));
  connect(const2.y, multiProduct1.u[3]) annotation (
    Line(points={{213.2,-24},{204,-24},{204,24},{182,24},{182,17.7333}},          color = {0, 0, 127}));
  connect(inner_control_I_limitation.igd, ri_to_dq_i.xd) annotation (
    Line(points={{48.3,8.1},{36,8.1},{36,14},{23.52,14},{23.52,14.48}},
                                                                    color = {0, 0, 127}));
  connect(ri_to_dq_i.xq, inner_control_I_limitation.igq) annotation (
    Line(points={{23.52,10.32},{34,10.32},{34,4},{48.3,4},{48.3,3.9}},
                                                                   color = {0, 0, 127}));
  connect(inner_control_I_limitation.vgd, ri_to_dq_v.xd) annotation (
    Line(points={{48.3,-0.1},{34,-0.1},{34,-7.52},{23.52,-7.52}},
                                                          color = {0, 0, 127}));
  connect(ri_to_dq_v.xq, inner_control_I_limitation.vgq) annotation (
    Line(points={{23.52,-11.68},{40,-11.68},{40,-4.1},{48.3,-4.1}},
                                                              color = {0, 0, 127}));
  connect(inner_control_I_limitation.wpll, const2.y) annotation (
    Line(points={{48.3,-11.5},{42,-11.5},{42,-20},{190,-20},{190,-24},{213.2,
          -24},{213.2,-24}},                                                                         color = {0, 0, 127}));
  connect(inner_control_I_limitation.vmd, modulated_d_voltage.v) annotation (
    Line(points={{71.6,3.8},{78,3.8},{78,34},{40,34},{40,70},{52,70},{52,70}},          color = {0, 0, 127}));
  connect(inner_control_I_limitation.vmq, modulated_q_voltage.v) annotation (
    Line(points={{71.6,-4.8},{88,-4.8},{88,-34},{56,-34},{56,-56},{64,-56},{64,
          -56}},                                                                               color = {0, 0, 127}));
  connect(inner_control_I_limitation.igdref, idqref_calc_VSC1.igdref) annotation (
    Line(points={{56.3,13.7},{56.3,13.7},{56.3,36},{-54,36},{-54,86},{-92.16,86},
          {-92.16,85.6}},                                                                     color = {0, 0, 127}));
  connect(idqref_calc_VSC1.igqref, inner_control_I_limitation.igqref) annotation (
    Line(points={{-92.16,65.92},{-34,65.92},{-34,38},{62,38},{62,13.7},{61.5,
          13.7}},                                                                  color = {0, 0, 127}));
  connect(limiter.y, idqref_calc_VSC1.Qref) annotation (
    Line(points={{-209,54},{-174,54},{-174,64},{-148.8,64},{-148.8,66.4}},      color = {0, 0, 127}));
  connect(limiter.u, Qref) annotation (
    Line(points={{-232,54},{-258,54},{-258,55},{-263,55}},          color = {0, 0, 127}));
  connect(limiter1.y, idqref_calc_VSC1.Pref) annotation (
    Line(points={{-165,90},{-150,90},{-150,85.6},{-148.8,85.6}},    color = {0, 0, 127}));
  connect(vdc_control_master.vdcref, const3.y) annotation (
    Line(points={{-168,-105.6},{-148,-105.6},{-148,-49},{-130.5,-49}},    color = {0, 0, 127}));
  connect(voltageSensor_vdc.v, vdc_control_master.vdc) annotation (
    Line(points={{-45,4},{-46,4},{-46,-112},{-168,-112}},          color = {0, 0, 127}));
  connect(add3.y, limiter1.u) annotation (
    Line(points={{-204.5,91},{-188,91},{-188,90},{-188,90}},        color = {0, 0, 127}));
  connect(pLL_ideal.Vi, pwVoltage.vi) annotation (
    Line(points={{348,130},{348,130},{348,94},{364.6,94},{364.6,94}},        color = {0, 0, 127}));
  connect(pwVoltage.vr, pLL_ideal.Vr) annotation (
    Line(points={{364.6,102.4},{358,102.4},{358,128},{358,130},{357.8,130}},    color = {0, 0, 127}));
  annotation (
    Icon,
    __OpenModelica_commandLineOptions = "");
end VSC_new_pll;
