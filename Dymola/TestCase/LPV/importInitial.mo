within LPV;
function importInitial "Import start values from file"
input String dsName = "dsfinal.txt";
output Boolean ok;
  external "builtin";
  annotation(Documentation(info="<html><p>This function sets up integration or linearization to start from the initial
conditions given in the file specified (including start and stop-time and choice of integration
algorithm). The default is &ldquo;dsfinal.txt&rdquo;.</p>
<p>(Calling the function<code> importInitial </code>with the (unchanged) default file, followed
by calling the function <code>simulate</code> corresponds to the command <b>Simulation &GT;
Continue &GT; Continue</b>. The function <code>simulate</code> works like <code>simulateModel</code>,
but works with the default model.)</p>
<p>After calling<code> importInitial </code>it is possible to override specific parameters or
start-values before simulating by using the usual parameter setting in the variable browser.</p>
<p>Calling the function <code>importInitial</code> with a text file that differs from the unchanged
default file corresponds to the command <b>Simulation &GT; Continue &GT; Import Initial&hellip;</b>.</p>
<p>Please see the section &ldquo;Simulation &GT; Continue &GT; Import Initial&hellip;&rdquo; in
the User Manual for more additional important information.</p>
<p>Note: Basically <code>importInitial()</code> corresponds to copying dsfinal.txt (the default
variable output file containing variable values etc. at the end of the simulation) to dsin.txt (the
default variable input file for a simulation run). Please compare the command below.</p>
<h4><span style=\"color:#008000\">Example in Dymola</span></h4>
<pre>importInitial(&QUOT;C:/test/dsfinal.txt&QUOT;);</pre></html>"));
end importInitial;
