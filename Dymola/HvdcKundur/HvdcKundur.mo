package HvdcKundur
  model NetworkSimu
    parameter Real r = 0.0001;
    parameter Real x = 0.001;
    parameter Real b = 0.00175 * 0.5;
    replaceable Data.PF PF_results constrainedby Support.PF_TwoAreas annotation (
       Placement(transformation(extent = {{-220, -40}, {-200, -20}})));
    OpenIPSL.Electrical.Buses.Bus bus1 annotation (
      Placement(transformation(extent = {{-194, 20}, {-174, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus3 annotation (
      Placement(transformation(extent = {{170, 20}, {190, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus4 annotation (
      Placement(transformation(extent = {{170, -20}, {190, 0}})));
    OpenIPSL.Electrical.Buses.Bus bus5 annotation (
      Placement(transformation(extent = {{-150, 20}, {-130, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus6 annotation (
      Placement(transformation(extent = {{-110, 20}, {-90, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus8 annotation (
      Placement(transformation(extent = {{-10, 20}, {10, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus10 annotation (
      Placement(transformation(extent = {{90, 20}, {110, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus11 annotation (
      Placement(transformation(extent = {{130, 20}, {150, 40}})));
    Groups.PSSE.AVR.G1 g1(V_0 = PF_results.voltages.V1, angle_0 = PF_results.voltages.A1, P_0 = PF_results.machines.P1_1, Q_0 = PF_results.machines.Q1_1) annotation (
      Placement(transformation(extent = {{-214, 24}, {-202, 36}})));
    Groups.PSSE.AVR.G2 g2(V_0 = PF_results.voltages.V2, angle_0 = PF_results.voltages.A2, P_0 = PF_results.machines.P2_1, Q_0 = PF_results.machines.Q2_1) annotation (
      Placement(transformation(extent = {{-214, -6}, {-202, 6}})));
    Groups.PSSE.AVR.G3 g3(V_0 = PF_results.voltages.V3, angle_0 = PF_results.voltages.A3, P_0 = PF_results.machines.P3_1, Q_0 = PF_results.machines.Q3_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, 30})));
    Groups.PSSE.AVR.G4 g4(V_0 = PF_results.voltages.V4, angle_0 = PF_results.voltages.A4, P_0 = PF_results.machines.P4_1, Q_0 = PF_results.machines.Q4_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, -10})));
    OpenIPSL.Electrical.Branches.PwLine Line6_7(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{-90, 20}, {-70, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_6(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{-130, 20}, {-110, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_2(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_2(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 10}, {40, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 30}, {40, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line9_10(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{70, 20}, {90, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line10_11(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{110, 20}, {130, 40}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load7(PQBRAK = 0.7, V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, P_0 = PF_results.loads.PL7_1, Q_0 = PF_results.loads.QL7_1) annotation (
      Placement(transformation(extent = {{-78, -26}, {-50, 0}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load9(PQBRAK = 0.7, V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, P_0 = PF_results.loads.PL9_1, Q_0 = PF_results.loads.QL9_1) annotation (
      Placement(transformation(extent = {{80, -26}, {50, 0}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_1(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, 20}, {-150, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_2(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, -10}, {-150, 10}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_3(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, 20}, {170, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_4(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, -20}, {170, 0}})));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation (
      Placement(transformation(extent = {{-220, 48}, {-172, 62}})));
    HVDCcomponents.DC_cable dC_cable1(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {-6, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {-52, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {36, 102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {20, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
      Placement(visible = true, transformation(origin = {38, 148}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    HVDCcomponents.vdc_control vdc_control1 annotation (
      Placement(visible = true, transformation(origin = {68, 184}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {138, 98}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-150, 98}, extent = {{3.6, -3}, {-3.6, 3}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step2(height = 0, startTime = 2) annotation (
      Placement(visible = true, transformation(origin = {-50, 174}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step3(height = 400E3, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {2, 190}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    ExcitationGeneration.Bus bus7(V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, displayPF = true)  annotation (
      Placement(transformation(extent = {{-68, 20}, {-48, 40}})));
    ExcitationGeneration.Bus bus9(V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, displayPF = true)  annotation (
      Placement(transformation(extent = {{48, 20}, {68, 40}})));
    Modelica.Blocks.Interfaces.RealOutput u annotation (
      Placement(transformation(extent = {{-176, 136}, {-156, 156}})));
    Modelica.Blocks.Interfaces.RealOutput y1 annotation (
      Placement(transformation(extent = {{78, 70}, {98, 90}})));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation (
      Placement(transformation(extent = {{54, 74}, {66, 86}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu annotation (
      Placement(transformation(extent = {{-240, 136}, {-220, 156}})));
    Modelica.Blocks.Sources.Constant const(k = 10) annotation (
      Placement(transformation(extent = {{-240, 162}, {-234, 168}})));
    Modelica.Blocks.Sources.Constant const1(k = 5) annotation (
      Placement(transformation(extent = {{-240, 172}, {-234, 178}})));
    ExcitationGeneration.Ground_phasor ground_phasor annotation (
      Placement(transformation(extent = {{-216, 144}, {-212, 148}})));
    Modelica.Blocks.Math.Gain gain(k=1e6)   annotation (
      Placement(transformation(extent = {{-198, 132}, {-190, 140}})));
    ExcitationGeneration.Bus bus2 annotation (
      Placement(transformation(extent = {{-194, -10}, {-174, 10}})));
    HVDCcomponents.PQ_sensor pQ_sensor3(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 180)));
    Modelica.Blocks.Interfaces.RealOutput y3 annotation (
      Placement(transformation(extent = {{-40, 0}, {-28, 12}})));
    Modelica.Blocks.Continuous.TransferFunction filter(b = {1}, a = {0.1, 1}) annotation (
      Placement(transformation(extent = {{-142, 116}, {-132, 126}})));
    Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime = 0.1) annotation (
      Placement(transformation(extent = {{-162, 116}, {-152, 126}})));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis1(Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vgd = PF_results.voltages.V7 * 400E3, teta_bus = PF_results.voltages.A7 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {-96, 102}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis2(Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vgd = PF_results.voltages.V9 * 400E3, teta_bus = PF_results.voltages.A9 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {86, 112}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu_load(
        generateMultiSine_P(M=0))
      annotation (Placement(transformation(extent={{-190,-54},{-170,-34}})));
    Modelica.Blocks.Interfaces.RealOutput n_load
      annotation (Placement(transformation(extent={{-162,-56},{-148,-42}})));
  equation
    connect(vSC_station_dq0_with_control_PLL_bis2.p, pQ_sensor1.p) annotation (
      Line(points={{97,111.8},{118,111.8},{118,98},{134.4,98},{134.4,98}},    color = {0, 0, 255}));
    connect(step2.y, vSC_station_dq0_with_control_PLL_bis2.Qref) annotation (
      Line(points={{-43.4,174},{-4,174},{-4,128},{14,128},{14,116},{74.5,116},{
            74.5,115.9}},                                                                           color = {0, 0, 127}));
    connect(vdc_control1.Pref, vSC_station_dq0_with_control_PLL_bis2.Pref) annotation (
      Line(points={{79,185},{88,185},{88,132},{68,132},{68,122},{74.5,122},{
            74.5,120.5}},                                                                          color = {0, 0, 127}));
    connect(capacitor2.n, vSC_station_dq0_with_control_PLL_bis2.pin_n) annotation (
      Line(points={{36,92},{60,92},{60,106},{75.2,106},{75.2,105.6}},      color = {0, 0, 255}));
    connect(capacitor2.p, vSC_station_dq0_with_control_PLL_bis2.pin_p) annotation (
      Line(points={{36,112},{56,112},{56,110},{75,110},{75,109.8}},          color = {0, 0, 255}));
    connect(filter.y, vSC_station_dq0_with_control_PLL_bis1.Pref) annotation (
      Line(points={{-131.5,121},{-112,121},{-112,120},{-78,120},{-78,110},{
            -64.5,110},{-64.5,110.5}},                                                                       color = {0, 0, 127}));
    connect(step2.y, vSC_station_dq0_with_control_PLL_bis1.Qref) annotation (
      Line(points={{-43.4,174},{-32,174},{-32,126},{-68,126},{-68,106},{-64.5,
            106},{-64.5,105.9}},                                                                          color = {0, 0, 127}));
    connect(capacitor1.n, vSC_station_dq0_with_control_PLL_bis1.pin_n) annotation (
      Line(points={{-52,94},{-68,94},{-68,96},{-65.2,96},{-65.2,95.6}},      color = {0, 0, 255}));
    connect(capacitor1.p, vSC_station_dq0_with_control_PLL_bis1.pin_p) annotation (
      Line(points={{-52,114},{-64,114},{-64,100},{-65,100},{-65,99.8}},           color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.p, pQ_sensor2.p) annotation (
      Line(points={{-87,101.8},{-126,101.8},{-126,98},{-146.4,98},{-146.4,98}},     color = {0, 0, 255}));
    connect(vdc_control1.vdcref, step3.y) annotation (
      Line(points = {{56, 188.4}, {12, 188.4}, {12, 190}, {10.8, 190}}, color = {0, 0, 127}));
    connect(vdc_control1.vdc, voltageSensor1.v) annotation (
      Line(points = {{56, 182}, {38, 182}, {38, 159}, {38, 159}}, color = {0, 0, 127}));
    connect(voltageSensor1.n, capacitor2.n) annotation (
      Line(points = {{48, 148}, {48, 148}, {48, 92}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(voltageSensor1.p, capacitor2.p) annotation (
      Line(points = {{28, 148}, {22, 148}, {22, 122}, {36, 122}, {36, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(ground1.p, capacitor2.n) annotation (
      Line(points = {{20, 86}, {36, 86}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(capacitor2.n, dC_cable1.pin_n1) annotation (
      Line(points = {{36, 92}, {12, 92}, {12, 104}, {4.4, 104}, {4.4, 104}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_p1, capacitor2.p) annotation (
      Line(points = {{4.4, 111.8}, {36.4, 111.8}, {36.4, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_n, capacitor1.n) annotation (
      Line(points = {{-16.3, 103.9}, {-32.3, 103.9}, {-32.3, 93.9}, {-52, 93.9}, {-52, 94}}, color = {0, 0, 255}));
    connect(capacitor1.p, dC_cable1.pin_p) annotation (
      Line(points = {{-52, 114}, {-22, 114}, {-22, 112}, {-16.4, 112}, {-16.4, 112}}, color = {0, 0, 255}));
    connect(g1.pwPin, bus1.p) annotation (
      Line(points = {{-201.4, 30}, {-184, 30}}, color = {0, 0, 255}));
    connect(Line6_7.p, bus6.p) annotation (
      Line(points = {{-89, 30}, {-89, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.n, bus6.p) annotation (
      Line(points = {{-111, 30}, {-111, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.p, bus5.p) annotation (
      Line(points = {{-129, 30}, {-129, 30}, {-140, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.p, bus8.p) annotation (
      Line(points = {{21, 20}, {6, 20}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.p, bus8.p) annotation (
      Line(points = {{21, 40}, {6, 40}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_2.n, bus8.p) annotation (
      Line(points = {{-21, 20}, {-6, 20}, {-6, 22}, {-6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_1.n, bus8.p) annotation (
      Line(points = {{-21, 40}, {-6, 40}, {-6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line9_10.n, bus10.p) annotation (
      Line(points = {{89, 30}, {89, 30}, {100, 30}}, color = {0, 0, 255}));
    connect(bus10.p, Line10_11.p) annotation (
      Line(points = {{100, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line10_11.n, bus11.p) annotation (
      Line(points = {{129, 30}, {129, 30}, {140, 30}}, color = {0, 0, 255}));
    connect(g4.pwPin, bus4.p) annotation (
      Line(points = {{201.4, -10}, {201.4, -10}, {180, -10}}, color = {0, 0, 255}));
    connect(g3.pwPin, bus3.p) annotation (
      Line(points = {{201.4, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(Load9.p, Line9_10.p) annotation (
      Line(points = {{65, 0}, {66, 0}, {66, 30}, {71, 30}}, color = {0, 0, 255}));
    connect(bus1.p, Line5_1.p) annotation (
      Line(points = {{-184, 30}, {-169, 30}}, color = {0, 0, 255}));
    connect(bus5.p, Line5_1.n) annotation (
      Line(points = {{-140, 30}, {-151, 30}}, color = {0, 0, 255}));
    connect(Line5_2.n, bus6.p) annotation (
      Line(points = {{-151, 0}, {-104, 0}, {-104, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(bus11.p, Line5_3.p) annotation (
      Line(points = {{140, 30}, {151, 30}}, color = {0, 0, 255}));
    connect(Line5_3.n, bus3.p) annotation (
      Line(points = {{169, 30}, {169, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(bus4.p, Line5_4.n) annotation (
      Line(points = {{180, -10}, {169, -10}}, color = {0, 0, 255}));
    connect(Line5_4.p, Line10_11.p) annotation (
      Line(points = {{151, -10}, {104, -10}, {104, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line6_7.n, bus7.p) annotation (
      Line(points = {{-71, 30}, {-58, 30}}, color = {0, 0, 255}));
    connect(Load7.p, bus7.p) annotation (
      Line(points = {{-64, 0}, {-64, 30}, {-58, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor2.n, bus7.p) annotation (
      Line(points = {{-153.6, 98}, {-162, 98}, {-162, 56}, {-58, 56}, {-58, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.n, bus9.p) annotation (
      Line(points = {{39, 40}, {44, 40}, {44, 30}, {58, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.n, bus9.p) annotation (
      Line(points = {{39, 20}, {44, 20}, {44, 30}, {58, 30}}, color = {0, 0, 255}));
    connect(bus9.p, Line9_10.p) annotation (
      Line(points = {{58, 30}, {71, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor1.n, bus9.p) annotation (
      Line(points = {{141.6, 98}, {160, 98}, {160, 56}, {58, 56}, {58, 30}}, color = {0, 0, 255}));
    connect(add1.u1, bus7.Angle) annotation (
      Line(points = {{52.8, 83.6}, {52.8, 84}, {-48, 84}, {-48, 37.2}}, color = {0, 0, 127}));
    connect(add1.u2, bus9.Angle) annotation (
      Line(points = {{52.8, 76.4}, {38, 76.4}, {38, 48}, {68, 48}, {68, 37.2}}, color = {0, 0, 127}));
    connect(const.y, multisine_Noise_Simu.vr) annotation (
      Line(points = {{-233.7, 165}, {-226.4, 165}, {-226.4, 156}}, color = {0, 0, 127}));
    connect(const1.y, multisine_Noise_Simu.vi) annotation (
      Line(points = {{-233.7, 175}, {-223.6, 175}, {-223.6, 156}}, color = {0, 0, 127}));
    connect(multisine_Noise_Simu.pwPin, ground_phasor.p) annotation (
      Line(points = {{-221, 149}, {-214, 149}, {-214, 147.96}}, color = {0, 0, 255}));
    connect(gain.u, multisine_Noise_Simu.y1_u) annotation (
      Line(points = {{-198.8, 136}, {-210, 136}, {-210, 141}, {-221, 141}}, color = {0, 0, 127}));
    connect(u, multisine_Noise_Simu.y1_u) annotation (
      Line(points = {{-166, 146}, {-210, 146}, {-210, 141}, {-221, 141}}, color = {0, 0, 127}));
    connect(g2.pwPin, bus2.p) annotation (
      Line(points = {{-201.4, 0}, {-184, 0}}, color = {0, 0, 255}));
    connect(bus2.p, Line5_2.p) annotation (
      Line(points = {{-184, 0}, {-169, 0}}, color = {0, 0, 255}));
    connect(add1.y, y1) annotation (
      Line(points = {{66.6, 80}, {88, 80}}, color = {0, 0, 127}));
    connect(bus7.p, pQ_sensor3.n) annotation (
      Line(points = {{-58, 30}, {-49.6, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor3.p, Line7_8_1.p) annotation (
      Line(points = {{-42.4, 30}, {-39, 30}, {-39, 40}}, color = {0, 0, 255}));
    connect(Line7_8_2.p, Line7_8_1.p) annotation (
      Line(points = {{-39, 20}, {-40, 20}, {-40, 30}, {-39, 30}, {-39, 40}}, color = {0, 0, 255}));
    connect(fixedDelay.y, filter.u) annotation (
      Line(points = {{-151.5, 121}, {-146.75, 121}, {-146.75, 121}, {-143, 121}}, color = {0, 0, 127}));
    connect(gain.y, fixedDelay.u) annotation (
      Line(points = {{-189.6, 136}, {-186, 136}, {-186, 121}, {-163, 121}}, color = {0, 0, 127}));
    connect(y3, pQ_sensor3.p12) annotation (Line(points={{-34,6},{-49.6,6},{
            -49.6,27.6}}, color={0,0,127}));
    connect(bus2.Vr, multisine_Noise_Simu_load.vr) annotation (Line(points={{
            -174,-1.2},{-174,-24},{-176.4,-24},{-176.4,-34}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.vi, bus2.Vi) annotation (Line(points={{
            -173.6,-34},{-173.6,-26},{-172,-26},{-172,0.8},{-174,0.8}}, color={
            0,0,127}));
    connect(multisine_Noise_Simu_load.pwPin, bus2.p) annotation (Line(points={{
            -171,-41},{-142,-41},{-142,-62},{-192,-62},{-192,-24},{-184,-24},{
            -184,0}}, color={0,0,255}));
    connect(multisine_Noise_Simu_load.y1_u, n_load) annotation (Line(points={{
            -171,-49},{-165.5,-49},{-165.5,-49},{-155,-49}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-240, -80}, {220, 220}}), graphics={  Text(lineColor = {28, 108, 200}, extent = {{-72, -66}, {50, -74}}, textString = "Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
      Icon(coordinateSystem(extent = {{-240, -80}, {220, 220}}, preserveAspectRatio = false)),
      Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
      experiment(StopTime = 10, Interval = 0.01, Tolerance = 0.001),
      __OpenModelica_commandLineOptions = "");
  end NetworkSimu;

  model NetworkSysId
    parameter Real r = 0.0001;
    parameter Real x = 0.001;
    parameter Real b = 0.00175 * 0.5;
    replaceable Data.PF PF_results constrainedby Support.PF_TwoAreas annotation (
       Placement(transformation(extent = {{-220, -40}, {-200, -20}})));
    OpenIPSL.Electrical.Buses.Bus bus1 annotation (
      Placement(transformation(extent = {{-190, 20}, {-170, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus2 annotation (
      Placement(transformation(extent = {{-190, -10}, {-170, 10}})));
    OpenIPSL.Electrical.Buses.Bus bus3 annotation (
      Placement(transformation(extent = {{170, 20}, {190, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus4 annotation (
      Placement(transformation(extent = {{170, -20}, {190, 0}})));
    OpenIPSL.Electrical.Buses.Bus bus5 annotation (
      Placement(transformation(extent = {{-150, 20}, {-130, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus6 annotation (
      Placement(transformation(extent = {{-110, 20}, {-90, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus8 annotation (
      Placement(transformation(extent = {{-10, 20}, {10, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus10 annotation (
      Placement(transformation(extent = {{90, 20}, {110, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus11 annotation (
      Placement(transformation(extent = {{130, 20}, {150, 40}})));
    Groups.PSSE.AVR.G1 g1(V_0 = PF_results.voltages.V1, angle_0 = PF_results.voltages.A1, P_0 = PF_results.machines.P1_1, Q_0 = PF_results.machines.Q1_1) annotation (
      Placement(transformation(extent = {{-214, 24}, {-202, 36}})));
    Groups.PSSE.AVR.G2 g2(V_0 = PF_results.voltages.V2, angle_0 = PF_results.voltages.A2, P_0 = PF_results.machines.P2_1, Q_0 = PF_results.machines.Q2_1) annotation (
      Placement(transformation(extent = {{-214, -6}, {-202, 6}})));
    Groups.PSSE.AVR.G3 g3(V_0 = PF_results.voltages.V3, angle_0 = PF_results.voltages.A3, P_0 = PF_results.machines.P3_1, Q_0 = PF_results.machines.Q3_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, 30})));
    Groups.PSSE.AVR.G4 g4(V_0 = PF_results.voltages.V4, angle_0 = PF_results.voltages.A4, P_0 = PF_results.machines.P4_1, Q_0 = PF_results.machines.Q4_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, -10})));
    OpenIPSL.Electrical.Branches.PwLine Line6_7(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{-90, 20}, {-70, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_6(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{-130, 20}, {-110, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_2(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_2(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 10}, {40, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 30}, {40, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line9_10(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{70, 20}, {90, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line10_11(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{110, 20}, {130, 40}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load7(PQBRAK = 0.7, V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, P_0 = PF_results.loads.PL7_1, Q_0 = PF_results.loads.QL7_1) annotation (
      Placement(transformation(extent = {{-80, -26}, {-52, 0}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load9(PQBRAK = 0.7, V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, P_0 = PF_results.loads.PL9_1, Q_0 = PF_results.loads.QL9_1) annotation (
      Placement(transformation(extent = {{80, -26}, {50, 0}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_1(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, 20}, {-150, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_2(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, -10}, {-150, 10}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_3(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, 20}, {170, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_4(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, -20}, {170, 0}})));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation (
      Placement(transformation(extent = {{-220, 48}, {-172, 62}})));
    HVDCcomponents.DC_cable dC_cable1(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {-6, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {-52, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {36, 102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {20, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
      Placement(visible = true, transformation(origin = {38, 148}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    HVDCcomponents.vdc_control vdc_control1 annotation (
      Placement(visible = true, transformation(origin = {68, 184}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {138, 98}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-150, 98}, extent = {{3.6, -3}, {-3.6, 3}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step2(height = 0, startTime = 2) annotation (
      Placement(visible = true, transformation(origin = {-50, 174}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step3(height = 400E3, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {2, 190}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    ExcitationGeneration.Bus bus7(V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, displayPF = true)  annotation (
      Placement(transformation(extent = {{-72, 20}, {-52, 40}})));
    ExcitationGeneration.Bus bus9(V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, displayPF = true)  annotation (
      Placement(transformation(extent = {{48, 20}, {68, 40}})));
    Modelica.Blocks.Interfaces.RealOutput y1 annotation (
      Placement(transformation(extent = {{78, 70}, {98, 90}})));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation (
      Placement(transformation(extent = {{54, 74}, {66, 86}})));
    Modelica.Blocks.Interfaces.RealInput P_ref annotation (
      Placement(transformation(extent = {{-220, 104}, {-180, 144}})));
    Modelica.Blocks.Math.Gain gain(k = 1e6) annotation (
      Placement(transformation(extent = {{-174, 120}, {-166, 128}})));
    HVDCcomponents.PQ_sensor pQ_sensor3(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 180)));
    Modelica.Blocks.Continuous.TransferFunction filter(b = {1}, a = {0.1, 1}) annotation (
      Placement(transformation(extent = {{-144, 110}, {-134, 120}})));
    Modelica.Blocks.Interfaces.RealOutput y3 annotation (
      Placement(transformation(extent = {{-24, -8}, {-4, 12}})));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis1(Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vgd = PF_results.voltages.V7 * 400E3, teta_bus = PF_results.voltages.A7 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {-96, 104}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis2(Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vgd = PF_results.voltages.V9 * 400E3, teta_bus = PF_results.voltages.A9 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {88, 106}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  equation
    connect(step2.y, vSC_station_dq0_with_control_PLL_bis2.Qref) annotation (
      Line(points={{-43.4,174},{-6,174},{-6,126},{18,126},{18,116},{60,116},{60,
            110},{76.5,110},{76.5,109.9}},                                                                                color = {0, 0, 127}));
    connect(vdc_control1.Pref, vSC_station_dq0_with_control_PLL_bis2.Pref) annotation (
      Line(points={{79,185},{96,185},{96,130},{68,130},{68,116},{76.5,116},{
            76.5,114.5}},                                                                          color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis2.p, pQ_sensor1.p) annotation (
      Line(points={{99,105.8},{118,105.8},{118,98},{134.4,98},{134.4,98}},     color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis2.pin_n, capacitor2.n) annotation (
      Line(points={{77.2,99.6},{58,99.6},{58,92},{36,92},{36,92}},        color = {0, 0, 255}));
    connect(capacitor2.p, vSC_station_dq0_with_control_PLL_bis2.pin_p) annotation (
      Line(points={{36,112},{56,112},{56,104},{77,104},{77,103.8}},          color = {0, 0, 255}));
    connect(step2.y, vSC_station_dq0_with_control_PLL_bis1.Qref) annotation (
      Line(points={{-43.4,174},{-34,174},{-34,128},{-72,128},{-72,108},{-64.5,
            108},{-64.5,107.9}},                                                                          color = {0, 0, 127}));
    connect(filter.y, vSC_station_dq0_with_control_PLL_bis1.Pref) annotation (
      Line(points={{-133.5,115},{-116,115},{-116,124},{-78,124},{-78,112},{
            -64.5,112},{-64.5,112.5}},                                                                       color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis1.p, pQ_sensor2.p) annotation (
      Line(points={{-87,103.8},{-116,103.8},{-116,98},{-146.4,98},{-146.4,98}},     color = {0, 0, 255}));
    connect(capacitor1.n, vSC_station_dq0_with_control_PLL_bis1.pin_n) annotation (
      Line(points={{-52,94},{-72,94},{-72,98},{-65.2,98},{-65.2,97.6}},      color = {0, 0, 255}));
    connect(capacitor1.p, vSC_station_dq0_with_control_PLL_bis1.pin_p) annotation (
      Line(points={{-52,114},{-66,114},{-66,102},{-65,102},{-65,101.8}},          color = {0, 0, 255}));
    connect(vdc_control1.vdcref, step3.y) annotation (
      Line(points = {{56, 188.4}, {12, 188.4}, {12, 190}, {10.8, 190}}, color = {0, 0, 127}));
    connect(vdc_control1.vdc, voltageSensor1.v) annotation (
      Line(points = {{56, 182}, {38, 182}, {38, 159}, {38, 159}}, color = {0, 0, 127}));
    connect(voltageSensor1.n, capacitor2.n) annotation (
      Line(points = {{48, 148}, {48, 148}, {48, 92}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(voltageSensor1.p, capacitor2.p) annotation (
      Line(points = {{28, 148}, {22, 148}, {22, 122}, {36, 122}, {36, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(ground1.p, capacitor2.n) annotation (
      Line(points = {{20, 86}, {36, 86}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(capacitor2.n, dC_cable1.pin_n1) annotation (
      Line(points = {{36, 92}, {12, 92}, {12, 104}, {4.4, 104}, {4.4, 104}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_p1, capacitor2.p) annotation (
      Line(points = {{4.4, 111.8}, {36.4, 111.8}, {36.4, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_n, capacitor1.n) annotation (
      Line(points = {{-16.3, 103.9}, {-32.3, 103.9}, {-32.3, 93.9}, {-52, 93.9}, {-52, 94}}, color = {0, 0, 255}));
    connect(capacitor1.p, dC_cable1.pin_p) annotation (
      Line(points = {{-52, 114}, {-22, 114}, {-22, 112}, {-16.4, 112}, {-16.4, 112}}, color = {0, 0, 255}));
    connect(g1.pwPin, bus1.p) annotation (
      Line(points = {{-201.4, 30}, {-201.4, 30}, {-180, 30}}, color = {0, 0, 255}));
    connect(g2.pwPin, bus2.p) annotation (
      Line(points = {{-201.4, 0}, {-201.4, 0}, {-180, 0}}, color = {0, 0, 255}));
    connect(Line6_7.p, bus6.p) annotation (
      Line(points = {{-89, 30}, {-89, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.n, bus6.p) annotation (
      Line(points = {{-111, 30}, {-111, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.p, bus5.p) annotation (
      Line(points = {{-129, 30}, {-129, 30}, {-140, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.p, bus8.p) annotation (
      Line(points = {{21, 20}, {6, 20}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.p, bus8.p) annotation (
      Line(points = {{21, 40}, {6, 40}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_2.n, bus8.p) annotation (
      Line(points = {{-21, 20}, {-6, 20}, {-6, 22}, {-6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_1.n, bus8.p) annotation (
      Line(points = {{-21, 40}, {-6, 40}, {-6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line9_10.n, bus10.p) annotation (
      Line(points = {{89, 30}, {89, 30}, {100, 30}}, color = {0, 0, 255}));
    connect(bus10.p, Line10_11.p) annotation (
      Line(points = {{100, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line10_11.n, bus11.p) annotation (
      Line(points = {{129, 30}, {129, 30}, {140, 30}}, color = {0, 0, 255}));
    connect(g4.pwPin, bus4.p) annotation (
      Line(points = {{201.4, -10}, {201.4, -10}, {180, -10}}, color = {0, 0, 255}));
    connect(g3.pwPin, bus3.p) annotation (
      Line(points = {{201.4, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(Load9.p, Line9_10.p) annotation (
      Line(points = {{65, 0}, {66, 0}, {66, 30}, {71, 30}}, color = {0, 0, 255}));
    connect(bus1.p, Line5_1.p) annotation (
      Line(points = {{-180, 30}, {-169, 30}}, color = {0, 0, 255}));
    connect(bus5.p, Line5_1.n) annotation (
      Line(points = {{-140, 30}, {-151, 30}}, color = {0, 0, 255}));
    connect(bus2.p, Line5_2.p) annotation (
      Line(points = {{-180, 0}, {-169, 0}}, color = {0, 0, 255}));
    connect(Line5_2.n, bus6.p) annotation (
      Line(points = {{-151, 0}, {-104, 0}, {-104, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(bus11.p, Line5_3.p) annotation (
      Line(points = {{140, 30}, {151, 30}}, color = {0, 0, 255}));
    connect(Line5_3.n, bus3.p) annotation (
      Line(points = {{169, 30}, {169, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(bus4.p, Line5_4.n) annotation (
      Line(points = {{180, -10}, {169, -10}}, color = {0, 0, 255}));
    connect(Line5_4.p, Line10_11.p) annotation (
      Line(points = {{151, -10}, {104, -10}, {104, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line6_7.n, bus7.p) annotation (
      Line(points = {{-71, 30}, {-62, 30}}, color = {0, 0, 255}));
    connect(Load7.p, bus7.p) annotation (
      Line(points = {{-66, 0}, {-66, 30}, {-62, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor2.n, bus7.p) annotation (
      Line(points = {{-153.6, 98}, {-162, 98}, {-162, 56}, {-62, 56}, {-62, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.n, bus9.p) annotation (
      Line(points = {{39, 40}, {44, 40}, {44, 30}, {58, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.n, bus9.p) annotation (
      Line(points = {{39, 20}, {44, 20}, {44, 30}, {58, 30}}, color = {0, 0, 255}));
    connect(bus9.p, Line9_10.p) annotation (
      Line(points = {{58, 30}, {71, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor1.n, bus9.p) annotation (
      Line(points = {{141.6, 98}, {160, 98}, {160, 56}, {58, 56}, {58, 30}}, color = {0, 0, 255}));
    connect(add1.u1, bus7.Angle) annotation (
      Line(points = {{52.8, 83.6}, {52.8, 84}, {-52, 84}, {-52, 37.2}}, color = {0, 0, 127}));
    connect(add1.u2, bus9.Angle) annotation (
      Line(points = {{52.8, 76.4}, {38, 76.4}, {38, 48}, {68, 48}, {68, 37.2}}, color = {0, 0, 127}));
    connect(add1.y, y1) annotation (
      Line(points = {{66.6, 80}, {88, 80}}, color = {0, 0, 127}));
    connect(P_ref, gain.u) annotation (
      Line(points = {{-200, 124}, {-174.8, 124}}, color = {0, 0, 127}));
    connect(bus7.p, pQ_sensor3.n) annotation (
      Line(points = {{-62, 30}, {-49.6, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor3.p, Line7_8_2.p) annotation (
      Line(points = {{-42.4, 30}, {-39, 30}, {-39, 20}}, color = {0, 0, 255}));
    connect(Line7_8_1.p, Line7_8_2.p) annotation (
      Line(points = {{-39, 40}, {-40, 40}, {-40, 30}, {-39, 30}, {-39, 20}}, color = {0, 0, 255}));
    connect(filter.u, gain.y) annotation (
      Line(points = {{-145, 115}, {-156.5, 115}, {-156.5, 124}, {-165.6, 124}}, color = {0, 0, 127}));
    connect(y3, pQ_sensor3.p12) annotation (Line(points={{-14,2},{-49.6,2},{
            -49.6,27.6}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-240, -80}, {220, 220}}), graphics={  Text(lineColor = {28, 108, 200}, extent = {{-72, -66}, {50, -74}}, textString = "Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
      Icon(coordinateSystem(extent = {{-240, -80}, {220, 220}}, preserveAspectRatio = false)),
      Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
      experiment(StopTime = 10, Interval = 0.01, Tolerance = 0.001),
      __OpenModelica_commandLineOptions = "");
  end NetworkSysId;
  annotation (
    uses(Modelica(version = "3.2.3"), OpenIPSL(version = "1.5.0")));
end HvdcKundur;
