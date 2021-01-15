# MccM
MODIS Convolutional Cloud Mask - A deep learning cloud mask for MOD09GA datasets
this is an alpha release - use with caution! 
repository is currently private, will go public alongside peer reivew paper submission

stats over numerious snow covered mountainous scenes
compared to MOD35 for this release:

| | cloud mask | recall | precision | F stat |
|---|---|---|--|---|
|clear sky pixels| MOD35 | 46% | 93% | 61% |
| |MccM | 88% | 89% | 89% |
|cloud pixels | MOD35 | 69% | 31% | 43% |
| | MccM | 54% | 53% | 54% |


training stats from this release:

 
| |snow predict | cloud  predict | neither predict |
|---|---|---|---|
|snow truth  | 98.8%  | 0.0%   |   0.01%|
|cloud truth  | 0.01%  | 97.2%   |  0.02%|
|neither truth |0.01%  |  0.01%  |  98.2%|
