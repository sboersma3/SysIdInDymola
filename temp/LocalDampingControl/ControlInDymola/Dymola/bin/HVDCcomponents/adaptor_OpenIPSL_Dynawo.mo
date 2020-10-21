within HVDCcomponents;
model adaptor_OpenIPSL_Dynawo
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin OpenIPSLTerminal annotation (
    Placement(visible = true, transformation(origin = {-110, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Connectors.ACPower DynawoTerminal annotation (
    Placement(visible = true, transformation(origin = {110, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
DynawoTerminal.V = Complex(re = OpenIPSLTerminal.vr, im = OpenIPSLTerminal.vi);
DynawoTerminal.i = Complex(re = OpenIPSLTerminal.ir, im = OpenIPSLTerminal.ii);
annotation (
    Icon(graphics={  Text(origin = {-81, 6}, rotation = -90, extent = {{-35, 30}, {35, -30}}, textString = "OpenIPSL"), Text(origin = {91, 10}, rotation = 90, extent = {{-35, 30}, {27, -22}}, textString = "Dynawo"), Rectangle(origin = {-1, 12}, extent = {{101, 34}, {-99, -48}})}));
end adaptor_OpenIPSL_Dynawo;
