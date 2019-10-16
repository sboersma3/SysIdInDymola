All cases except for TestCase are having an equivalent folder and code structure. The following discription holds for all these cases.

How to run an experiment:

0) Make sure that an input data file has been generated with MATLAB
1) Navigate in windows to the directory of the case you want to simulate 
2) Open de .mo file in Dymola
3) Check if all packages that are in that folder are loaded in Dymola
4) Push the simulation button (right/below) in Dymola and open the .mos script
5) Set all user parameters as desired (see below)
6) Push the "run script" button

The script runs the simulation model in batches. 
In each batch, the model is linearized and the simulation is propagated forward in time starting from where it left off. 
Each batch is stored in the directory defined by the user variable "SimulationResults".
The simulation results can be studied with a .m script corresponding to the simulation case under study.

The following user defined variables can be set.

SimulationResults	directory where to store the Dymola simulation results
d1			batch number where the disturbance is activated if there is one in the model
d2      		batch number after which the disturbance is deactivated if there is one in the model
sigma_u			standard deviation noise input (if you want to excite with noise)  
sigma_y			standard deviation noise output (only this one for OE)      
sigma_load    	        standard deviation load (only this one for ARMAX)

If you want to make changes to the model, follow the following procedure:

Change NetworkSimu
Change NetworkSysId accordingly (note that here, no external inputs singals like a sinus or noise should be included)
Save all
If you make changes to Multisine_Noise_Simu.mo 
Open the .mo file in Notepad++ and copy the complete code
Navigate in Windows to the working_dir and open Multisine_Noise_SimuInit.mo in Notepad++
Select all and paste what you copied before

  
If you want to study the results that are generated with a modified model, you have to make sure that the .m file is also adapted.
This is necessary when you for example add or change the input/output channels. 


