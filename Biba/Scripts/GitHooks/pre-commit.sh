#!/bin/sh

#  pre-commit.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/21.
#  

# pass information which files to be excluded to git-format-stages as --exclude option in .swiftformat config file is not honored by git-format-staged
# pass information which files to be excluded to git-format-stages as --exclude option in .swiftformat config file is not honored by git-format-staged
# git-format-staged --formatter "swiftformat stdin --stdinpath '{}'" "*.swift"

export PATH="$PATH:/opt/homebrew/bin"

git diff --diff-filter=d --staged --name-only | grep -e '\(.*\).swift$' | while read line; do
    swift-format -m format -i "${line}";
    git add "$line";
done
