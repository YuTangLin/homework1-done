# Your Name <span style="color:red">(yout cs id)</span>
 103061532 林育堂 
# Project 1 / Image Filtering and Hybrid Images

## Overview
The project is related to 
> quote


## Implementation
1. One
	* item: dog
	* item: cat
2. Two
    * item: bird
	* item: plane
3. Three
    * item: bicycle
	* item: motorcycle
4. Four
    * item: marilyn
	* item: einstein
5. Five
    * item: fish
	* item: marline

```
Code highlights
1. my_imfilter  (code裡面也有注解)

Version_1
a. 因為要針對不同size的filter去處理，所以要知道filter的size
b. 按照老師投影片的示意圖，因為都是從filter的中心開始做，所以image的matrix會被擴增
c. Z軸不會被filter影響，所以擺在迴圈最外面
d. 按照老師投影片的示意圖，filter每移一格，會把所有的值加起來，所以用sum(A(:))
e. 最後再每一次得到的值一個一個塞回原size對應的位置裡

Version_2
由於 Version_1 實在太慢，我猜是迴圈、條件、sum(A(:))的影響
a.　把迴圈改寫，並把可以直接算出的值設為變數，就不用一直到迴圈裡才做運算
b.  先給sum的初始值為0，給它去記錄每次的總和

2.proj1 
a. 每一組的圖大小不同，要找配對
b. low_frequences 是經由large_blur處理而得
c. high_frequences 是經要先把圖片經由large_blur處理，再把原image - large_blur而得
d. hybrid_image 則直接把 low_frequences+high_frequences

經過低通的圖會對於邊緣、輪廓會比較明顯，而經過高通的圖則是細節的特徵會比較清楚
所以當圖愈縮愈小時，會剩下邊緣、輪廓的低通的圖像。
```

## Installation
* Other required packages.
* How to compile from source?

### Results

<table border=1>
<tr>
<td>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg"  width="24%"/>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg" width="24%"/>
</td>
</tr>

<tr>
<td>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg"  width="24%"/>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg" width="24%"/>
</td>
</tr>

</table>



