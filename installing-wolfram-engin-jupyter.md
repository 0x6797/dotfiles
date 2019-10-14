# Wolfram Engine for Jupyter をインストールする

## 対応環境

Ubuntu

```bash
$ jupyter --version
jupyter core     : 4.5.0
jupyter-notebook : 5.7.8
qtconsole        : not installed
ipython          : 5.8.0
ipykernel        : 4.10.1
jupyter client   : 5.3.3
jupyter lab      : 0.33.12
nbconvert        : 5.6.0
ipywidgets       : not installed
nbformat         : 4.4.0
traitlets        : 4.3.3
```

## 事前準備

1. ブラウザを開く。
1. [https://www.wolfram.com/engine/]() にアクセスする。
1. `Download for:` から Linux をクリックする。
1. ライセンス登録ページが開くので、`Get your licence` をクリックする。
1. Wolfram ID の登録を行う。
1. 別途開いたページより、インストールスクリプトがダウンロードできるので、適当なディレクトリに保存する。
   - インストールスクリプトは `WolframEngine_12.0.0_LINUX.sh` のような名前である。

## 必要なパッケージのインストール

Wolfram Engine に必要なパッケージをインストールする。

```bash
$ sudo -E apt install fontconfig libgl1 libasound2 nodejs texlive-lang-japanese texlive-xetex
```

## Worlfram Engine のインストール

先程取得したインストールスクリプトを、管理者権限で実行する。

```bash
$ sudo -E ./WolframEngine_12.0.0_LINUX.sh
```

インストールディレクトリなどの入力が求められるが、デフォルトで構わないので、`Enter` を入力する。

先程登録した Wolfram ID の入力が求められるので、ID およびパスワードを入力する。

## Jupyter Lab のインストール

```bash
$ pip install --user jupyterlab
```

## Jupyter を設定する

```bash
$ jupyter lab --generater-config
```

設定ファイルは `~/.jupyter/jupyter_notebook_config.py` に作成される。

設定ファイルの以下の項目を編集する。

```python
c.NotebookApp.allow_remote_access = True
c.NotebookApp.port = 8890
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.token = ''
```

## Wolfram Language For Jupyter をインストールする

```bash
$ git clone https://github.com/WolframResearch/WolframLanguageForJupyter.git
$ cd WolframLanguageForJupyter
$ ./configure-jupyter.wls add
```

以下のスクリプトを実行し、Jupyter に Wolfram Language For Jupyter がインストールされていることを確認する。

```bash
$ jupyter kernelspec list
```

## Jupyter Lab を起動する

`--notebook-dir` オプションでホームディレクトリを設定し起動する。

```
$ jupyter lab --notebook-dir=~
```

## ブラウザからアクセスする

`http://<IPアドレス>:8890/` にアクセスし、Jupyter Lab のページが表示される。

`Plot3D[Sin[x y], {x, -Pi, Pi}, {y, -Pi,Pi}]` などを入力し、グラフが表示されれば成功。


以上。
