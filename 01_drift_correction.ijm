// Code developed by Helena Puente Díaz
// Date: 15/11/2024
// Purpose: Adjusting of the planes (same number = same plane) because of the drift in the mesospim laser
// Output: 18 .tiff files (9 .tiff files x 2 channels) corresponsing to the adjusted raw data

inputDirectory = getDirectory("Directory where the raw files are located");
outputDirectory = getDirectory("Directory to save the processed files");

fileList = getFileList(inputDirectory);

for (i = 0; i < fileList.length; i++) {
    filename = fileList[i];

    if (endsWith(filename, ".tiff")) { 										// Process only TIFF files
        startIndex = indexOf(filename, "Tile") + 4;							// Extract tile number from the filename
        endIndex = indexOf(filename, "_", startIndex);
        tileNumber = parseInt(substring(filename, startIndex, endIndex));

        file_path = inputDirectory + filename;
        run("TIFF Virtual Stack...", "open=file_path");
		
        totalPlanes = nSlices;												// Get the number of planes in the stack

        if (tileNumber >= 0 && tileNumber <= 2) {
            removePlanes(totalPlanes - 60 + 1, totalPlanes);
            // removePlanes(1, 50);											// Change here by nSlices shiftedx2
        } else if (tileNumber >= 3 && tileNumber <= 5) {
            removePlanes(1, 30);											// Change here by nSlices shifted
            totalPlanes = nSlices;											// Update total planes
            removePlanes(totalPlanes - 30 + 1, totalPlanes); 				// Change here by nSlices shifted
        } else if (tileNumber >= 6 && tileNumber <= 8) {
            removePlanes(1, 60);
            // removePlanes(totalPlanes - 50 + 1, totalPlanes);				// Change here by nSlices shiftedx2
        }
        
        //outputDirectory = inputDirectory + "processed/";
        //if (!File.exists(outputDirectory)) {
            //File.makeDirectory(outputDirectory);
        //}
        saveAs("Tiff", outputDirectory + filename);
        close();
    }
}

// Function to remove slices from a stack
function removePlanes(start, end) {
    for (j = end; j >= start; j--) {
        setSlice(j);
        run("Delete Slice");
    }
}
