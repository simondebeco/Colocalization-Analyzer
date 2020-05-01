# Colocalization-Analyzer
READ ME

1.	System requirement
-	The standalone executable only runs on macOS (tested on Sierra and above except Catalina)
-	The Matlab code runs on Linux, PC and mac computers and requires MATLAB R2018a or more recent (through the App Designer Matlab interface)


2.	Installation Guide
-	Standalone executable: 
•	
•	Typical install time should be around …

-	Matlab App interface: 

•	browse for folder until you locate the Colocalization_analyzer.mlapp file in your current folder. The segment_local_threshold file should also be located in the same folder
•	right click on the Colocalization_analyzer.mlapp file and press Run           
•	Typical launch time should be between a few seconds and one minute on a "normal" desktop computer


3.	Demo
-	In section Image 1, Import Image 1: GFP, choose Automatic Segmentation: Midgrey, Press Segment, move the slider Remove Noise to 3
-	In section Image 1, Import Image 1: Cy3, choose Automatic Segmentation: Midgrey, Press Segment, move the slider Remove Noise to 6
-	In section Image 1, Import Image 1: Cy5, choose Automatic Segmentation: Midgrey, Press Segment, move the slider Remove Noise to 3
-	In section Analyze, choose Mask 1 = Image 1, Mask 2 = Image 2, Signal 1 = Image 1, Signal 2 = Image 2. Press Analyze. The results should be:
	Pearson : 0.69, Spearman = 0.64, M1 = 0.58, M2 = 0.54
-	In section Analyze, choose Mask 1 = Image 2, Mask 2 = Image 3, Signal 1 = Image 2, Signal 2 = Image 3. Press Analyze. The results should be:
	Pearson : 0.32, Spearman = 0.40, M1 = 0.31, M2 = 0.47
-	The run time for each operation should be a few seconds on a “normal” computer

4.	Instructions for use on your data
-	Launch the Colocalization Analyzer interface 
-	In the Image 1 section, click on the import image import Image 1 button. Supported formats are TIFF files.
-	The image can be cropped : click on the Crop button, a window should pop up. Draw a rectangle of the desired size. It can be cancelled if the size is not good.
-	Segmentation is required: choose an automatic segmentation method (Midgrey or Phansalkar) and press segment. You can then remove noisy pixels by moving the Remove Noise slider. You can change the segmentation method at any moment. If no automatic segmentation method is satisfying, it is also possible to draw the Regions Of Interest (ROI) to segment manually: press Freehand and then draw one region on the image window. You can add other ROI by pressing the + button , or removing some with the – button. Careful Segmentation is crucial as the analysis will depend on it.
-	Proceed similarly with at least one other image that you want to compare to image 1: click on tab Image 2 and follow the same steps (cropping is automatically done on the same region as for Image 1). You can compare up to 4 images, 2 are required.
-	Once you have segmented all the images to be compared, click on the Analyze Tab. 
-	Choose the Regions of Interest in which intensity levels will be compared. If you click on Mask 1:Image 1 and Mask 2:Image 2, the signals in all pixels from the ROI obtained from segmentation of image 1 and Image 2 will be compared. You can also select more complex options: for instance, for Mask 1 you can select ROI from 2 images (by pressing Ctrl + click or cmd + click): the resulting ROI is the intersection of both ROI (pixels belonging to the ROI of Image 1 AND Image 2).
-	Choose the signals to compare. In principle, if you have chosen Mask 1:Image 1 and Mask 2:Image 2, you should choose Signal 1:Image 1 and Signal 1:Image 2, but different options can also be informative.
-	Press the Analyze button. A cytofluorogram, colocalization map as well as Pearson, Spearman and Manders coefficients will be displayed. Press the Save button to export them.
