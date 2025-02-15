# ブランチの作成
git checkout -b ブランチ名

# ブランチをきる（ブランチの移動）
git checkout ブランチ名

# 変更履歴を残す準備
git add ファイル名
git add .  (全ファイル保存)

# 変更履歴を保存（ローカル）
git commit -m "メッセージ"


# git push
git push origin ブランチ名

# 他の人がdevelopにマージしたものを自分のマージに取り込む手順
## 1.developにマージされたものをとってくるためにdevelopに移動
  git checkout develop
## 2.プルする (動作確認rails s)
  git pull origin develop
## 3.自分のブランチに戻る
  git checkout 自分のブランチ
## 4.自分のブランチにマージする（取り込む）
  git merge develop
　


# 変更点の確認
git diff

# コミット履歴
git log


#### 小見出し

おはよう
ちわっす..._φ(ﾟДﾟ )
おやすみ