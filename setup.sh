#Set up pyenv/python version, virtual environment, .env file, dependencies, and pre-commit hooks

if [[ -z $PYTHON_VERSION ]]; then
    echo "PYTHON_VERSION env variable is not set"
    read -r -p "Enter the python version you want to use (e.g. 3.8.5): " PYTHON_VERSION
    echo "Using python version $PYTHON_VERSION"
else
  echo "Using python version $PYTHON_VERSION"
fi

if [[ -e .venv ]]; then
  echo "Virtual environment already exists. Skipping setup."
else
  read -r -p "Setting up virtual environment...proceed? [y/n]" response
  if [[ "$response" ==  "y" ]]; then
    # Install and setup python version using pyenv
    pyenv install $PYTHON_VERSION
    pyenv local $PYTHON_VERSION
    # Create virtual environment
    pyenv exec python -m venv .venv
  else
    exit 1
  fi
fi

# Activate virtual environment
source .venv/bin/activate

if [[ -e .env ]]; then
    echo ".env already exists. Skipping setup."
else
  read -p "Setting up .env file...proceed? [y/n]" response
  if [[ "$response" == "y" ]]; then
    cp .env_sample .env
  else
    exit 1
  fi
fi

# Install dependencies
pip install -r requirements.txt

# Install pre-commit hooks
pre-commit install

# Validate pre-commit hooks
pre-commit run --all-files

exit 0
