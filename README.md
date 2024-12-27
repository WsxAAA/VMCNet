# VMCNet

描述区域，暂空

......

## Installation

Install conda and run the following command

```bash
conda env create -f environment.yml
```

## Dataset Downloading

**ADNI**: https://adni.loni.usc.edu/data-samples/access-data/

The data should be saved in a `.csv` file format, and the content is shown in the example ADNI_example.csv.

## Data Pre-processing

Process all `.nii` files in the folder using FSL.

```bash
bash process.sh
```

## Training

```bash
conda activate mamba
python train.py
```

## Inference

```python
import torch
from VMCNet import vmcnet

model = vmcnet()
model.eval()

input = torch.randn(1, 1, 91, 109, 91)
pred = model(input)
```

