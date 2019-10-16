within ;
model TestCaseSimu
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.01, sigma=0.1)
    annotation (Placement(transformation(extent={{-16,-14},{-4,-2}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{54,12},{74,32}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-84,50},{-64,70}})));
  Modelica.Blocks.Continuous.StateSpace stateSpace(
    C=[0,1],
    D=zeros(1, 1),
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-18,12},{2,32}})));
  Modelica.Blocks.Sources.Pulse pulse(width=50, period=10)
    annotation (Placement(transformation(extent={{-82,12},{-62,32}})));
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{38,60},{58,80}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{70,60},{90,80}})));
  Modelica.Blocks.Interfaces.RealOutput y2
    annotation (Placement(transformation(extent={{88,12},{108,32}})));
equation
  connect(stateSpace.y[1], feedback1.u1)
    annotation (Line(points={{3,22},{56,22}}, color={0,0,127}));
  connect(pulse.y, stateSpace.u[1])
    annotation (Line(points={{-61,22},{-20,22}}, color={0,0,127}));
  connect(gain.y, y1)
    annotation (Line(points={{59,70},{80,70}}, color={0,0,127}));
  connect(gain.u, feedback1.u1) annotation (Line(points={{36,70},{34,70},{34,22},
          {56,22}}, color={0,0,127}));
  connect(feedback1.y, y2)
    annotation (Line(points={{73,22},{98,22}}, color={0,0,127}));
  connect(normalNoise.y, feedback1.u2)
    annotation (Line(points={{-3.4,-8},{64,-8},{64,14}}, color={0,0,127}));
  annotation (uses(Modelica(version="3.2.3"), Modelica_LinearSystems3(version=
            "2.3.5")), experiment(StopTime=5, Interval=0.01));
end TestCaseSimu;
