# This configures an additional path entry and alias allowing for the x86_64
# version of Homebrew to be used in cases where an Arm-built package has a
# compatibility issue.
#
# Note: This configuration assumes that the Homebrew is installed to the below
#       location:
ROSETTABREW_PREFIX="$HOME/rosettabrew"

export PATH="$ROSETTABREW_PREFIX/opt/bin:$PATH"  # for intel x86_64 brew
alias axbrew="arch -x86_64 $ROSETTABREW_PREFIX/bin/brew"
