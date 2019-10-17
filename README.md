# SysIdInDymola

This repository contains Dymola scripts and MATLAB scripts that allows to do simulations (to collect data for system identification) and system identification itself, respectively. Additionally, the identified model is used to evaluate an optimal excitation signal that can be applied to Dymola.

Currently, there are four networks programmed:

1)	SingleMachineInfiniteBus (reactive power excitation)
2)	ThreeMachineNineBus (active power excitation)
3)	FiveMachineFourteenBus (reactive power excitation)
4)	Nordic44 (reactive power excitation)

In the following guideline, the SingleMachineInfiniteBus network is taken as example.

The following general steps can be followed:

1)	Run GenerateSignalForDymola_SingleMachineInfiniteBus.m.
2)	Run the Dymola script (script.mos) in the directory Dymola/SingleMachineInfiniteBus to apply and simulate the network in Dymola.
3)	Run SingleMachineInfiniteBus.m.

The above steps are now detailed.

1)
In the first step, an excitation signal is generated and stored in a .mat file. This excitation signal can be defined manually. If an optimal signal is available, it is also possible to manually define an excitation signal for the first batch and append this excitation signal with an optimal signal. In Dymola, two batches are then simulated with in the first batch the manually defined excitation and the second batch the optimal excitation.

The following settings in this script are important.

- ops.Optimal 	% generate optimal signal (true) or manually defined signal (false)
- ops.N         % number of batches (even number)
- ops.ll        % every ll second the model will be linearized (i.e., every batch takes ll seconds)
- ops.h         % sample period
- ops.K 		% after every K<=N batch, the excitation signal is changed
- ops.w        	% frequency grid of excitation signal
- Ai            % amplitudes initial batch

2)
In the second step, the .mos script imports the excitation signal that has been generated in the previous step and then executes the simulation with this excitation signal.
The .mos script can be excecuted by first opening the .mo file in Dymola (make sure the package is unfolded in Dymola's package browser). Hit then the "Simulation" button (right below) and open the .mos script.         

The following settings in the .mos script are important.

- d1           	// batch number where the disturbance is activated
- d2          	// batch number after which the disturbance is deactivated
- sigma_u    	// standard deviation noise input (add noise to excitation signal)
- sigma_y     	// standard deviation noise output (OE model structure)
- sigma_load   	// standard deviation noise load (ARMAX model structure)

3)
In the third step, the .m script imports the data that has been generated with Dymola (previous step) and tries to identify a model from this data. This identified model is then used to find an optimal excitation signal that can be applied to Dymola.

The following settings in this script are important.

- ops.mode  		% mode of the true system you plot ('min' if you want to plot the minimum)
- ops.modeid     	% mode of the estimated system you plot ('min' if you want to plot the minimum)
- ops.na       		% #of states of estimated model
- ops.nb         	% #of parameters in numerator G
- ops.nc         	% #of parameters in numerator H
- ops.nk         	% #of delays in G
- ops.h_new      	% new sampling period after resampling
- ops.w          	% frequency grid used in optimal excitation design=
- ops.c1         	% weighing factor for input (power or variance)
- ops.c2         	% weighing factor for output (power) 
 

One way to work is to generate a manually defined excitation signal for one batch, and then apply this to Dymola. Use the collected data to do system identification and consequently to find an optimal excitation signal. Then, go back the first step and generate an excitation signal of two batches, the first batch is equivalent as before, but the second batch is the optimal excitation signal. To do this, set ops.Optimal=1, ops.N=2, ops.K=1.     

Relevant literature:
- V. Perić, ``Non-intrusive methods for mode estimation in power systems using synchrophasors’’. PhD thesis, KTH Stockholm, 2016.
- V. Perić, X. Bombois and L. Vanfretti, ``Optimal signal selection for power system ambient mode estimation using a prediction error criterion’’, IEEE Transactions on Power Systems, Vol. 31(4), pp. 2621-2633, July 2016
- V. Perić, X. Bombois and L. Vanfretti, ``Optimal multisine probing signal design for power system electromechanical mode estimation’’, 50th Hawaai International Conference on System Sciences (HICSS), Hawaai, 2017
- X. Bombois, G. Scorletti, M. Gevers, P.M.J. Van den Hof, R. Hildebrand, ``Least costly identification experiment for control’’, Automatica, Volume 42, Issue 10, 2006, Pages 1651-1662, ISSN 0005-1098.
- L. Vanfretti, S. Bengtsson,  Vedran Perić, and Jan O. Gjerde, ``Effects of Forced Oscillations on Power System Damping Estimation’’,  International  Workshop on Applied Measurements  for Power Systems (AMPS), September 22-24, 2012, Aachen, Germany.
- http://www.pvandenhof.nl/disc-course-sysid-2018/


Everything is tested on the following software:

- Dymola 2020
- OpenIPSL Dymola package developed by Luigi Vanfretti and his team 
- MATLAB 2019b (needs robust control toolbox or cvx with solver (e.g. sdpt) and system identification toolbox)
- Windows 10



