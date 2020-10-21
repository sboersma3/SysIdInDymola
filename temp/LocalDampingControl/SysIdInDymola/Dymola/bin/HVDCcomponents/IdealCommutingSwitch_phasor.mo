within HVDCcomponents;

model IdealCommutingSwitch_phasor "Ideal commuting switch"
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  OpenIPSL.Interfaces.PwPin n2 annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  OpenIPSL.Interfaces.PwPin n1 annotation(
    Placement(transformation(extent = {{90, 30}, {110, 50}}), iconTransformation(extent = {{90, 30}, {110, 50}})));
  Modelica.Blocks.Interfaces.BooleanInput control "true => p--n1 connected, false => p--n2 connected" annotation(
    Placement(transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 120})));
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  Complex zero(re = 0, im = 0);
  Complex one(re = 1, im = 1);
  Complex vs(re = p.vr, im = p.vi);
  Complex is(re = p.ir, im = p.ii);
  Complex vr1(re = n1.vr, im = n1.vi);
  Complex ir1(re = n1.ir, im = n1.ii);
  Complex vr2(re = n2.vr, im = n2.vi);
  Complex ir2(re = n2.ir, im = n2.ii);
equation
0 = p.ir + n2.ir + n1.ir;
0 = p.ii + n2.ii + n1.ii;
if control then
  p.vr = n1.vr;
  p.vi = n1.vi;
  p.ir = -n1.ir;
  p.ii = -n1.ii;
else
  p.vr = n2.vr;
  p.vi = n2.vi;
  p.ir = -n2.ir;
  p.ii = -n2.ii;
 end if
  
  annotation(
    defaultComponentName = "switch",
    Documentation(info = "<html>
<p>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the input signal control. If control is true, the pin p is connected
with the negative pin n2. Otherwise, the pin p is connected to the negative pin n1.
</p>
<p>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br><br>
<strong>Please note:</strong>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <strong>not</strong> modelled. The parameters are not temperature dependent.
</p>
</html>", revisions = "<html>
<ul>
<li><em> March 11, 2009   </em>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><em> 1998   </em>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-44, 4}, {-36, -4}}, lineColor = {0, 0, 255}), Line(points = {{-90, 0}, {-44, 0}}, color = {0, 0, 255}), Line(points = {{-37, 2}, {40, 40}}, color = {0, 0, 255}), Line(points = {{40, 40}, {90, 40}}, color = {0, 0, 255}), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -100}, {0, 25}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Text(extent = {{-150, 90}, {150, 50}}, textString = "%name", lineColor = {0, 0, 255})}));
end IdealCommutingSwitch_phasor;
