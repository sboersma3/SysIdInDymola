within LPV;
function simulateModel "Simulate a Modelica model"
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
  external "builtin";
  annotation(__Dymola_interactive=true, Documentation(info="<html><p>Simulate the model for the given time. <code>method</code> is a string with the
name of the integration algorithm; the names correspond to the ones found in the popup-menu
and the string is case insensitive. <code>fixedstepsize</code> is only used if the method
Euler is selected. Note that file extension is automatically added to <code>resultFile</code>
(normally <code>&QUOT;.mat&QUOT;</code>). For backwards compatibility the default for
<code>resultFile</code> is <code>&QUOT;dsres&QUOT;</code>.</p>
<p>The entire command corresponds to <b>Simulate</b> in the menus.</p>
<p>Values specified in the model will be used unless the corresponding modifier is given in
the <code>simulateModel</code> command.</p>
<p>Note: <code>translateModel</code>, <code>simulateModel</code>, <code>simulateExtendedModel</code>,
<code>simulateMultiExtendedModel</code>, and <code>simulateMultiResultsModel</code> have named
arguments (as is indicated above) and the default for problem is &QUOT;&QUOT; corresponding to the
most recently used model. Thus <code>simulateModel(stopTime=10,method=&QUOT;Euler&QUOT;);</code>
corresponds to <code>simulateModel(&QUOT;&QUOT;, 0, 10, 0, 0, &QUOT;Euler&QUOT;, 1e-4);</code></p>
<p>It is possible to specify a model name with modifiers for translateModel, simulateModel and simulateExtendedModel.</p>
<h4><span style=\"color:#008000\">Example in Dymola</span></h4>
<pre>for source in {&QUOT;Step&QUOT;,&QUOT;Constant&QUOT;,&QUOT;Ramp&QUOT;,&QUOT;Sine&QUOT;} loop 
  simulateModel(&QUOT;TestSource(redeclare Modelica.Blocks.Sources.&QUOT;+source+&QUOT; Source)&QUOT;);
end for;</pre>
<p>to simulate the model below with different sources.</p>
<p><code><font style=\"color: #0000ff; \">model</font>&nbsp;TestSource</code></p>
<p><code>&nbsp;&nbsp;<font style=\"color: #ff0000; \">Modelica.Blocks.Sources.Step</font>&nbsp;Source</code></p>
<p><code><font style=\"color: #0000ff; \">end&nbsp;</font>TestSource;</code></p>
<h4><span style=\"color: #008000\">Python example</span></h4>
<pre>for source in [&quot;Step&quot;,&quot;Constant&quot;,&quot;Ramp&quot;,&quot;Sine&quot;]:
   dymola.simulateModel(&quot;TestSource(redeclare Modelica.Blocks.Sources.&quot;+source+&quot; Source)&quot;)
</pre></html>"));
end simulateModel;
