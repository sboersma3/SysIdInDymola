within HVDCcomponents;

model SignalVoltage_phasor

  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Interfaces.PwPin n annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Interfaces.ComplexInput v "unit = V" annotation(
    Placement(visible = true, transformation(origin = {0, 78}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Complex zero(re = 0, im = 0);
  Complex vs(re = p.vr, im = p.vi);
  Complex is(re = p.ir, im = p.ii);
  Complex vr(re = n.vr, im = n.vi);
  Complex ir(re = n.ir, im = n.ii);
  Complex i;
//  Modelica.SIunits.Current i "Current flowing from pin p to pin n";
equation
  v = vs - vr;
  zero = is + ir;
  i = is;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -120}, {150, -80}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics = {Ellipse(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}),
    Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
     by Martin Otter<br> initially implemented<br>
     </li>
</ul>
</html>", info = "<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));


end SignalVoltage_phasor;
