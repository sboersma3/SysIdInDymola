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
  ExcitationGeneration.GenerateMultiSine
                    generateMultiSine_P(
    h=0.01,
    M=2,
    N=4,
    A=[1,1; 1,1; 0.5,0.5; 0.1,0.1],
    B=[0.5,0.5,0.5,0.5; 3,3,3,3])
    annotation (Placement(transformation(extent={{-20,-44},{0,-24}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{14,-24},{34,-4}})));
  Modelica.Blocks.Interfaces.RealOutput y3
    annotation (Placement(transformation(extent={{14,-48},{34,-28}})));
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
  connect(normalNoise.y, add.u1)
    annotation (Line(points={{-3.4,-8},{12,-8}}, color={0,0,127}));
  connect(generateMultiSine_P.y, add.u2) annotation (Line(points={{0,-33.4},{0,
          -26.7},{12,-26.7},{12,-20}}, color={0,0,127}));
  connect(add.y, feedback1.u2) annotation (Line(points={{35,-14},{50,-14},{50,
          14},{64,14}}, color={0,0,127}));
  connect(generateMultiSine_P.y1, y3) annotation (Line(points={{0,-35.6},{8,
          -35.6},{8,-38},{24,-38}}, color={0,0,127}));
  annotation (uses(Modelica(version="3.2.3"), Modelica_LinearSystems3(version=
            "2.3.5")), experiment(StopTime=5, Interval=0.01));
end TestCaseSimu;
