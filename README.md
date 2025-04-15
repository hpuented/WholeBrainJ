# 🧠 WholeBrainJ

**WholeBrainJ** is a set of ImageJ macros (`.ijm`) designed to preprocess 3D whole-brain mouse imaging data.  
These macros help you prepare raw image stacks acquired from light-sheet or confocal microscopy by correcting drift, separating channels, and optimizing images for analysis.

Built for **ImageJ** (or **Fiji**).

---

## 🔬 Pipeline Overview

This repository includes modular macros for the following processing steps:

1. **🪞 Drift Correction per Tile**  
   Raw imaging data often has slight drift during acquisition. The first macro aligns planes across Z for each tile in the image.

2. **🧪 Channel Separation**  
   Splits autofluorescence and cell labeling channels into separate stacks for downstream analysis.

3. **🛠 Preprocessing**  
   - Downsamples image size (height & width reduced by 2×)  
   - Subtracts background  
   - Enhances contrast  
   - Converts to 8-bit

---

## 📂 Files Overview

| File | Description |
|------|-------------|
| `01_drift_correction.ijm` | Corrects Z-plane drift for each tile in the raw 3D image. |
| `02_split_channels.ijm` | Separates autofluorescence and cell channels from multichannel data. |
| `03_preprocess.ijm` | Reduces image resolution, subtracts background, enhances contrast, and converts to 8-bit. |

---

## 🚀 Getting Started

### 🖥 Requirements

- [Fiji (recommended)](https://imagej.net/software/fiji/) or [ImageJ](https://imagej.nih.gov/ij/download.html)
- 3D mouse brain image stacks (multichannel `.tif`, `.nrrd`, or `.nii` formats)

---

### ▶️ How to Use

1. Open **Fiji** or **ImageJ**
2. Go to `Plugins > Macros > Run...`
3. Select one of the `.ijm` files
4. Follow the on-screen prompts to select files and set parameters
