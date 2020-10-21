within HVDCcomponents;
model Ground_phasor
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin p annotation (
    Placement(visible = true, transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Complex vs(re = p.vr, im = p.vi);
equation
  vs = Complex(re = 0, im = 0);
  annotation (
    Documentation(info = "<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>", revisions = "<html>
<ul>
<li><i> 1998   </i>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-60, 50}, {60, 50}}, color = {0, 0, 255}), Line(points = {{-40, 30}, {40, 30}}, color = {0, 0, 255}), Line(points = {{-20, 10}, {20, 10}}, color = {0, 0, 255}), Line(points = {{0, 90}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-144, -19}, {156, -59}}, textString = "%name", lineColor = {0, 0, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-60, 50}, {60, 50}}, thickness = 0.5, color = {0, 0, 255}), Line(points = {{-40, 30}, {40, 30}}, thickness = 0.5, color = {0, 0, 255}), Line(points = {{-20, 10}, {20, 10}}, thickness = 0.5, color = {0, 0, 255}), Line(points = {{0, 96}, {0, 50}}, thickness = 0.5, color = {0, 0, 255}), Text(extent = {{-24, -38}, {22, -6}}, textString = "p.v=0", lineColor = {0, 0, 255})}));
end Ground_phasor;
