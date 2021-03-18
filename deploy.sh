#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 删除目录防止构建失败
rm -rf docs/.vuepress/dist

# 生成静态文件
npm run docs:build

# 进入生成的文件夹
#cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME
git pull
git add .
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/vue-action
# git push -f https://github.com/<USERNAME>/vue-action.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
# git remote add origin https://github.com/cqwanghao/vue-action.git
# git branch -M master
git push -f https://github.com/cqwanghao/vue-action.git master:gh-pages

cd -