# 專案名稱

## 介绍

> 簡短介紹專案

> 注意！若無提供專案介紹，使用者可能不清楚這個專案是用來解決什麼問題或提供什麼功能，因此可能會感到困惑

這個專案基於 U<sup>2</sup>-Net 架構，旨在應用於從手機拍攝的圖像中提取稻穗圖像並去除背景。這個預處理方法可用於進一步分析，如估計穀物的含水量。由於 U<sup>2</sup>-Net 在背景去除的圖像分割任務方面表現出色，因此選擇了基於這個架構訓練去背模型。

## 功能

> 簡潔而清晰地描述的專案能夠做什麼。說明專案的主要功能，使用者能透過這個 AI 模型，功能部分可以列出您的專案或應用程式提供的主要功能和特點

> 注意！若無提供專案功能，使用者無法確定這個專案是否符合他們的需求，因為他們沒有足夠的資訊來評估項目的功能和優點

- 使用 U<sup>2</sup>-Net 模型進行稻穗圖像分割和背景去除


## 呈現效果

> 將輸入資料與輸出資料進行呈現，讓使用者更快速瞭解模型的功用

> 注意！若無提供呈現效果，使用者無法快速知道這個專案的用途，圖像呈現能夠最快速地讓使用者進入狀況

|                       原始圖片(稻穗去背前)                       |                          推論結果(稻穗去背後)                           |
| :--------------------------------------------------------------: | :---------------------------------------------------------------------: |
| <img src="./img/input/20230523101646.jpg" alt="raw" width="200"> | <img src="./img/output/20230523101646.png" alt="inference" width="200"> |
| <img src="./img/input/20230529081430.jpg" alt="raw" width="200"> | <img src="./img/output/20230529081430.png" alt="inference" width="200"> |

## 模型

> 根據專案的模型撰寫模型架構、訓練方式、模型評估、AI 可視化等
 U<sup>2</sup>-Net 模型
> Gradcam AI可視化

### 模型架構

模型採用了以下架構 :

- 層數: [層數]
- 節點數: [節點數]
- 激活函數: Relu,sigmoid

<img src="./img/U2Net_Architecture.png" alt="U2Net" width="500">

### 訓練方式

模型是使用以下方式進行訓練的 :

- 訓練數據: [訓練數據集描述]
- 損失函數: [損失函數]
- 優化器: [優化器]
- 訓練批次大小: [批次大小]
- 學習率: [學習率]

### 預訓練權重

模型使用了預訓練權重，來源於 [預訓練模型]()。你可以在 [連結到預訓練模型的來源]() 下載這些權重。

### 模型評估

模型經過評估，並在測試數據上達到以下性能 :

- 精度: [精度值]
- 召回率: [召回率值]
- F1 分數: [F1 分數]

### 模型可視化

使用 Grad-CAM 技術進行視覺化，以產生模型對稻穗區域的注意力熱圖，並進行解釋。

|   層    |                                 圖片                                  |
| :-----: | :-------------------------------------------------------------------: |
|  side6  |   <img src="./img/visualization/side6.png" alt="side6" width="200">   |
|  side5  |   <img src="./img/visualization/side5.png" alt="side5" width="200">   |
|  side4  |   <img src="./img/visualization/side4.png" alt="side4" width="200">   |
|  side3  |   <img src="./img/visualization/side3.png" alt="side3" width="200">   |
|  side2  |   <img src="./img/visualization/side2.png" alt="side2" width="200">   |
|  side1  |   <img src="./img/visualization/side1.png" alt="side1" width="200">   |
| outconv | <img src="./img/visualization/outconv.png" alt="outconv" width="200"> |

### 模型穩定性

> AI 模型對於輸入數據的變化或干擾的抵抗能力，可以對資料進行一些擾動來檢測模型的穩定性

