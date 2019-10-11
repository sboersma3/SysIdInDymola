within ;
model TestCaseSysId
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-106,2},{-66,42}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{20,12},{40,32}})));
  Modelica.Blocks.Continuous.StateSpace stateSpace(
    C=[0,1],
    D=zeros(1, 1),
    x_start=zeros(2))
    annotation (Placement(transformation(extent={{-40,12},{-20,32}})));
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{16,48},{36,68}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{48,48},{68,68}})));
equation
  connect(stateSpace.y[1], y)
    annotation (Line(points={{-19,22},{30,22}}, color={0,0,127}));
  connect(stateSpace.u[1], u)
    annotation (Line(points={{-42,22},{-86,22}}, color={0,0,127}));
  connect(gain.u, y)
    annotation (Line(points={{14,58},{8,58},{8,22},{30,22}}, color={0,0,127}));
  connect(gain.y, y1)
    annotation (Line(points={{37,58},{58,58}}, color={0,0,127}));
  annotation (uses(Modelica(version="3.2.3"), Modelica_LinearSystems3(version=
            "2.3.5")), experiment(StopTime=5, Interval=0.01));
end TestCaseSysId;
