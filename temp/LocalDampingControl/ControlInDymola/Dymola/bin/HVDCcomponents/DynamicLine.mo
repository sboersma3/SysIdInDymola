within HVDCcomponents;
model DynamicLine

/*
  Equivalent circuit:

   static line:
               I1                  I2
   (terminal1) -->-------R+jX-------<-- (terminal2)
                    |           |
                  G+jB         G+jB
                    |           |
                   ---         ---
  
  dynamic line:
                 I1                  I2
   (terminal1) -->---------R-L---------<-- (terminal2)
                    |  |         |  |
                    C  Rc        C  Rc
                    |  |         |  |
                   ------       ------
*/

  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin p annotation (
    Placement(transformation(extent = {{-100, -10}, {-80, 10}}), iconTransformation(extent = {{-100, -10}, {-80, 10}})));
  OpenIPSL.Interfaces.PwPin n annotation (
    Placement(transformation(extent = {{80, -10}, {100, 10}}), iconTransformation(extent = {{80, -10}, {100, 10}})));
  parameter Modelica.SIunits.PerUnit R "Resistance (pu)" annotation (
    Dialog(group = "Line parameters"));
  parameter Modelica.SIunits.PerUnit X "Reactance (pu)" annotation (
    Dialog(group = "Line parameters"));
  parameter Modelica.SIunits.PerUnit G "Shunt half conductance (pu)" annotation (
    Dialog(group = "Line parameters"));
  parameter Modelica.SIunits.PerUnit B "Shunt half susceptance (pu)" annotation (
    Dialog(group = "Line parameters"));
  parameter Real fn = SysData.fn "frequency (Hz)";
  parameter Real S_b = SysData.S_b "System base power (MVA)";
  parameter Boolean displayPF = false "Display power flow results:" annotation (
    Dialog(group = "Visualisation", __Dymola_compact = true, __Dymola_descriptionLabel = true),
    choices(checkBox = true));
  OpenIPSL.Types.ActivePowerMega P12;
  OpenIPSL.Types.ActivePowerMega P21;
  OpenIPSL.Types.ReactivePowerMega Q12;
  OpenIPSL.Types.ReactivePowerMega Q21;
  Complex vs(re = p.vr, im = p.vi);
  Complex is(re = p.ir, im = p.ii);
  Complex vr(re = n.vr, im = n.vi);
  Complex ir(re = n.ir, im = n.ii);
  constant Real pi = 2 * Modelica.Math.asin(1.0);
  parameter Real V10;
  parameter Real angle10;
  parameter Real V20;
  parameter Real angle20;
  Real w = 2 * pi * fn;
  parameter Real V1r0 = V10 * cos(angle10 * pi / 180);
  parameter Real V1i0 = V10 * sin(angle10 * pi / 180);
  parameter Real V2r0 = V20 * cos(angle20 * pi / 180);
  parameter Real V2i0 = V20 * sin(angle20 * pi / 180);
  parameter Real L = X;
  parameter Real Rc = 1 / G;
  parameter Real C = B;
  parameter Real ILr0 = (R * V1r0 - R * V2r0 + L * V1i0 - L * V2i0) / (L ^ 2 + R ^ 2);
  parameter Real ILi0 = R / L * ILr0 - V1r0 / L + V2r0 / L;
  parameter Real I1r0 = C * (1 / (Rc * C) * V1r0 - V1i0) + ILr0;
  parameter Real I1i0 = C * (V1r0 + 1 / (Rc * C) * V1i0) + ILi0;
  parameter Real I2r0 = ILr0 - C * (1 / (Rc * C) * V2r0 - V2i0);
  parameter Real I2i0 = ILi0 - C * (V2r0 + 1 / (Rc * C) * V2i0);
  //Dynamic line variables initialization
  Real ILr(start = ILr0);
  Real ILi(start = ILi0);
  Real I1r(start = I1r0);
  Real I1i(start = I1i0);
  Real I2r(start = I2r0);
  Real I2i(start = I2i0);
  Real V1r(start = V10 * cos(angle10 * pi / 180));
  Real V1i(start = V10 * sin(angle10 * pi / 180));
  Real V2r(start = V20 * cos(angle20 * pi / 180));
  Real V2i(start = V20 * sin(angle20 * pi / 180));
equation
//Calculations for the power flow display
  P12 = real(vs * conj(is)) * S_b;
  P21 = -real(vr * conj(ir)) * S_b;
  Q12 = imag(vs * conj(is)) * S_b;
  Q21 = -imag(vr * conj(ir)) * S_b;
//Dynamic line equations
  der(ILr) = (-R * w / L) * ILr + w * ILi + w / L * (V1r - V2r);
  der(ILi) = (-w * ILr) - R * w / L * ILi + w / L * (V1i - V2i);
  der(V1r) = (-w / (Rc * C)) * V1r + w * V1i + w / C * (I1r - ILr);
  der(V1i) = (-w * V1r) - w / (Rc * C) * V1i + w / C * (I1i - ILi);
  der(V2r) = (-w / (Rc * C)) * V2r + w * V2i + w / C * (ILr - I2r);
  der(V2i) = (-w * V2r) - w / (Rc * C) * V2i + w / C * (ILi - I2i);
//Correspondence between equations variables and pins (p and n) values
  I1r = p.ir;
  I1i = p.ii;
  -I2r = n.ir;
  -I2i = n.ii;
  V1r = p.vr;
  V1i = p.vi;
  V2r = n.vr;
  V2i = n.vi;
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                FillPattern.Solid, extent = {{-80, 40}, {80, -40}}), Rectangle(lineColor = {0, 0, 255}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-60, 20}, {60, -20}}), Text(visible = false, lineColor = {255, 0, 0}, extent = {{-200, 160}, {-20, 40}}, textString = "0.0 MW"), Polygon(visible = false, lineColor = {255, 0, 0}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-120, 70}, {-120, 50}, {-80, 60}, {-120, 70}}), Text(visible = false, lineColor = {255, 0, 0}, extent = {{20, 160}, {200, 40}}, textString = "0.0 MW"), Polygon(visible = false, lineColor = {255, 0, 0}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{80, 70}, {80, 50}, {120, 60}, {80, 70}}), Text(visible = false, lineColor = {0, 255, 0}, extent = {{-200, -40}, {-20, -160}}, textString = "0.0 Mvar"), Polygon(visible = false, lineColor = {0, 255, 0}, fillColor = {0, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-120, -70}, {-120, -50}, {-80, -60}, {-120, -70}}), Text(visible = false, lineColor = {0, 255, 0}, extent = {{20, -40}, {200, -160}}, textString = "0.0 Mvar"), Polygon(visible = false, lineColor = {0, 255, 0}, fillColor = {0, 255, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{80, -70}, {80, -50}, {120, -60}, {80, -70}}), Text(lineColor = {255, 255, 0}, extent = {{-60, 20}, {60, -20}}, textString = "%name")}),
    Documentation(info = "<html><head></head><body>Dynamic AC transmission line pi-model</body></html>"),
    Dialog(group = "Line parameters", enable = false));
end DynamicLine;
