within LPV;
function simulateExtendedModel
  "Simulate a model with modified parameters and start values"
input String problem = "" "Name of model, e.g. Modelica.Mechanics.Rotational.Components.Clutch";
input Real startTime = 0.0 "Start of simulation";
input Real stopTime = 1.0 "End of simulation";
input Integer numberOfIntervals = 0 "Number of output points";
input Real outputInterval = 0.0 "Distance between output points";
input String method = "Dassl" "Integration method";
input Real tolerance = 0.0001 "Tolerance of integration";
input Real fixedstepsize = 0.0 "Fixed step size for Euler";
input String resultFile = "dsres" "Where to store result";
output Boolean result "true if successful";
input String initialNames[:] = fill("", 0) "Parameters and start-values to set";
input Real initialValues[size(initialNames, 1)] = fill(0.0, 0) "Parameter values";
input String finalNames[:] = fill("", 0) "Variables at end-point";
output Real finalValues[size(finalNames, 1)] "Values at end-point";
input Boolean autoLoad = true "Auto load result";
  external "builtin";
  annotation(__Dymola_interactive=true, Documentation(info="<html><p>An extension of <code>simulateModel</code> (please see that routine, also for
comparison between a number of similar routines). This routine gives the possibility to set
parameters and startvalues before simulation and to get the final values at end-point of
simulation. <code>autoLoad=true</code> is default. If false the result file is not loaded in
the plot window (and variables are not replotted).</p>
<h4><span style=\"color:#008000\">Example in Dymola</span></h4>
<h5>Parameter studies of selected parameters</h5>
<p>Consider the demo model <code>Modelica.Mechanics.Rotational.CoupledClutches</code>. The
parameters J1.J and J2.J should be varied and the resulting <code>J1.w</code> and <code>J4.w</code>
should be measured and saved at the end of the simulation. That will be the result of the
following function call:</p>
<p>Please note that you for this example first have to open the model (using <b>File &GT;
Demos&hellip; &GT; Coupled Clutches</b>) since it is a read-only demo. Entering in the command
input line (followed by enter):</p>
<pre>simulateExtendedModel(&QUOT;Modelica.Mechanics.Rotational.Examples.CoupledClutches&QUOT;,initialNames={&QUOT;J1.J&QUOT;,&QUOT;J2.J&QUOT;},initialValues={2, 3},finalNames={&QUOT;J1.w&QUOT;,&QUOT;J4.w&QUOT;});</pre>
<p>The output visible in the command window will be:</p>
<pre>&nbsp;=&nbsp;true,&nbsp;{6.213412958654301,&nbsp;0.9999999999999936}</pre>
<p>It can be seen that the function was executed successfully (<code>= true</code>); then the
value of<code> J1.w</code> (6.213&hellip;) and <code>J4.w</code> (0.99999&hellip;) is presented.</p>
<p>By changing <code>J1.J</code> and <code>J2.J</code> and simulating the resulting <code>J1.w</code>
and <code>J4.w</code> can be studied.</p><p>Note that Integer and Boolean variables (coded as 0 and 1) are supported as well. However,
structural parameters that are evaluated cannot be part of initialNames, use modifiers as described
in simulateModel for them.</p><h4><span style=\"color: #008000\">Python example</span></h4>
<pre>ok, values = dymola.simulateExtendedModel(&quot;Modelica.Mechanics.Rotational.Examples.CoupledClutches&quot;, initialNames=[&quot;J1.J&quot;,&quot;J2.J&quot;], initialValues=[2, 3], finalNames=[&quot;J1.w&quot;,&quot;J4.w&quot;])</pre>
</html>"));
end simulateExtendedModel;
