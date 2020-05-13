package LinearIEEE_9_Buses_with_3T_MTDC
  model NetworkSimu
    import Modelica.Constants.pi;
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(kT = 16.5 / 230, x = 0.0576, r = 0, V_b = 16.5, Vn = 16.5) annotation (
      Placement(visible = true, transformation(origin={84,-124},   extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    OpenIPSL.Electrical.Branches.PwLine line_6_4(R = 0.017, X = 0.092, G = 0, B = 0.079, opening = 1) annotation (
      Placement(visible = true, transformation(origin = {224, -27}, extent = {{-9, -6}, {9, 6}}, rotation = 270)));
    OpenIPSL.Electrical.Branches.PwLine line_4_5(G = 0, R = 0.01, X = 0.085, B = 0.088) annotation (
      Placement(transformation(extent = {{-9, -6}, {9, 6}}, rotation = 270, origin = {-72, -21})));
    OpenIPSL.Electrical.Branches.PwLine line_9_6(G = 0, R = 0.039, X = 0.170, B = 0.179) annotation (
      Placement(visible = true, transformation(origin = {224, 105}, extent = {{-9, -6}, {9, 6}}, rotation = 90)));
    OpenIPSL.Electrical.Branches.PwLine line_5_7(G = 0, R = 0.032, X = 0.161, B = 0.153) annotation (
      Placement(visible = true, transformation(origin = {-72, 117}, extent = {{-9, -6}, {9, 6}}, rotation = 90)));
    OpenIPSL.Electrical.Branches.PwLine line_8_9(G = 0, R = 0.0119, X = 0.1008, B = 0.1045) annotation (
      Placement(visible = true, transformation(origin = {175, 302}, extent = {{-9, -6}, {9, 6}}, rotation = 180)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer1(r = 0, kT = 13.8 / 230, x = 0.0586, V_b = 13.8, Vn = 13.8) annotation (
      Placement(visible = true, transformation(origin={290,250},    extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer2(r = 0, kT = 18 / 230, x = 0.0625, Sn = 100, V_b = 18, Vn = 18) annotation (
      Placement(visible = true, transformation(origin={-146,256},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2(V_0 = Voltages.V2, V_b = 18, angle_0 = Voltages.A2, displayPF = true) annotation (
      Placement(visible = true, transformation(extent={{-174,246},{-154,266}},      rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B8(V_0 = Voltages.V8, V_b = 230, angle_0 = Voltages.A8, displayPF = true) annotation (
      Placement(visible = true, transformation(origin = {76, 308}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3(V_0 = Voltages.V3, V_b = 13.8, angle_0 = Voltages.A3, displayPF = true) annotation (
      Placement(visible = true, transformation(extent={{298,240},{318,260}},      rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B6(V_0 = Voltages.V6, V_b = 230, angle_0 = Voltages.A6, displayPF = true) annotation (
      Placement(visible = true, transformation(origin = {224, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    OpenIPSL.Electrical.Buses.Bus B5(V_0 = Voltages.V5, V_b = 230, angle_0 = Voltages.A5, displayPF = true) annotation (
      Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 90, origin = {-72, 20})));
    OpenIPSL.Electrical.Buses.Bus B1(V_0 = Voltages.V1, V_b = 16.5, angle_0 = Voltages.A1, displayPF = true) annotation (
      Placement(visible = true, transformation(origin={84,-144},    extent = {{-12, -12}, {12, 12}}, rotation = -90)));
    Generation_Groups.Gen1 gen1(P_0 = Machines.P2_1, Q_0 = Machines.Q2_1, V_0 = Voltages.V2, V_b = 18, angle_0 = Voltages.A2, vf0 = 1.789323314329606, vref0 = 1.120103884682511, height_1 = 0, tstart_1 = 0, refdisturb_1 = false) annotation (
      Placement(visible = true, transformation(extent={{-204,246},{-184,266}},      rotation = 0)));
    Generation_Groups.Gen2 gen2(P_0 = Machines.P3_1, Q_0 = Machines.Q3_1, V_0 = Voltages.V3, V_b = 13.8, angle_0 = Voltages.A3, vf0 = 1.402994304406186, vref0 = 1.097573933623472, height_2 = 0, tstart_2 = 0, refdisturb_2 = false) annotation (
      Placement(visible = true, transformation(extent={{348,240},{328,260}},      rotation = 0)));
    Generation_Groups.Gen3 gen3(P_0 = Machines.P1_1, Q_0 = Machines.Q1_1, V_0 = Voltages.V1, V_b = 16.5, angle_0 = Voltages.A1, vf0 = 1.082148046273888, vref0 = 1.095242742681042, height_3 = 0, tstart_3 = 0, refdisturb_3 = false) annotation (
      Placement(visible = true, transformation(origin={84,-162},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation (
      Placement(visible = true, transformation(extent = {{-180, -140}, {-80, -100}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(B = 0.0745, G = 0, R = 0.0085, X = 0.072, t1 = 10000, t2 = 10000) annotation (
      Placement(visible = true, transformation(extent = {{-14, 302}, {4, 314}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor1 annotation (
      Placement(visible = true, transformation(origin = {-39.4, 215.833}, extent = {{6.2, -5.16667}, {-6.2, 5.16667}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor2 annotation (
      Placement(visible = true, transformation(origin = {186.2, 208.833}, extent = {{-7.4, -6.16667}, {7.4, 6.16667}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor3 annotation (
      Placement(visible = true, transformation(origin = {71.6, -21}, extent = {{-7.2, -6}, {7.2, 6}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {46, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {116, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor3(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {-18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    HVDCcomponents.DC_cable dC_cable1(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {80, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {108, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor4(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {38, 124}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    HVDCcomponents.DC_cable dC_cable2(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {36, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Sources.Step Q2Q3(height = 0, startTime = 1) annotation (
      Placement(visible = true, transformation(origin = {58, 204}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step Q1(height = 0, startTime = 1) annotation (
      Placement(visible = true, transformation(origin = {48, 40}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
    Data.PF_results.Voltages Voltages annotation (
      Placement(visible = true, transformation(origin = {-165, 53}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Data.PF_results.Loads Loads annotation (
      Placement(visible = true, transformation(origin = {-166, 12}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Data.PF_results.Machines Machines annotation (
      Placement(visible = true, transformation(origin = {-165, -33}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    OpenIPSL.Electrical.Loads.PSAT.LOADPQ loadB5(P_0 = Loads.PL5_1, Q_0 = Loads.QL5_1, V_0 = Voltages.V5, V_b = 230, angle_0 = Voltages.A5, forcePQ = true) annotation (
      Placement(visible = true, transformation(origin = {-102, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Loads.PSAT.LOADPQ loadB6(P_0 = Loads.PL6_1, Q_0 = Loads.QL6_1, V_0 = Voltages.V6, V_b = 230, angle_0 = Voltages.A6, forcePQ = true) annotation (
      Placement(visible = true, transformation(origin = {266, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Loads.PSAT.LOADPQ loadB8(P_0 = Loads.PL8_1, Q_0 = Loads.QL8_1, V_0 = Voltages.V8, V_b = 230, angle_0 = Voltages.A8, forcePQ = true) annotation (
      Placement(visible = true, transformation(origin = {94, 262}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain k3(k=1)     annotation (
      Placement(transformation(extent = {{110, 22}, {98, 34}})));
    Modelica.Blocks.Math.Gain A3(k=1e6)
      annotation (Placement(transformation(extent={{88,22},{76,34}})));
    Modelica.Blocks.Math.Gain k1(k=0)
      annotation (Placement(transformation(extent={{-4,226},{8,238}})));
    Modelica.Blocks.Math.Gain A1(k=1e6) annotation (
      Placement(transformation(extent = {{20, 226}, {32, 238}})));
    Modelica.Blocks.Math.Gain k2(k=0)
      annotation (Placement(transformation(extent={{80,224},{92,236}})));
    Modelica.Blocks.Math.Gain A2(k=1e6) annotation (
      Placement(transformation(extent = {{104, 224}, {116, 236}})));
    LPV.Bus B9(V_b = 230, V_0 = Voltages.V9, angle_0 = Voltages.A9) annotation (
      Placement(transformation(extent={{222,240},{242,260}})));
    LPV.Bus B4(V_b = 230, V_0 = Voltages.V4, angle_0 = Voltages.A4) annotation (
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={84,-72})));
    LPV.Bus B7(V_b = 230, V_0 = Voltages.V7, angle_0 = Voltages.A7) annotation (
      Placement(transformation(extent = {{-90, 246}, {-70, 266}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu(generateMultiSine_Q(M = 0)) annotation (
      Placement(transformation(extent = {{176, 82}, {162, 98}})));
    ExcitationGeneration.Ground_phasor ground_phasor annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {146, 106})));
    Modelica.Blocks.Sources.Constant const annotation (
      Placement(transformation(extent = {{180, 102}, {174, 108}})));
    Modelica.Blocks.Interfaces.RealOutput y1 annotation (
      Placement(transformation(extent={{102,46},{122,66}})));
    Modelica.Blocks.Interfaces.RealOutput y2 annotation (
      Placement(transformation(extent={{38,244},{58,264}})));
    Modelica.Blocks.Interfaces.RealOutput y3 annotation (
      Placement(transformation(extent={{156,232},{176,252}})));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis1(Ib = 1E4 / 23, Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vb = 230E3, Vgd = Voltages.V7 * 230E3, teta_bus = Voltages.A7 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {-2, 168}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis2(Ib = 1E4 / 23, Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vb = 230E3, Vgd = Voltages.V9 * 230E3, teta_bus = Voltages.A9 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {158, 156}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis3(Ib = 1E4 / 23, Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vb = 230E3, Vgd = Voltages.V4 * 230E3, teta_bus = Voltages.A4 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {24, 0}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor annotation (Placement(transformation(
          extent={{-6,-5},{6,5}},
          rotation=-90,
          origin={224,205})));
    HVDCcomponents.PQ_sensor pQ_sensor4 annotation (Placement(transformation(
          extent={{-6,-5},{6,5}},
          rotation=180,
          origin={2,-61})));
    HVDCcomponents.PQ_sensor pQ_sensor5 annotation (Placement(transformation(
          extent={{6.99999,-6.00008},{-6.99999,6.00008}},
          rotation=180,
          origin={-31,308})));
    HVDCcomponents.PQ_sensor pQ_sensor6 annotation (Placement(transformation(
          extent={{6.99999,-6.00008},{-6.99999,6.00008}},
          rotation=180,
          origin={-111,256})));
    HVDCcomponents.PQ_sensor pQ_sensor7 annotation (
      Placement(visible = true, transformation(origin={262.6,249.833},    extent = {{6.2, -5.16667}, {-6.2, 5.16667}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor8 annotation (
      Placement(visible = true, transformation(origin={84.6,-94.167},     extent = {{6.2, -5.16667}, {-6.2, 5.16667}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput y4 annotation (
      Placement(transformation(extent={{116,-104},{136,-84}})));
    Modelica.Blocks.Interfaces.RealOutput y5 annotation (
      Placement(transformation(extent={{-98,214},{-78,234}})));
    Modelica.Blocks.Interfaces.RealOutput y6 annotation (
      Placement(transformation(extent={{260,264},{280,284}})));
    Modelica.Blocks.Interfaces.RealOutput y7 annotation (
      Placement(transformation(extent={{0,-92},{20,-72}})));
    Modelica.Blocks.Interfaces.RealOutput y8 annotation (
      Placement(transformation(extent={{-18,280},{2,300}})));
    Modelica.Blocks.Interfaces.RealOutput y9 annotation (
      Placement(transformation(extent={{240,182},{260,202}})));
    Modelica.Blocks.Interfaces.RealOutput y10
                                             annotation (
      Placement(transformation(extent={{146,-84},{166,-64}})));
    Modelica.Blocks.Interfaces.RealOutput y11
                                             annotation (
      Placement(transformation(extent={{-84,294},{-64,314}})));
    Modelica.Blocks.Interfaces.RealOutput y12
                                             annotation (
      Placement(transformation(extent={{260,294},{280,314}})));
  equation
    connect(A3.y, vSC_station_dq0_with_control_PLL_bis3.Pref) annotation (Line(
          points={{75.4,28},{8,28},{8,8},{12.5,8},{12.5,8.5}}, color={0,0,127}));
    connect(Q1.y, vSC_station_dq0_with_control_PLL_bis3.Qref) annotation (
      Line(points={{41.4,40},{4,40},{4,4},{12.5,4},{12.5,3.9}},    color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis3.p, pQ_sensor3.p) annotation (
      Line(points={{35,-0.2},{46,-0.2},{46,-22},{64.4,-22},{64.4,-21}},  color = {0, 0, 255}));
    connect(capacitor3.n, vSC_station_dq0_with_control_PLL_bis3.pin_n) annotation (
      Line(points={{-18,20},{-8,20},{-8,-6},{13.2,-6},{13.2,-6.4}},      color = {0, 0, 255}));
    connect(capacitor3.p, vSC_station_dq0_with_control_PLL_bis3.pin_p) annotation (
      Line(points={{-18,40},{-2,40},{-2,-2},{13,-2},{13,-2.2}},          color = {0, 0, 255}));
    connect(A2.y, vSC_station_dq0_with_control_PLL_bis2.Pref) annotation (
      Line(points={{116.6,230},{126,230},{126,180},{142,180},{142,164},{146.5,
            164},{146.5,164.5}},                                                                          color = {0, 0, 127}));
    connect(Q2Q3.y, vSC_station_dq0_with_control_PLL_bis2.Qref) annotation (
      Line(points={{64.6,204},{108,204},{108,176},{138,176},{138,160},{146.5,
            160},{146.5,159.9}},                                                                         color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis2.pin_n, capacitor2.n) annotation (
      Line(points={{147.2,149.6},{116,149.6},{116,150},{116,150}},    color = {0, 0, 255}));
    connect(capacitor2.p, vSC_station_dq0_with_control_PLL_bis2.pin_p) annotation (
      Line(points={{116,170},{132,170},{132,154},{147,154},{147,153.8}},          color = {0, 0, 255}));
    connect(pQ_sensor2.p, vSC_station_dq0_with_control_PLL_bis2.p) annotation (
      Line(points={{178.8,208.833},{172,208.833},{172,156},{169,156},{169,155.8}},color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_p, capacitor4.p) annotation (
      Line(points={{29,165.8},{34,165.8},{34,136},{48,136},{48,124},{48,124}},          color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_n, capacitor4.n) annotation (
      Line(points={{28.8,161.6},{28,161.6},{28,124},{28,124}},   color = {0, 0, 255}));
    connect(A1.y, vSC_station_dq0_with_control_PLL_bis1.Pref) annotation (
      Line(points={{32.6,232},{38,232},{38,190},{18,190},{18,176},{29.5,176},{
            29.5,176.5}},                                                                          color = {0, 0, 127}));
    connect(Q2Q3.y, vSC_station_dq0_with_control_PLL_bis1.Qref) annotation (
      Line(points={{64.6,204},{68,204},{68,178},{26,178},{26,172},{29.5,172},{
            29.5,171.9}},                                                                          color = {0, 0, 127}));
    connect(pQ_sensor1.p, vSC_station_dq0_with_control_PLL_bis1.p) annotation (
      Line(points={{-33.2,215.833},{-22,215.833},{-22,168},{7,168},{7,167.8}},    color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_n, capacitor1.n) annotation (
      Line(points={{28.8,161.6},{30,161.6},{30,150},{46,150},{46,150}},     color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_p, capacitor1.p) annotation (
      Line(points={{29,165.8},{28,165.8},{28,170},{46,170},{46,170}},        color = {0, 0, 255}));
    connect(loadB8.p, B8.p) annotation (
      Line(points = {{94, 272}, {96, 272}, {96, 308}, {76, 308}, {76, 308}}, color = {0, 0, 255}));
    connect(loadB6.p, B6.p) annotation (
      Line(points = {{266, -12}, {266, 0}, {224, 0}, {224, 14}}, color = {0, 0, 255}));
    connect(loadB5.p, B5.p) annotation (
      Line(points = {{-102, -10}, {-102, -10}, {-102, 6}, {-72, 6}, {-72, 20}, {-72, 20}}, color = {0, 0, 255}));
    connect(B8.p, pwLine2Openings.n) annotation (
      Line(points = {{76, 308}, {3.1, 308}}, color = {0, 0, 255}));
    connect(B8.p, line_8_9.n) annotation (
      Line(points = {{76, 308}, {83.75, 308}, {83.75, 308}, {91.5, 308}, {91.5, 302}, {128.25, 302}, {128.25, 302}, {166.9, 302}}, color = {0, 0, 255}));
    connect(dC_cable2.pin_n1, capacitor3.n) annotation (
      Line(points = {{32, 69.6}, {32, 60}, {-32, 60}, {-32, 20}, {-18, 20}}, color = {0, 0, 255}));
    connect(dC_cable2.pin_p1, capacitor3.p) annotation (
      Line(points = {{39.8, 69.6}, {39.8, 69.6}, {39.8, 50}, {-26, 50}, {-26, 40}, {-18, 40}, {-18, 40}}, color = {0, 0, 255}));
    connect(dC_cable2.pin_p, capacitor4.p) annotation (
      Line(points = {{40, 90.4}, {40, 90.4}, {40, 110}, {48, 110}, {48, 124}, {48, 124}}, color = {0, 0, 255}));
    connect(capacitor4.n, dC_cable2.pin_n) annotation (
      Line(points = {{28, 124}, {28, 124}, {28, 96}, {32, 96}, {32, 90.3}, {31.9, 90.3}}, color = {0, 0, 255}));
    connect(capacitor2.n, ground1.p) annotation (
      Line(points = {{116, 150}, {116, 150}, {116, 142}, {108, 142}, {108, 140}, {108, 140}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_n1, capacitor2.n) annotation (
      Line(points = {{90.4, 154}, {104, 154}, {104, 150}, {116, 150}, {116, 150}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_p1, capacitor2.p) annotation (
      Line(points = {{90.4, 161.8}, {100, 161.8}, {100, 170}, {116, 170}, {116, 170}}, color = {0, 0, 255}));
    connect(capacitor1.n, dC_cable1.pin_n) annotation (
      Line(points = {{46, 150}, {60, 150}, {60, 154}, {69.7, 154}, {69.7, 153.9}}, color = {0, 0, 255}));
    connect(capacitor1.p, dC_cable1.pin_p) annotation (
      Line(points = {{46, 170}, {58, 170}, {58, 162}, {69.6, 162}, {69.6, 162}}, color = {0, 0, 255}));
    connect(B6.p, line_9_6.p) annotation (
      Line(points = {{224, 14}, {224, 96.9}}, color = {0, 0, 255}));
    connect(line_5_7.p, B5.p) annotation (
      Line(points = {{-72, 108.9}, {-72, 20}}, color = {0, 0, 255}));
    connect(gen3.pwPin, B1.p) annotation (
      Line(points={{84,-151},{84,-144}},      color = {0, 0, 255}));
    connect(twoWindingTransformer.p, B1.p) annotation (
      Line(points={{84,-135},{84,-144}},     color = {0, 0, 255}));
    connect(gen2.pwPin, B3.p) annotation (
      Line(points={{327,250},{317.5,250},{312.75,252},{308,250}},                                                       color = {0, 0, 255}));
    connect(B2.p, gen1.pwPin) annotation (
      Line(points={{-164,256},{-183,256}},      color = {0, 0, 255}));
    connect(twoWindingTransformer1.p, B3.p) annotation (
      Line(points={{301,250},{308,250}},      color = {0, 0, 255}));
    connect(B2.p, twoWindingTransformer2.p) annotation (
      Line(points={{-164,256},{-154,256},{-155.5,258},{-157,256}},                                                   color = {0, 0, 255}));
    connect(B6.p, line_6_4.p) annotation (
      Line(points = {{224, 14}, {224, -18.9}}, color = {0, 0, 255}));
    connect(B5.p, line_4_5.p) annotation (
      Line(points = {{-72, 20}, {-72, -12.9}}, color = {0, 0, 255}));
    connect(k3.y, A3.u)
      annotation (Line(points={{97.4,28},{89.2,28}}, color={0,0,127}));
    connect(k1.y, A1.u)
      annotation (Line(points={{8.6,232},{18.8,232}}, color={0,0,127}));
    connect(k2.y, A2.u)
      annotation (Line(points={{92.6,230},{102.8,230}}, color={0,0,127}));
    connect(B9.p, line_8_9.p) annotation (
      Line(points={{232,250},{202,250},{202,302},{183.1,302}},          color = {0, 0, 255}));
    connect(pQ_sensor2.n, line_8_9.p) annotation (
      Line(points = {{193.6, 208.833}, {202, 208.833}, {202, 302}, {183.1, 302}}, color = {0, 0, 255}));
    connect(B4.p, line_6_4.n) annotation (
      Line(points={{84,-72},{84,-60},{224,-60},{224,-35.1}},          color = {0, 0, 255}));
    connect(pQ_sensor3.n, line_6_4.n) annotation (
      Line(points = {{78.8, -21}, {84, -21}, {84, -60}, {224, -60}, {224, -35.1}}, color = {0, 0, 255}));
    connect(k3.u, multisine_Noise_Simu.y1_u) annotation (
      Line(points = {{111.2, 28}, {138, 28}, {138, 86}, {162.7, 86}}, color = {0, 0, 127}));
    connect(multisine_Noise_Simu.pwPin, ground_phasor.p) annotation (
      Line(points = {{162.7, 92.4}, {151.88, 92.4}, {151.88, 106}}, color = {0, 0, 255}));
    connect(const.y, multisine_Noise_Simu.vr) annotation (
      Line(points = {{173.7, 105}, {166.48, 105}, {166.48, 98}}, color = {0, 0, 127}));
    connect(multisine_Noise_Simu.vi, multisine_Noise_Simu.vr) annotation (
      Line(points = {{164.52, 98}, {164.52, 104}, {166.48, 104}, {166.48, 98}}, color = {0, 0, 127}));
    connect(k2.u, multisine_Noise_Simu.y1_u) annotation (Line(points={{78.8,230},
            {70,230},{70,246},{198,246},{198,28},{138,28},{138,86},{162.7,86}},
          color={0,0,127}));
    connect(k1.u, multisine_Noise_Simu.y1_u) annotation (Line(points={{-5.2,232},
            {-10,232},{-10,276},{70,276},{70,246},{198,246},{198,28},{138,28},{
            138,86},{162.7,86}}, color={0,0,127}));
    connect(y1, y1) annotation (
      Line(points={{112,56},{112,56}},      color = {0, 0, 127}));
    connect(line_9_6.n, pQ_sensor.n)
      annotation (Line(points={{224,113.1},{224,199}}, color={0,0,255}));
    connect(line_4_5.n, pQ_sensor4.n) annotation (Line(points={{-72,-29.1},{-72,
            -60},{-4,-61}}, color={0,0,255}));
    connect(pQ_sensor4.p, line_6_4.n) annotation (Line(points={{8,-61},{224,-60},
            {224,-35.1}}, color={0,0,255}));
    connect(B7.p, pQ_sensor5.p) annotation (Line(points={{-80,256},{-56,256},{
            -56,308},{-38,308}}, color={0,0,255}));
    connect(pQ_sensor5.n, pwLine2Openings.p)
      annotation (Line(points={{-24,308},{-13.1,308}}, color={0,0,255}));
    connect(line_5_7.n, pQ_sensor5.p) annotation (Line(points={{-72,125.1},{-72,
            256},{-56,256},{-56,308},{-38,308}}, color={0,0,255}));
    connect(pQ_sensor1.n, pQ_sensor5.p) annotation (Line(points={{-45.6,215.833},
            {-74,215.833},{-74,216},{-72,216},{-72,256},{-56,256},{-56,308},{
            -38,308}}, color={0,0,255}));
    connect(twoWindingTransformer2.n, pQ_sensor6.p)
      annotation (Line(points={{-135,256},{-118,256}}, color={0,0,255}));
    connect(pQ_sensor6.n, B7.p)
      annotation (Line(points={{-104,256},{-80,256}}, color={0,0,255}));
    connect(pQ_sensor7.n, B9.p) annotation (Line(points={{256.4,249.833},{231.2,
            249.833},{231.2,250},{232,250}}, color={0,0,255}));
    connect(twoWindingTransformer1.n, pQ_sensor7.p) annotation (Line(points={{
            279,250},{268,250},{268,249.833},{268.8,249.833}}, color={0,0,255}));
    connect(pQ_sensor.p, B9.p) annotation (Line(points={{224,211},{224,250},{
            232,250}}, color={0,0,255}));
    connect(twoWindingTransformer.n, pQ_sensor8.p) annotation (Line(points={{84,
            -113},{84,-106.684},{84.6,-106.684},{84.6,-100.367}}, color={0,0,
            255}));
    connect(pQ_sensor8.n, B4.p) annotation (Line(points={{84.6,-87.967},{84.6,
            -79.9835},{84,-79.9835},{84,-72}}, color={0,0,255}));
    connect(pQ_sensor8.p12, y4) annotation (Line(points={{88.7333,-87.967},{
            105.367,-87.967},{105.367,-94},{126,-94}}, color={0,0,127}));
    connect(y4, y4)
      annotation (Line(points={{126,-94},{126,-94}}, color={0,0,127}));
    connect(pQ_sensor6.p12, y5) annotation (Line(points={{-104,251.2},{-106,
            251.2},{-106,224},{-88,224}}, color={0,0,127}));
    connect(pQ_sensor7.p12, y6) annotation (Line(points={{256.4,253.966},{256.4,
            274},{270,274}}, color={0,0,127}));
    connect(pQ_sensor4.p12, y7) annotation (Line(points={{-4,-65},{-6,-65},{-6,
            -82},{10,-82}}, color={0,0,127}));
    connect(pQ_sensor5.p12, y8) annotation (Line(points={{-24,303.2},{-20,303.2},
            {-20,290},{-8,290}}, color={0,0,127}));
    connect(pQ_sensor.p12, y9) annotation (Line(points={{228,199},{228,192},{
            250,192}}, color={0,0,127}));
    connect(y1, k3.y) annotation (Line(points={{112,56},{97.4,56},{97.4,28}},
          color={0,0,127}));
    connect(y2, A1.u) annotation (Line(points={{48,254},{12,254},{12,232},{18.8,
            232}}, color={0,0,127}));
    connect(y3, A2.u) annotation (Line(points={{166,242},{98,242},{98,230},{
            102.8,230}}, color={0,0,127}));
    connect(y10, B4.Angle) annotation (Line(points={{156,-74},{89,-74},{89,
            -81.4}}, color={0,0,127}));
    connect(B7.Angle, y11) annotation (Line(points={{-70.6,261},{-70.6,264},{
            -74,264},{-74,304}}, color={0,0,127}));
    connect(B9.Angle, y12) annotation (Line(points={{241.4,255},{241.4,304},{
            270,304}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-220,-180},
              {360,340}},                                                                        initialScale = 0.1)),
      Icon(coordinateSystem(extent={{-220,-180},{360,340}},      preserveAspectRatio = false)),
      Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
      experiment(StopTime=40, Interval=0.005),
      __Dymola_experimentSetupOutput,
      __OpenModelica_commandLineOptions = "");
  end NetworkSimu;

  model NetworkSysId
    import Modelica.Constants.pi;
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(kT = 16.5 / 230, x = 0.0576, r = 0, V_b = 16.5, Vn = 16.5) annotation (
      Placement(visible = true, transformation(origin = {84, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    OpenIPSL.Electrical.Branches.PwLine line_6_4(R = 0.017, X = 0.092, G = 0, B = 0.079) annotation (
      Placement(visible = true, transformation(origin = {224, -27}, extent = {{-9, -6}, {9, 6}}, rotation = 270)));
    OpenIPSL.Electrical.Branches.PwLine line_4_5(G = 0, R = 0.01, X = 0.085, B = 0.088) annotation (
      Placement(transformation(extent = {{-9, -6}, {9, 6}}, rotation = 270, origin = {-72, -21})));
    OpenIPSL.Electrical.Branches.PwLine line_9_6(G = 0, R = 0.039, X = 0.170, B = 0.179) annotation (
      Placement(visible = true, transformation(origin = {224, 105}, extent = {{-9, -6}, {9, 6}}, rotation = 90)));
    OpenIPSL.Electrical.Branches.PwLine line_5_7(G = 0, R = 0.032, X = 0.161, B = 0.153) annotation (
      Placement(visible = true, transformation(origin = {-72, 117}, extent = {{-9, -6}, {9, 6}}, rotation = 90)));
    OpenIPSL.Electrical.Branches.PwLine line_8_9(G = 0, R = 0.0119, X = 0.1008, B = 0.1045) annotation (
      Placement(visible = true, transformation(origin = {175, 302}, extent = {{-9, -6}, {9, 6}}, rotation = 180)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer1(r = 0, kT = 13.8 / 230, x = 0.0586, V_b = 13.8, Vn = 13.8) annotation (
      Placement(visible = true, transformation(origin = {240, 250}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer2(r = 0, kT = 18 / 230, x = 0.0625, Sn = 100, V_b = 18, Vn = 18) annotation (
      Placement(visible = true, transformation(origin = {-102, 256}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2(V_0 = Voltages.V2, V_b = 18, angle_0 = Voltages.A2, displayPF = true) annotation (
      Placement(visible = true, transformation(extent = {{-130, 246}, {-110, 266}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B8(V_0 = Voltages.V8, V_b = 230, angle_0 = Voltages.A8, displayPF = true) annotation (
      Placement(visible = true, transformation(origin = {76, 308}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3(V_0 = Voltages.V3, V_b = 13.8, angle_0 = Voltages.A3, displayPF = true) annotation (
      Placement(visible = true, transformation(extent = {{248, 240}, {268, 260}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B6(V_0 = Voltages.V6, V_b = 230, angle_0 = Voltages.A6, displayPF = true) annotation (
      Placement(visible = true, transformation(origin = {224, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    OpenIPSL.Electrical.Buses.Bus B5(V_0 = Voltages.V5, V_b = 230, angle_0 = Voltages.A5, displayPF = true) annotation (
      Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 90, origin = {-72, 20})));
    OpenIPSL.Electrical.Buses.Bus B1(V_0 = Voltages.V1, V_b = 16.5, angle_0 = Voltages.A1, displayPF = true) annotation (
      Placement(visible = true, transformation(origin = {84, -108}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
    Generation_Groups.Gen1 gen1(P_0 = Machines.P2_1, Q_0 = Machines.Q2_1, V_0 = Voltages.V2, V_b = 18, angle_0 = Voltages.A2, vf0 = 1.789323314329606, vref0 = 1.120103884682511, height_1 = 0, tstart_1 = 0, refdisturb_1 = false) annotation (
      Placement(visible = true, transformation(extent = {{-160, 246}, {-140, 266}}, rotation = 0)));
    Generation_Groups.Gen2 gen2(P_0 = Machines.P3_1, Q_0 = Machines.Q3_1, V_0 = Voltages.V3, V_b = 13.8, angle_0 = Voltages.A3, vf0 = 1.402994304406186, vref0 = 1.097573933623472, height_2 = 0, tstart_2 = 0, refdisturb_2 = false) annotation (
      Placement(visible = true, transformation(extent = {{298, 240}, {278, 260}}, rotation = 0)));
    Generation_Groups.Gen3 gen3(P_0 = Machines.P1_1, Q_0 = Machines.Q1_1, V_0 = Voltages.V1, V_b = 16.5, angle_0 = Voltages.A1, vf0 = 1.082148046273888, vref0 = 1.095242742681042, height_3 = 0, tstart_3 = 0, refdisturb_3 = false) annotation (
      Placement(visible = true, transformation(origin = {84, -126}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation (
      Placement(visible = true, transformation(extent = {{-180, -140}, {-80, -100}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(B = 0.0745, G = 0, R = 0.0085, X = 0.072) annotation (
      Placement(visible = true, transformation(extent = {{-14, 302}, {4, 314}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor1 annotation (
      Placement(visible = true, transformation(origin = {-39.4, 215.833}, extent = {{6.2, -5.16667}, {-6.2, 5.16667}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor2 annotation (
      Placement(visible = true, transformation(origin = {186.2, 208.833}, extent = {{-7.4, -6.16667}, {7.4, 6.16667}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor3 annotation (
      Placement(visible = true, transformation(origin = {71.6, -21}, extent = {{-7.2, -6}, {7.2, 6}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {46, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {116, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor3(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {-18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    HVDCcomponents.DC_cable dC_cable1(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {80, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {108, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor4(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {38, 124}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    HVDCcomponents.DC_cable dC_cable2(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {36, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Sources.Step Q2Q3(height = 0, startTime = 1) annotation (
      Placement(visible = true, transformation(origin = {58, 204}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step Q1(height = 0, startTime = 1) annotation (
      Placement(visible = true, transformation(origin = {48, 40}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
    Data.PF_results.Voltages Voltages annotation (
      Placement(visible = true, transformation(origin = {-165, 53}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Data.PF_results.Loads Loads annotation (
      Placement(visible = true, transformation(origin = {-166, 12}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Data.PF_results.Machines Machines annotation (
      Placement(visible = true, transformation(origin = {-165, -33}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    OpenIPSL.Electrical.Loads.PSAT.LOADPQ loadB5(P_0 = Loads.PL5_1, Q_0 = Loads.QL5_1, V_0 = Voltages.V5, V_b = 230, angle_0 = Voltages.A5, forcePQ = true) annotation (
      Placement(visible = true, transformation(origin = {-102, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Loads.PSAT.LOADPQ loadB6(P_0 = Loads.PL6_1, Q_0 = Loads.QL6_1, V_0 = Voltages.V6, V_b = 230, angle_0 = Voltages.A6, forcePQ = true) annotation (
      Placement(visible = true, transformation(origin = {266, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Loads.PSAT.LOADPQ loadB8(P_0 = Loads.PL8_1, Q_0 = Loads.QL8_1, V_0 = Voltages.V8, V_b = 230, angle_0 = Voltages.A8, forcePQ = true) annotation (
      Placement(visible = true, transformation(origin = {94, 262}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain A3(k=1e6)   annotation (
      Placement(transformation(extent = {{110, 22}, {98, 34}})));
    Modelica.Blocks.Math.Gain k3(k = 1) annotation (
      Placement(transformation(extent = {{88, 22}, {76, 34}})));
    Modelica.Blocks.Math.Gain A1(k=1e6)   annotation (
      Placement(transformation(extent = {{-4, 226}, {8, 238}})));
    Modelica.Blocks.Math.Gain k1(k = 1) annotation (
      Placement(transformation(extent = {{20, 226}, {32, 238}})));
    Modelica.Blocks.Math.Gain A2(k=1e6)   annotation (
      Placement(transformation(extent = {{80, 224}, {92, 236}})));
    Modelica.Blocks.Math.Gain k2(k = 1) annotation (
      Placement(transformation(extent = {{104, 224}, {116, 236}})));
    LPV.Bus B9(V_b = 230, V_0 = Voltages.V9, angle_0 = Voltages.A9) annotation (
      Placement(transformation(extent = {{208, 240}, {228, 260}})));
    LPV.Bus B4(V_b = 230, V_0 = Voltages.V4, angle_0 = Voltages.A4) annotation (
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {84, -70})));
    LPV.Bus B7(V_b = 230, V_0 = Voltages.V7, angle_0 = Voltages.A7) annotation (
      Placement(transformation(extent = {{-90, 246}, {-70, 266}})));
    Modelica.Blocks.Math.Add add13(k2 = -1) annotation (
      Placement(transformation(extent = {{360, 396}, {380, 416}})));
    Modelica.Blocks.Math.Add add21(k1 = -1) annotation (
      Placement(transformation(extent = {{360, 352}, {380, 372}})));
    Modelica.Blocks.Math.Add add32(k1 = -1) annotation (
      Placement(transformation(extent = {{360, 314}, {380, 334}})));
    Modelica.Blocks.Interfaces.RealOutput phi13 annotation (
      Placement(transformation(extent = {{406, 390}, {438, 422}})));
    Modelica.Blocks.Interfaces.RealOutput phi21 annotation (
      Placement(transformation(extent = {{406, 346}, {438, 378}})));
    Modelica.Blocks.Interfaces.RealOutput phi32 annotation (
      Placement(transformation(extent = {{406, 306}, {442, 342}})));
    Modelica.Blocks.Interfaces.RealInput u1 annotation (
      Placement(transformation(extent = {{-40, 218}, {-12, 246}})));
    Modelica.Blocks.Interfaces.RealInput u2 annotation (
      Placement(transformation(extent = {{46, 218}, {70, 242}})));
    Modelica.Blocks.Interfaces.RealInput u3 annotation (
      Placement(transformation(extent = {{146, 16}, {122, 40}})));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis1(Ib = 1E4 / 23, Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vb = 230E3, Vgd = Voltages.V7 * 230E3, teta_bus = Voltages.A7 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {-10, 170}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis2(Ib = 1E4 / 23, Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vb = 230E3, Vgd = Voltages.V9 * 230E3, teta_bus = Voltages.A9 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {156, 170}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis3(Ib = 1E4 / 23, Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vb = 230E3, Vgd = Voltages.V4 * 230E3, teta_bus = Voltages.A4 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {18, 0}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  equation
    connect(k3.y, vSC_station_dq0_with_control_PLL_bis3.Pref) annotation (
      Line(points={{75.4,28},{2,28},{2,8},{6.5,8},{6.5,8.5}},    color = {0, 0, 127}));
    connect(Q1.y, vSC_station_dq0_with_control_PLL_bis3.Qref) annotation (
      Line(points={{41.4,40},{0,40},{0,4},{6.5,4},{6.5,3.9}},    color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis3.p, pQ_sensor3.p) annotation (
      Line(points={{29,-0.2},{44,-0.2},{44,-20},{64.4,-20},{64.4,-21}},  color = {0, 0, 255}));
    connect(capacitor3.n, vSC_station_dq0_with_control_PLL_bis3.pin_n) annotation (
      Line(points={{-18,20},{-14,20},{-14,-6},{7.2,-6},{7.2,-6.4}},      color = {0, 0, 255}));
    connect(capacitor3.p, vSC_station_dq0_with_control_PLL_bis3.pin_p) annotation (
      Line(points={{-18,40},{-6,40},{-6,-2},{7,-2},{7,-2.2}},          color = {0, 0, 255}));
    connect(Q2Q3.y, vSC_station_dq0_with_control_PLL_bis2.Qref) annotation (
      Line(points={{64.6,204},{90,204},{90,180},{130,180},{130,174},{144.5,174},
            {144.5,173.9}},                                                                            color = {0, 0, 127}));
    connect(k2.y, vSC_station_dq0_with_control_PLL_bis2.Pref) annotation (
      Line(points={{116.6,230},{134,230},{134,178},{144.5,178},{144.5,178.5}},    color = {0, 0, 127}));
    connect(pQ_sensor2.p, vSC_station_dq0_with_control_PLL_bis2.p) annotation (
      Line(points={{178.8,208.833},{172,208.833},{172,170},{167,170},{167,169.8}},color = {0, 0, 255}));
    connect(capacitor2.n, vSC_station_dq0_with_control_PLL_bis2.pin_n) annotation (
      Line(points={{116,150},{128,150},{128,164},{145.2,164},{145.2,163.6}},      color = {0, 0, 255}));
    connect(capacitor2.p, vSC_station_dq0_with_control_PLL_bis2.pin_p) annotation (
      Line(points={{116,170},{126,170},{126,168},{145,168},{145,167.8}},          color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_p, capacitor4.p) annotation (
      Line(points={{21,167.8},{36,167.8},{36,138},{48,138},{48,124},{48,124}},         color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_n, capacitor4.n) annotation (
      Line(points={{20.8,163.6},{28,163.6},{28,124},{28,124}},   color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.Pref, k1.y) annotation (
      Line(points={{21.5,178.5},{16,178.5},{16,208},{38,208},{38,232},{32.6,232},
            {32.6,232}},                                                                          color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis1.Qref, Q2Q3.y) annotation (
      Line(points={{21.5,173.9},{22,173.9},{22,180},{64,180},{64,204},{64.6,204}},     color = {0, 0, 127}));
    connect(pQ_sensor1.p, vSC_station_dq0_with_control_PLL_bis1.p) annotation (
      Line(points={{-33.2,215.833},{-26,215.833},{-26,170},{-1,170},{-1,169.8}},  color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_n, capacitor1.n) annotation (
      Line(points={{20.8,163.6},{34,163.6},{34,150},{46,150},{46,150}},     color = {0, 0, 255}));
    connect(capacitor1.p, vSC_station_dq0_with_control_PLL_bis1.pin_p) annotation (
      Line(points={{46,170},{26,170},{26,168},{21,168},{21,167.8}},        color = {0, 0, 255}));
    connect(loadB8.p, B8.p) annotation (
      Line(points = {{94, 272}, {96, 272}, {96, 308}, {76, 308}, {76, 308}}, color = {0, 0, 255}));
    connect(loadB6.p, B6.p) annotation (
      Line(points = {{266, -12}, {266, 0}, {224, 0}, {224, 14}}, color = {0, 0, 255}));
    connect(loadB5.p, B5.p) annotation (
      Line(points = {{-102, -10}, {-102, -10}, {-102, 6}, {-72, 6}, {-72, 20}, {-72, 20}}, color = {0, 0, 255}));
    connect(B8.p, pwLine2Openings.n) annotation (
      Line(points = {{76, 308}, {3.1, 308}}, color = {0, 0, 255}));
    connect(B8.p, line_8_9.n) annotation (
      Line(points = {{76, 308}, {83.75, 308}, {83.75, 308}, {91.5, 308}, {91.5, 302}, {128.25, 302}, {128.25, 302}, {166.9, 302}}, color = {0, 0, 255}));
    connect(dC_cable2.pin_n1, capacitor3.n) annotation (
      Line(points = {{32, 69.6}, {32, 60}, {-32, 60}, {-32, 20}, {-18, 20}}, color = {0, 0, 255}));
    connect(dC_cable2.pin_p1, capacitor3.p) annotation (
      Line(points = {{39.8, 69.6}, {39.8, 69.6}, {39.8, 50}, {-26, 50}, {-26, 40}, {-18, 40}, {-18, 40}}, color = {0, 0, 255}));
    connect(dC_cable2.pin_p, capacitor4.p) annotation (
      Line(points = {{40, 90.4}, {40, 90.4}, {40, 110}, {48, 110}, {48, 124}, {48, 124}}, color = {0, 0, 255}));
    connect(capacitor4.n, dC_cable2.pin_n) annotation (
      Line(points = {{28, 124}, {28, 124}, {28, 96}, {32, 96}, {32, 90.3}, {31.9, 90.3}}, color = {0, 0, 255}));
    connect(capacitor2.n, ground1.p) annotation (
      Line(points = {{116, 150}, {116, 150}, {116, 142}, {108, 142}, {108, 140}, {108, 140}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_n1, capacitor2.n) annotation (
      Line(points = {{90.4, 154}, {104, 154}, {104, 150}, {116, 150}, {116, 150}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_p1, capacitor2.p) annotation (
      Line(points = {{90.4, 161.8}, {100, 161.8}, {100, 170}, {116, 170}, {116, 170}}, color = {0, 0, 255}));
    connect(capacitor1.n, dC_cable1.pin_n) annotation (
      Line(points = {{46, 150}, {60, 150}, {60, 154}, {69.7, 154}, {69.7, 153.9}}, color = {0, 0, 255}));
    connect(capacitor1.p, dC_cable1.pin_p) annotation (
      Line(points = {{46, 170}, {58, 170}, {58, 162}, {69.6, 162}, {69.6, 162}}, color = {0, 0, 255}));
    connect(B6.p, line_9_6.p) annotation (
      Line(points = {{224, 14}, {224, 96.9}}, color = {0, 0, 255}));
    connect(line_5_7.p, B5.p) annotation (
      Line(points = {{-72, 108.9}, {-72, 20}}, color = {0, 0, 255}));
    connect(gen3.pwPin, B1.p) annotation (
      Line(points = {{84, -115}, {84, -108}}, color = {0, 0, 255}));
    connect(twoWindingTransformer.p, B1.p) annotation (
      Line(points = {{84, -99}, {84, -108}}, color = {0, 0, 255}));
    connect(gen2.pwPin, B3.p) annotation (
      Line(points = {{277, 250}, {272.25, 250}, {272.25, 250}, {267.5, 250}, {262.75, 252}, {262.75, 252}, {258, 250}}, color = {0, 0, 255}));
    connect(B2.p, gen1.pwPin) annotation (
      Line(points = {{-120, 256}, {-139, 256}}, color = {0, 0, 255}));
    connect(twoWindingTransformer1.p, B3.p) annotation (
      Line(points = {{251, 250}, {258, 250}}, color = {0, 0, 255}));
    connect(B2.p, twoWindingTransformer2.p) annotation (
      Line(points = {{-120, 256}, {-115, 256}, {-115, 256}, {-110, 256}, {-111.5, 258}, {-111.5, 258}, {-113, 256}}, color = {0, 0, 255}));
    connect(B6.p, line_6_4.p) annotation (
      Line(points = {{224, 14}, {224, -18.9}}, color = {0, 0, 255}));
    connect(B5.p, line_4_5.p) annotation (
      Line(points = {{-72, 20}, {-72, -12.9}}, color = {0, 0, 255}));
    connect(A3.y, k3.u) annotation (
      Line(points = {{97.4, 28}, {89.2, 28}}, color = {0, 0, 127}));
    connect(A1.y, k1.u) annotation (
      Line(points = {{8.6, 232}, {18.8, 232}}, color = {0, 0, 127}));
    connect(A2.y, k2.u) annotation (
      Line(points = {{92.6, 230}, {102.8, 230}}, color = {0, 0, 127}));
    connect(B9.p, twoWindingTransformer1.n) annotation (
      Line(points = {{218, 250}, {229, 250}}, color = {0, 0, 255}));
    connect(line_9_6.n, twoWindingTransformer1.n) annotation (
      Line(points = {{224, 113.1}, {224, 250}, {229, 250}}, color = {0, 0, 255}));
    connect(B9.p, line_8_9.p) annotation (
      Line(points = {{218, 250}, {202, 250}, {202, 302}, {183.1, 302}}, color = {0, 0, 255}));
    connect(pQ_sensor2.n, line_8_9.p) annotation (
      Line(points = {{193.6, 208.833}, {202, 208.833}, {202, 302}, {183.1, 302}}, color = {0, 0, 255}));
    connect(twoWindingTransformer.n, B4.p) annotation (
      Line(points = {{84, -77}, {84, -70}}, color = {0, 0, 255}));
    connect(B4.p, line_6_4.n) annotation (
      Line(points = {{84, -70}, {84, -60}, {224, -60}, {224, -35.1}}, color = {0, 0, 255}));
    connect(line_4_5.n, line_6_4.n) annotation (
      Line(points = {{-72, -29.1}, {-72, -60}, {224, -60}, {224, -35.1}}, color = {0, 0, 255}));
    connect(twoWindingTransformer2.n, B7.p) annotation (
      Line(points = {{-91, 256}, {-80, 256}}, color = {0, 0, 255}));
    connect(B7.p, pwLine2Openings.p) annotation (
      Line(points = {{-80, 256}, {-62, 256}, {-62, 308}, {-13.1, 308}}, color = {0, 0, 255}));
    connect(line_5_7.n, pwLine2Openings.p) annotation (
      Line(points = {{-72, 125.1}, {-72, 256}, {-62, 256}, {-62, 308}, {-13.1, 308}}, color = {0, 0, 255}));
    connect(pQ_sensor1.n, pwLine2Openings.p) annotation (
      Line(points = {{-45.6, 215.833}, {-72, 215.833}, {-72, 256}, {-62, 256}, {-62, 308}, {-13.1, 308}}, color = {0, 0, 255}));
    connect(pQ_sensor3.n, line_6_4.n) annotation (
      Line(points = {{78.8, -21}, {84, -21}, {84, -60}, {224, -60}, {224, -35.1}}, color = {0, 0, 255}));
    connect(B4.Angle, add32.u2) annotation (
      Line(points = {{89, -79.4}, {89, -96}, {322, -96}, {322, 318}, {358, 318}}, color = {0, 0, 127}));
    connect(B9.Angle, add32.u1) annotation (
      Line(points = {{227.4, 255}, {238, 255}, {238, 330}, {358, 330}}, color = {0, 0, 127}));
    connect(add21.u2, add32.u1) annotation (
      Line(points = {{358, 356}, {238, 356}, {238, 330}, {358, 330}}, color = {0, 0, 127}));
    connect(B7.Angle, add21.u1) annotation (
      Line(points = {{-70.6, 261}, {-70.6, 262}, {-66, 262}, {-66, 368}, {358, 368}}, color = {0, 0, 127}));
    connect(add13.u1, add21.u1) annotation (
      Line(points = {{358, 412}, {-66, 412}, {-66, 368}, {358, 368}}, color = {0, 0, 127}));
    connect(add13.u2, add32.u2) annotation (
      Line(points = {{358, 400}, {324, 400}, {324, 318}, {358, 318}}, color = {0, 0, 127}));
    connect(add13.y, phi13) annotation (
      Line(points = {{381, 406}, {422, 406}}, color = {0, 0, 127}));
    connect(add21.y, phi21) annotation (
      Line(points = {{381, 362}, {422, 362}}, color = {0, 0, 127}));
    connect(add32.y, phi32) annotation (
      Line(points = {{381, 324}, {424, 324}}, color = {0, 0, 127}));
    connect(A1.u, u1) annotation (
      Line(points = {{-5.2, 232}, {-26, 232}}, color = {0, 0, 127}));
    connect(A2.u, u2) annotation (
      Line(points = {{78.8, 230}, {58, 230}}, color = {0, 0, 127}));
    connect(A3.u, u3) annotation (
      Line(points = {{111.2, 28}, {134, 28}}, color = {0, 0, 127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -140}, {440, 440}}, initialScale = 0.1)),
      Icon(coordinateSystem(extent = {{-200, -140}, {440, 440}}, preserveAspectRatio = false)),
      Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
      experiment(StopTime = 20, Interval = 0.02, Tolerance = 1e-06, __Dymola_fixedstepsize = 0.001, __Dymola_Algorithm = "Dassl"),
      __Dymola_experimentSetupOutput,
      __OpenModelica_commandLineOptions = "");
  end NetworkSysId;
  annotation (
    uses(Modelica(version = "3.2.3"), OpenIPSL(version = "1.5.0"), LPV(version = "1.5.0")));
end LinearIEEE_9_Buses_with_3T_MTDC;