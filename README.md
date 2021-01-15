# MccM
MODIS Convolutional Cloud Mask - A deep learning cloud mask for MOD09GA datasets
this is an alpha release - use with caution! 

stats over numerious snow covered mountainous scenes
compared to MOD35 for this release:

.                    recall | precision | F stat
clear sky   MOD35     46%       93%         61%
pixel       MccM      88%       89%         89%

cloud       MOD35     69%       31%         43%
pixels      MccM      54%       53%         54%


training stats from this release:

.                    prediciton
.                snow  | cloud  | neither        
.        snow    98.8%   0.0%      0.01%
truth   cloud   0.01%   97.2%     0.02%
        neither 0.01%    0.01%    98.2%
