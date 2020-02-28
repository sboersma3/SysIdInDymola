within ExcitationGeneration;
model Multisine_Noise_Simu
  GenerateMultiSine generateMultiSine_P(
    h=0.01,
    ll=0,
	M=0,
    L=0)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise_P(
    enableNoise=true,
    useGlobalSeed=true,
    useAutomaticLocalSeed=true,
    fixedLocalSeed=11)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Math.Sum sum_P(nin=2)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  VSC_inj vSC_inj
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise_Q(
    enableNoise=true,
    useGlobalSeed=true,
    useAutomaticLocalSeed=true,
    fixedLocalSeed=22)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  GenerateMultiSine generateMultiSine_Q(
    h=0.01,
    ll=300,
    M=30,
    L=2)
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Math.Sum sum_Q(nin=2)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y1_u
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Interfaces.RealInput vr annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={36,100})));
  Modelica.Blocks.Interfaces.RealInput vi annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={64,100})));
equation
  connect(normalNoise_P.y, sum_P.u[2]) annotation (Line(points={{-39,50},{-26,
          50},{-26,31},{-2,31}}, color={0,0,127}));
  connect(generateMultiSine_P.y, sum_P.u[1]) annotation (Line(points={{-40,10.6},
          {-26,10.6},{-26,29},{-2,29}}, color={0,0,127}));
  connect(sum_P.y, vSC_inj.Pref)
    annotation (Line(points={{21,30},{38,30}}, color={0,0,127}));
  connect(normalNoise_Q.y, sum_Q.u[2]) annotation (Line(points={{-39,-30},{-24,
          -30},{-24,-49},{-2,-49}}, color={0,0,127}));
  connect(generateMultiSine_Q.y, sum_Q.u[1]) annotation (Line(points={{-40,
          -69.4},{-24,-69.4},{-24,-51},{-2,-51}}, color={0,0,127}));
  connect(sum_Q.y, vSC_inj.Qref) annotation (Line(points={{21,-50},{30,-50},{30,
          30},{38,30}}, color={0,0,127}));
  connect(y1_u, vSC_inj.Qref) annotation (Line(points={{90,-50},{30,-50},{30,30},
          {38,30}}, color={0,0,127}));
  connect(vSC_inj.p, pwPin) annotation (Line(points={{61.2,34.8},{72.6,34.8},{
          72.6,30},{90,30}}, color={0,0,255}));
  connect(vSC_inj.vr, vr) annotation (Line(points={{45,42},{44,42},{44,60},{36,
          60},{36,100}}, color={0,0,127}));
  connect(vSC_inj.vi, vi) annotation (Line(points={{55,42},{55,60},{64,60},{64,
          100}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Multisine_Noise_Simu;
