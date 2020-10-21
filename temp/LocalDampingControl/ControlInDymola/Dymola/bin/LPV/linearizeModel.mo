within LPV;
function linearizeModel "Linearize a Modelica model"
input String problem = "" "Name of model, e.g. Modelica.Mechanics.Rotational.Components.Clutch";
input Real startTime = 0.0 "Start of simulation";
input Real stopTime = 1.0 "End of simulation";
input Integer numberOfIntervals = 0 "Number of output points";
input Real outputInterval = 0.0 "Distance between output points";
input String method = "Dassl" "Integration method";
input Real tolerance = 0.0001 "Tolerance of integration";
input Real fixedstepsize = 0.0 "Fixed step size for Euler";
input String resultFile = "dslin" "Where to store result";
output Boolean result "true if successful";
  external "builtin";
  annotation(__Dymola_interactive=true, Documentation(info="<html><p>The function translates a model (if not done previously) and then calculates
a linearized model at the initial values. The linearized model is by default stored in the
Dymola working directory in Matlab format as the file <code>dslin.mat</code>.</p>
<p>This built-in function corresponds to the command <b>Simulation &GT; Linearize</b>. For
more information about the content of the dslin.mat file and handling of linearization,
please see the section about that command, section &ldquo;Simulation &GT; Linearize&rdquo;
in Dymola User Manual. In particular note how to linearize around other values than the initial
ones (the corresponding parameters in the function cannot be used to change the time-point of
linearization).</p></html>"));
end linearizeModel;
