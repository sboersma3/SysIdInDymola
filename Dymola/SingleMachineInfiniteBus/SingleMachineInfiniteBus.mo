within ;
package SingleMachineInfiniteBus
  package Generator
    model Generator
      extends OpenIPSL.Interfaces.Generator;
      OpenIPSL.Electrical.Machines.PSAT.Order6 order6(D = 5, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_0 = V_0, V_b = V_b, Vn = 400, angle_0 = angle_0, ra = 0.003, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation (
        Placement(visible = true, transformation(origin={47,-5},   extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII aVRtypeIII(K0 = 10, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.4) annotation (
        Placement(visible = true, transformation(origin={-46,10},   extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant pss_off(k=0)   annotation (
        Placement(visible = true, transformation(origin={-90,4},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(order6.pm0, order6.pm) annotation (
        Line(points={{35,-21.5},{35,-30},{18,-30},{18,-12},{29,-12},{29,-12.5}},                         color = {0, 0, 127}));
      connect(order6.v, aVRtypeIII.v) annotation (
        Line(points={{63.5,-0.5},{86,-0.5},{86,30},{-62,30},{-62,16},{-57,16}},                 color = {0, 0, 127}));
    connect(order6.vf0, aVRtypeIII.vf0) annotation (
        Line(points={{35,11.5},{35,28},{-46,28},{-46,21}},        color = {0, 0, 127}));
    connect(order6.p, pwPin) annotation (
        Line(points={{62,-5},{94,-5},{94,0},{110,0}},          color = {0, 0, 255}));
      connect(pss_off.y, aVRtypeIII.vs)
        annotation (Line(points={{-79,4},{-57,4}}, color={0,0,127}));
      connect(pwPin, pwPin)
        annotation (Line(points={{110,0},{110,0},{110,0}}, color={0,0,255}));
      connect(order6.vf, aVRtypeIII.vf) annotation (Line(points={{29,2.5},{-4,
              2.5},{-4,10},{-33,10}}, color={0,0,127}));
    end Generator;

  end Generator;

  model NetworkSimu
  SingleMachineInfiniteBus.Generator.Generator G1(
      P_0=1997.999,
      Q_0=967.92,
      V_0=1,
      V_b=400,
      angle_0=28.3385,
      displayPF=true,
      pss_off(k=0))   annotation (Placement(visible=true, transformation(
          origin={-30,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
      twoWindingTransformer(
      Sn=2220,
      V_b=400,
      Vn=400,
      kT=1,
      r=0.0,
      x=0.15) annotation (
      Placement(visible = true, transformation(origin={42,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(
      B=0.0,
      G=0.0,
      R=0.0,
      X=0.5*100/2220) annotation (
      Placement(visible = true, transformation(origin={204,20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
      P_0=-1998,
      Q_0=87.066,
      V_0=0.90081,
      V_b=400,
      angle_0=0.0) annotation (
      Placement(visible = true, transformation(origin={270,0},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3
      annotation (Placement(transformation(extent={{230,-10},{250,10}})));
    Modelica.Blocks.Interfaces.RealOutput y1_u
      annotation (Placement(transformation(extent={{130,-74},{148,-56}})));
    Modelica.Blocks.Interfaces.RealOutput y2_phi1
      annotation (Placement(transformation(extent={{10,20},{30,40}})));
    Modelica.Blocks.Interfaces.RealOutput y3_phi2
      annotation (Placement(transformation(extent={{120,18},{140,38}})));
    ExcitationGeneration.Bus B1
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    ExcitationGeneration.Bus B2
      annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{144,42},{156,54}})));
    Modelica.Blocks.Interfaces.RealOutput y4_dphi
      annotation (Placement(transformation(extent={{200,42},{218,60}})));
    LPV.PwLine pwLine2(
      R=0.0,
      X=0.93*100/2220,
      G=0.0,
      B=0.0)
      annotation (Placement(transformation(extent={{194,-30},{214,-10}})));
    Modelica.Blocks.Noise.NormalNoise normalNoise_y(
      enableNoise=true,
      useGlobalSeed=true,
      useAutomaticLocalSeed=true,
      fixedLocalSeed=99)
      annotation (Placement(transformation(extent={{144,64},{154,74}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{174,46},{184,56}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu
      annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu_load(
        generateMultiSine_Q(M=0))
      annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
    Modelica.Blocks.Interfaces.RealOutput n_load
      annotation (Placement(transformation(extent={{36,-46},{54,-28}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
      annotation (Placement(transformation(extent={{-34,54},{-14,74}})));
  equation
    connect(B3.p,pwLine1. n) annotation (Line(points={{240,0},{224,0},{224,20},
            {213,20}},
                  color={0,0,255}));
    connect(infiniteBus.p, B3.p)
      annotation (Line(points={{260,0},{240,0}},color={0,0,255}));
    connect(G1.pwPin, B1.p)
      annotation (Line(points={{-19,0},{-10,0}}, color={0,0,255}));
    connect(y2_phi1,y2_phi1)
      annotation (Line(points={{20,30},{20,30}}, color={0,0,127}));
    connect(B1.p, twoWindingTransformer.p)
      annotation (Line(points={{-10,0},{31,0}}, color={0,0,255}));
    connect(twoWindingTransformer.n, B2.p)
      annotation (Line(points={{53,0},{100,0}}, color={0,0,255}));
    connect(B2.p,pwLine1. p) annotation (Line(points={{100,0},{140,0},{140,20},
            {195,20}}, color={0,0,255}));
    connect(y3_phi2, B2.Angle)
      annotation (Line(points={{130,28},{110,28},{110,4.8}}, color={0,0,127}));
    connect(add.u2, B2.Angle) annotation (Line(points={{142.8,44.4},{110,44.4},
            {110,4.8}}, color={0,0,127}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(points={{195,-20},{140,-20},
            {140,20},{195,20}}, color={0,0,255}));
    connect(pwLine2.n, B3.p) annotation (Line(points={{213,-20},{224,-20},{224,
            0},{240,0}}, color={0,0,255}));
    connect(B1.Angle, y2_phi1)
      annotation (Line(points={{0,4.8},{0,30},{20,30}}, color={0,0,127}));
    connect(add.u1, y2_phi1) annotation (Line(points={{142.8,51.6},{0,51.6},{0,
            30},{20,30}}, color={0,0,127}));
    connect(add.y, add1.u2)
      annotation (Line(points={{156.6,48},{173,48}}, color={0,0,127}));
    connect(add1.y, y4_dphi)
      annotation (Line(points={{184.5,51},{209,51}}, color={0,0,127}));
    connect(normalNoise_y.y, add1.u1) annotation (Line(points={{154.5,69},{166,
            69},{166,54},{173,54}}, color={0,0,127}));
    connect(multisine_Noise_Simu.pwPin, B2.p) annotation (Line(points={{119,-47},
            {160,-47},{160,-74},{80,-74},{80,0},{100,0}}, color={0,0,255}));
    connect(multisine_Noise_Simu.y1_u, y1_u) annotation (Line(points={{119,-55},
            {124,-55},{124,-65},{139,-65}}, color={0,0,127}));
    connect(multisine_Noise_Simu.vi, B2.Vi) annotation (Line(points={{116.4,-40},
            {116.4,0.8},{110,0.8}}, color={0,0,127}));
    connect(multisine_Noise_Simu.vr, B2.Vr) annotation (Line(points={{113.6,-40},
            {113.6,-1.2},{110,-1.2}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.vi, B1.Vi) annotation (Line(points={{16.4,
            -20},{16,-20},{16,0.8},{0,0.8}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.vr, B1.Vr) annotation (Line(points={{13.6,
            -20},{13.6,-1.2},{0,-1.2}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.pwPin, B1.p) annotation (Line(points={{19,-27},
            {54,-27},{54,-50},{-10,-50},{-10,0}},      color={0,0,255}));
    connect(multisine_Noise_Simu_load.y1_u, n_load) annotation (Line(points={{
            19,-35},{30,-35},{30,-37},{45,-37}}, color={0,0,127}));
      annotation (
    experiment(StopTime=10, Interval=0.01),
    Documentation,
      Diagram(coordinateSystem(extent={{-40,-80},{280,80}})),
      Icon(coordinateSystem(extent={{-40,-80},{280,80}})));
  end NetworkSimu;

  model NetworkSysId
  SingleMachineInfiniteBus.Generator.Generator G1(
      P_0=1997.999,
      Q_0=967.92,
      V_0=1,
      V_b=400,
      angle_0=28.3385,
      displayPF=true,
      pss_off(k=0))   annotation (Placement(visible=true, transformation(
          origin={-30,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
      twoWindingTransformer(
      Sn=2220,
      V_b=400,
      Vn=400,
      kT=1,
      r=0.0,
      x=0.15) annotation (
      Placement(visible = true, transformation(origin={42,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(
      B=0.0,
      G=0.0,
      R=0.0,
      X=0.5*100/2220) annotation (
      Placement(visible = true, transformation(origin={204,20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
      P_0=-1998,
      Q_0=87.066,
      V_0=0.90081,
      V_b=400,
      angle_0=0.0) annotation (
      Placement(visible = true, transformation(origin={270,0},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3
      annotation (Placement(transformation(extent={{230,-10},{250,10}})));
    Modelica.Blocks.Interfaces.RealOutput y2_phi1
      annotation (Placement(transformation(extent={{10,20},{30,40}})));
    Modelica.Blocks.Interfaces.RealOutput y3_phi2
      annotation (Placement(transformation(extent={{120,18},{140,38}})));
    ExcitationGeneration.Bus B1
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    ExcitationGeneration.Bus B2
      annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{144,42},{156,54}})));
    Modelica.Blocks.Interfaces.RealOutput y4_dphi
      annotation (Placement(transformation(extent={{174,38},{194,58}})));
    LPV.PwLine pwLine2(
      R=0.0,
      X=0.93*100/2220,
      G=0.0,
      B=0.0)
      annotation (Placement(transformation(extent={{194,-30},{214,-10}})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId
      annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      annotation (Placement(transformation(extent={{76,-48},{92,-32}})));
    Modelica.Blocks.Interfaces.RealInput Q_ref
      annotation (Placement(transformation(extent={{76,-66},{92,-50}})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId1
      annotation (Placement(transformation(extent={{10,-44},{30,-24}})));
    Modelica.Blocks.Interfaces.RealInput e1
      annotation (Placement(transformation(extent={{-14,-38},{0,-24}})));
    Modelica.Blocks.Interfaces.RealInput e2
      annotation (Placement(transformation(extent={{-14,-50},{0,-36}})));
  equation
    connect(B3.p,pwLine1. n) annotation (Line(points={{240,0},{224,0},{224,20},
            {213,20}},
                  color={0,0,255}));
    connect(infiniteBus.p, B3.p)
      annotation (Line(points={{260,0},{240,0}},color={0,0,255}));
    connect(G1.pwPin, B1.p)
      annotation (Line(points={{-19,0},{-10,0}}, color={0,0,255}));
    connect(y2_phi1,y2_phi1)
      annotation (Line(points={{20,30},{20,30}}, color={0,0,127}));
    connect(y2_phi1, B1.Angle)
      annotation (Line(points={{20,30},{0,30},{0,4.8}}, color={0,0,127}));
    connect(B1.p, twoWindingTransformer.p)
      annotation (Line(points={{-10,0},{31,0}}, color={0,0,255}));
    connect(twoWindingTransformer.n, B2.p)
      annotation (Line(points={{53,0},{100,0}}, color={0,0,255}));
    connect(B2.p,pwLine1. p) annotation (Line(points={{100,0},{140,0},{140,20},
            {195,20}}, color={0,0,255}));
    connect(y3_phi2, B2.Angle)
      annotation (Line(points={{130,28},{110,28},{110,4.8}}, color={0,0,127}));
    connect(add.y,y4_dphi)
      annotation (Line(points={{156.6,48},{184,48}},   color={0,0,127}));
    connect(add.u1, B1.Angle) annotation (Line(points={{142.8,51.6},{0,51.6},{0,
            4.8}}, color={0,0,127}));
    connect(add.u2, B2.Angle) annotation (Line(points={{142.8,44.4},{110,44.4},
            {110,4.8}}, color={0,0,127}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(points={{195,-20},{140,-20},
            {140,20},{195,20}}, color={0,0,255}));
    connect(pwLine2.n, B3.p) annotation (Line(points={{213,-20},{224,-20},{224,
            0},{240,0}}, color={0,0,255}));
    connect(B2.Vr, multisine_Noise_SysId.vr) annotation (Line(points={{110,-1.2},
            {113.6,-1.2},{113.6,-40}}, color={0,0,127}));
    connect(multisine_Noise_SysId.vi, B2.Vi) annotation (Line(points={{116.4,
            -40},{116.4,0.8},{110,0.8}}, color={0,0,127}));
    connect(multisine_Noise_SysId.pwPin, B2.p) annotation (Line(points={{119,
            -47},{160,-47},{160,-74},{80,-74},{80,0},{100,0}}, color={0,0,255}));
    connect(Q_ref, multisine_Noise_SysId.Q_ref) annotation (Line(points={{84,
            -58},{94,-58},{94,-51},{100,-51}}, color={0,0,127}));
    connect(P_ref, multisine_Noise_SysId.P_ref) annotation (Line(points={{84,
            -40},{94,-40},{94,-47},{100,-47}}, color={0,0,127}));
    connect(B1.Vr, multisine_Noise_SysId1.vr) annotation (Line(points={{0,-1.2},
            {23.6,-1.2},{23.6,-24}}, color={0,0,127}));
    connect(B1.Vi, multisine_Noise_SysId1.vi) annotation (Line(points={{0,0.8},
            {26.4,0.8},{26.4,-24}}, color={0,0,127}));
    connect(multisine_Noise_SysId1.pwPin, B1.p) annotation (Line(points={{29,
            -31},{36,-31},{36,-64},{-10,-64},{-10,0}}, color={0,0,255}));
    connect(multisine_Noise_SysId1.P_ref, e1)
      annotation (Line(points={{10,-31},{-7,-31}}, color={0,0,127}));
    connect(e2, multisine_Noise_SysId1.Q_ref) annotation (Line(points={{-7,-43},
            {1.5,-43},{1.5,-35},{10,-35}}, color={0,0,127}));
      annotation (
    experiment(StopTime=10, Interval=0.01),
    Documentation,
      Diagram(coordinateSystem(extent={{-40,-80},{280,60}})),
      Icon(coordinateSystem(extent={{-40,-80},{280,60}})));
  end NetworkSysId;
  annotation (uses(OpenIPSL(version="1.5.0"), Modelica(version="3.2.3"),
      LPV(version="1.5.0")));
end SingleMachineInfiniteBus;
