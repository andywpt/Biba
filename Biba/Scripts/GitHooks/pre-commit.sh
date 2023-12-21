#!/bin/sh

#  pre-commit.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/21.
#  

#!/bin/bash
# pass information which files to be excluded to git-format-stages as --exclude option in .swiftformat config file is not honored by git-format-staged
npx git-format-staged --formatter 'swiftformat stdin --stdinpath "{}"' '*.swift' '!Pods/*'