對於內部資料集驗證（進行對抗樣本測試）
|                   對抗樣本(稻穗去背前)                        |                            推論結果(稻穗去背後)                       |
| :--------------------------------------------------------: | :----------------------------------------------------------------: |
| <img src="./img/valid/S__234020889.jpg" alt="raw" width="200"> | <img src="./img/valid/S__234020889_0.png" alt="inference" width="200"> |
| <img src="./img/valid/S__234020890.jpg" alt="raw" width="200"> | <img src="./img/valid/S__234020890_0.png" alt="inference" width="200"> |

對於外部資料集驗證
|                   外部資料集(稻穗去背前)                    |                          推論結果(稻穗去背後)                   |
| :----------------------------------------------------: | :----------------------------------------------------------: |
| <img src="./img/valid/IMG_0012.jpg" alt="raw" width="200"> | <img src="./img/valid/IMG_0012.png" alt="inference" width="200"> |
| <img src="./img/valid/IMG_0013.jpg" alt="raw" width="200"> | <img src="./img/valid/IMG_0013.png" alt="inference" width="200"> |
| <img src="./img/valid/IMG_0014.jpg" alt="raw" width="200"> | <img src="./img/valid/IMG_0014.png" alt="inference" width="200"> |




### 模型公平性

> 檢查訓練數據，確保它們不包含明顯的偏見或不平等，可以使用第三方函式庫檢驗模型的公平性

## 資料集

> 資料集描述，例如圖片數量、大小、格式；資料欄位、標籤、類型等

> 注意！若無提供資料集相關說明，會導致使用者在使用模型時不知道輸入資料的相關限制與規則

這個專案使用了一個名為 [資料集名稱] 的資料集，它包含了 [資料集描述]，[例如類別數量、圖片數量等]。

## 自訂資料集

> 告訴使用者，使用自訂資料集需注意的事項與規範

如果你希望使用自訂資料集，你需要準備一個符合特定格式的資料集。
[資料的格式要使用 jpg、資料標籤步驟、資料集大小、自訂資料集應該要怎麼存放]

## 安裝

> 說明 : 需要安裝哪些套件、環境、版本等
> 注意！若無提供安裝相關說明，使用者直接無法使用，無從得知環境需求

使用前請先安裝好 [Anaconda](https://www.anaconda.com/download)。

### Anaconda

啟動終端機依照以下說明輸入指令

建立新的 Python 虛擬環境，Python 版本 >= 3.8

```bash
# ENV_NAME 為自訂的環境名稱
conda create -n ENV_NAME python=3.9
```

啟動環境

```bash
# ENV_NAME 為自訂的環境名稱
conda activate ENV_NAME
```

安裝相關套件

```bash
# 安裝 pip
conda install pip
# 切換目錄到專案資料夾
cd 專案資料夾
# 安裝專案所需套件
pip install -r requirements.txt
```

## 使用

> 說明 : 講解一下怎麼使用，如何自己訓練模型、推論，要執行哪一個程式檔案，資料集放置處

> 注意！若無提供使用相關說明，使用者下載原始專案後會不知道該怎麼使用

### 訓練

訓練模型前請先確保資料集已經請放在 dataset 目錄下，並且按照[自訂資料集的規範](#自訂資料集)。

```bash
# 切換目錄到專案資料
cd 專案資料夾
# 執行訓練程式
python src/train.py
```

### 推論

推論會將執行結果輸出在 result 資料夾

```bash
# 切換目錄到專案資料
cd 專案資料夾
# 執行推論程式
python src/main.py
```

## 參考文獻

> 說明 : 提供此專案的相關技術參考資料

> 注意！若無提供參考文獻，使用者會錯失很多吸收相關知識的機會，可能缺少文獻在使用模型時會有誤解

如果你想深入研究模型架構或相關技術，可以參考以下參考文獻 :

- [Ｕ<sup>2</sup>-Net](https://github.com/xuebinqin/U-2-Net) GitHub 網址
- [Grad-CAM](https://github.com/jacobgil/pytorch-grad-cam) GitHub 網址
- 參考文獻 3

## 聯絡方式

> 說明 : 提供個人聯絡方式

> 注意！若無提供聯絡方式，使用者遇到問題沒有可以請教的對象

聯絡人 : 王 XX

Email : your_email@example.com

個人網站 : htts://myblog_or_website.com
