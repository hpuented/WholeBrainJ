sourceDir = getDirectory("Input folder");
targetDir = getDirectory("Output folder");

list = getFileList(sourceDir);

for(i = 0; i < list.length; i++) {
	
	name = File.getName(sourceDir + list[i]);
	
	subdir = sourceDir + list[i] + "cells";
	open(subdir);
	
	getDimensions(width, height, channels, slices, frames);
	final_width = round(width/2);
	final_height = round(height/2);

	run("Size...", "width=final_width height=final_height depth=slices constrain average interpolation=Bilinear");

	run("Subtract Background...", "rolling=5 sliding stack");
	
	run("Enhance Contrast...", "saturated=0.5 process_all");

	setOption("ScaleConversions", true);
	run("8-bit");

	saveAs("tiff", targetDir + name + "_cells.tiff");

	close();
}