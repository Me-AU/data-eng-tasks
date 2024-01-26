# Testing Instructions

Follow these steps to set up and test the Feature Engineering tasks:

## Basic Setup:

### Create a Virtual Environment:

Open a terminal and navigate to the root repo directory. Then, run the following command:

```shell
python -m venv venv
```

### Activate the Virtual Environment:
- On Windows (I'm on Windows): 
```shell
venv\Scripts\activate
```
- On macOS and Linux:
```bash
source venv/bin/activate
```

### Install Task Required Packages:
After activating the virtual environment, install the following necessary packages using pip:

```shell
pip install -r Task3_Feature_Engineering\requirements.txt
```

This will install the Pandas library for data manipulation, Matplotlib and Seaborn for data visualization, and scikit-learn for machine learning tasks.

### [Optional] Install Extra EDA Packages (Heavier in Size):
```shell
pip install -r Task3_Feature_Engineering\eda-requirements.txt
```

## Test the code! 

Switch to venv kernel if VSC doesn't do it automatically

- [Tasks 1-6](../src/tasks.ipynb) is detailed report of the tasks, decisions, and their explanations.
- [Initial EDA](../src/EDA.ipynb) requires extra EDA packages mentioned [above](SETUP.md#[optional]-install-extra-eda-packages-(heavier-in-size:)).

