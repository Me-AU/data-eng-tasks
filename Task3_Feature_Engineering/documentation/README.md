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

### Install Required Packages:
After activating the virtual environment, install the following necessary packages using pip:

```shell
pip install pandas matplotlib seaborn scikit-learn
```

This will install the Pandas library for data manipulation, Matplotlib and Seaborn for data visualization, and scikit-learn for machine learning tasks.

### Save Requirements.txt File:
Save this to make it easy for others to run this project without dependency issues:

```shell
pip3 freeze > Task3_Feature_Engineering\requirements.txt
```

### Install Extra Packages for EDA (Heavier in Size) and Save to Separate reqs.txt:
```shell
pip install sweetviz dtale
pip3 freeze > Task3_Feature_Engineering\eda-requirements.txt
```

## Exploring the Dataset

- Imported relevant libraries, and the dataset.
- Got an overview of the dataset using Pandas.
- Basic data visualization using sweetviz
- Data visualization comparing survived and not_survived using sweetviz.
- Checked some specific distributions using matplotlib and seaborn. 
- Explored a detailed report on the data using D-Tale.

***Note:** From the tasks, it's apparent the data is being prepared for some ML analysis, therefore the tasks are performed keeping this objective in mind. However, the dataset is not being partitioned into the testing and training sets as it is not a requirement in the task.*

***`Important`** The **Source code** and **further Explanation** of all tasks is in **[tasks.ipynb](../src/tasks.ipynb)***

## Sub-Task 1: Data Cleaning

### Basic Cleaning

- Remove completely empty rows
- Drop Unrelated attributes (that occur after the target variable has been decided)
- Check missing values, and start handling them one by one:

### 1. Age

- Missing in a large amount.
- Check most correlated feature with age. (pclass)
- Impute missing values by median (because right skew) on grouping by pclass and sex.

### 2. Embarked

- Only two missing.
- Fill by the most common value (can also be filled by actual research, answer returns the same).

### 3. Fare

- Has only one missing value.
- Check most correlated features with fare. (pclass)
- Filled by median (because of right skew) on grouping by grouping on pclass, parch and sibsp (since they affect number of companions).

### 4. Cabin

- Possible methods and their reasonings attached in detail in [tasks.ipynb](../src/tasks.ipynb).
- Selected method was to turn the column into a binary column like "has_cabin".
- Confirm no other values are left missing.

*[Refer to code?](../src/tasks.ipynb)*

## Sub-Task 2: Feature Extraction

1. Title: Extracted from Name column.
1. Married: Extracted from 'Mrs' in Title column.
1. Family Size: parch + sibsp + 1
1. Alone: if family size = 1
1. Has Cabin: 1 if cabin != 'N/A' else 0
1. Ticket Class: Letters in ticket number, if available.
1. Group Ticket: Extracted by checking duplicate ticket values count.
1. Fare Per Head: fare / group_ticket

*[Refer to code?](../src/tasks.ipynb)*

## Sub-Task 3: Age Grouping

- Explained reason of grouping, and of the number of groups selected.
- Age column grouped by Pandas qcut function.
- Label encode the column.

*[Refer to code?](../src/tasks.ipynb)*

## Sub-Task 4: Fare Binning

- Explained reason of binning, and of the number of bins selected.
- Fare column grouped by Pandas qcut function.
- Label encode the column.

*[Refer to code?](../src/tasks.ipynb)*

## Sub-Task 5: Encoding Categorical Variables

- Non-numeric categorical variables label encoded.
- All non-ordinal categorical variables are one-hot encoded. These included:
    1. pclass
    1. embarked
    1. sex
    1. title
    1. ticket_class
    1. married
    1. alone
    1. has_cabin
    1. ticket_group

*[Refer to code?](../src/tasks.ipynb)*

## Sub-Task 6: Correlation Analysis

- Generate Pearson Correlation Heatmap.
- Analyze these general correlations and their list implications. (12 implications listed)
- Generate separate correlation charts for each feature against the target variable (survived).
- Analyze the detailed correlations and list each feature's implications. (10 features analyzed)

*[Refer to code?](../src/tasks.ipynb)*