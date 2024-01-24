# Steps From Scratch - Task 3: Feature Engineering

All the steps taken since the start of Task 3 are documented here.

## Create Folder Structure

```markdown
Task3_Feature_Engineering/
├── data/
│   └── titanic_dataset.csv
│
├── documentation/
│   └── README.md
│   └── SETUP.md
│
├── src/
│   ├── subtask1_script.py
│   ├── ...
│   └── subtaskN_script.py
│
└── venv/
```

- **data/:** Folder to contain the Titanic dataset (`titanic_dataset.csv`).
- **documentation/:** Folder to contain all documentation related to Task 3, including README.md and SETUP.md.
- **src/:** Folder to store Python scripts for each sub-task of feature engineering.
- **venv/:** Folder to set up and store the virtual environment for Python.

## Setup Virtual Environment for Python Scripts

### Create a Virtual Environment:

Open a terminal and navigate to the Task3 directory. Then, run the following command:

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

### Install Required Packages:
After activating the virtual environment, install the following necessary packages using pip:

```shell
pip install pandas matplotlib seaborn scikit-learn
```

This will install the Pandas library for data manipulation, Matplotlib and Seaborn for data visualization, and scikit-learn for machine learning tasks.

### Save Requirements.txt File:
Save this to make it easy for others to run this project without dependency issues:

```shell
pip3 freeze > requirements.txt
```