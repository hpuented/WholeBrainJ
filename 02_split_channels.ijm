// Code developed by Helena Puente Díaz
// Date: 27/08/2024
// Purpose: Automatic separation of the stitched auto and cells
// Output: Multiple .tiff files corresponsing to the channel planes 

inputDir = getDirectory("Directory with all the .tiff");
outputDir_C00 = getDirectory("Directory for _C00 files - AUTO");
outputDir_C01 = getDirectory("Directory for _C01 files - CELLS");

fileList = getFileList(inputDir);

for (i = 0; i < fileList.length; i++) {
    // If the filename ends with _C00, copy it to the _C00 folder
	if (endsWith(fileList[i], "_C00.tiff")) {
    	sourceFile = inputDir + fileList[i];
        targetFile = outputDir_C00 + fileList[i];
        File.copy(sourceFile, targetFile);
    }
    // If the filename ends with _C01, copy it to the _C01 folder
    else if (endsWith(fileList[i], "_C01.tiff")) {
        sourceFile = inputDir + fileList[i];
        targetFile = outputDir_C01 + fileList[i];
        File.copy(sourceFile, targetFile);
    }
}

print("Files copied successfully.");
