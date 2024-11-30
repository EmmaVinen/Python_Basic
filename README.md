# Python_Basic

A template Python repository

## Table of Contents

- [Pyenv and python environments](#pyenv)

## Pyenv and python environments <a name="pyenv"></a>

If you haven't already got pyenv installed, see the [pyenv docs](https://github.com/pyenv/pyenv#installation) on github

You can then install and set up what ever version of python you want to use for this project:

To list avaliable versions of python:

`pyenv install --list`

To install a version of python:

`pyenv install <version>`

To set the version of python for this project:

`pyenv local <version>`

You should then confirm that the correct version of python has been installed and is being used:

`pyenv version`

You can also use a .env file

### Virtual environments and Pex

Once you have the correct version of python installed, you can create a virtual environment for this project:

The most reliable way do this is to use the pyenv exec command to call your python executable:

`pyenv exec python -m venv .venv`

Using pyenv exec avoids issues which can be causes if pyenv has not been correctly set up in your shell/if the pyenv shims have not been correctly configured.
