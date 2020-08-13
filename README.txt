Thank you for downloading our Interphase Gap Effect Calculator!
This README explains how to use the calculator. It will calculate the IPG Offset, as detailed in the publication "Interpreting the effect of stimulus parameters on the electrically-evoked compound action potential and on neural health" by Tim Brochier, Colette McKay, and Bob Carlyon. This measure is the horizontal offset (in dB) between the overlapping portions of ECAP amplitude growth functions for different stimulus parameters. Note: we call this the interphase gap calculator, but you might want to use other stimulus parameters, such as phase duration.

For Cochlear devices, measured with Custom Sound EP:
1. Export the measured ECAP AGFs from Custom Sound as .xlsx files. 
2. Set your MATLAB directory to include the folder "IPG Effect Calculator Public".
3. Run ipgEffectCalculator.m
4. Choose your IPG short file and your IPG long file that you exported from Custom Sound. You can do this by clicking "Browse for IPG Short Filename" and "Browse for IPG Long Filename" in the "Select Files" Panel of the GUI. It might take a few seconds for the files to load, as the program needs to extract the correct information.
5. Click "Initialize Limits" to set limits to all portions of the ECAP AGFs which overlap. If you want to adjust these limits to only include the most linear portions of the ECAP AGFs, use the upper limit and lower limit sliders. 
6. Click "Calculate IPG Effect" and it will display the ECAP AGF offset in dB. 

For Advanced Bionics, MedEl, or Oticon devices, measured with their electrophysiological software, you will need to generate your own .xlsx file. Other than that, the steps are exactly the same:
1. Create a .xlsx file where the first column is the input current (in microamps) and the second column is the resulting output ECAP N1P2 peak (in uV) for a particular amplitude growth function that you have measured. You must create these files for every AGF that you measure. Be sure that the units for the input are microamps and the units for the output are microvolts. 
2. Follow steps 2 - 6 from the above.
 
For support, please contact Tim Brochier at tb648@cam.ac.uk
If you use the software, please cite this article.
 
