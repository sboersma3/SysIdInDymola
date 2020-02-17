within HVDCcomponents;

model PQ_sensor
outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  parameter Real S_b=SysData.S_b "System base power (MVA)"
    annotation (Dialog(group="Line parameters"));
    //annotation (Dialog(group="Line parameters", enable=false));
  OpenIPSL.Types.ActivePowerMega P12;
  OpenIPSL.Types.ActivePowerMega P21;
  OpenIPSL.Types.ReactivePowerMega Q12;
  OpenIPSL.Types.ReactivePowerMega Q21;
  Complex zero_i(re = 0, im = 0);
  Complex zero_v(re = 0, im = 0);
  Complex vs(re=p.vr, im=p.vi);
  Complex is(re=p.ir, im=p.ii);
  Complex vr(re=n.vr, im=n.vi);
  Complex ir(re=n.ir, im=n.ii);

OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
OpenIPSL.Interfaces.PwPin n annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//Calculations for the power flow display
  P12 = real(vs * conj(is)) * S_b;
  P21 = -real(vr*conj(ir))*S_b;
  Q12 = imag(vs * conj(is)) * S_b;
  Q21 = -imag(vr*conj(ir))*S_b;
  zero_i = is + ir;
  zero_v = vs - vr;

  annotation(
    Icon(coordinateSystem(extent = {{-36, -30}, {36, 30}}), graphics = {Rectangle(lineColor = {0, 0, 255}, extent = {{-36, 30}, {36, -30}}), Text(origin = {16, -14}, extent = {{-36, 20}, {2, -14}}, textString = "PQ"), Polygon(origin = {0, 16}, fillColor = {136, 136, 136}, fillPattern = FillPattern.Solid, points = {{-10, 10}, {-10, -10}, {14, 0}, {-10, 10}})}),
    Diagram(coordinateSystem(extent = {{-36, -30}, {36, 30}})),
    __OpenModelica_commandLineOptions = "");


end PQ_sensor;
