#!/usr/bin/env bash
#Author Konstantinos Kostarellis
#https://github.com/delight/python_init_venv/
if [[ $_ == $0 ]]; then
  echo "Usage: 'source $(basename $0)' OR 'source $(readlink -e $0)'"
  exit 1
fi

REQ_FILE_NAME=requirements.txt
SAVEDEPS_SCRIPT_NAME=savedeps

if ! [ -x "$(command -v python3)" ]; then
  echo "python3 not in path"
  exit 1
fi

scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $scriptPath
python3 -m venv venv
cd - > /dev/null 2>&1 

if [ $? -ne 0 ]; then
  echo "Failure setting up the virtual environment. Probably python module venv is missing."
  exit 1
fi

source $scriptPath/venv/bin/activate

REQ_FILE=$scriptPath/$REQ_FILE_NAME
SAVE_DEPS_SCRIPT="$VIRTUAL_ENV"/bin/$SAVEDEPS_SCRIPT_NAME

pip install --upgrade pip > /dev/null 2>&1 

# if [ -f $REQ_FILE ]; then
#   for PKG in $(cat $REQ_FILE); do
#     pip install --upgrade "${PKG}" > /dev/null 2>&1 
#   done
# fi
pip install --upgrade -r $REQ_FILE

echo "#!/usr/bin/env bash" > $SAVE_DEPS_SCRIPT
echo "pip freeze > \$VIRTUAL_ENV/../$REQ_FILE_NAME" >> $SAVE_DEPS_SCRIPT
chmod +x $SAVE_DEPS_SCRIPT

echo "call 'deactivate' to end the virtual environent"
