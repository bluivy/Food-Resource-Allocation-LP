# Food Resource Allocation LP

A Linear Programming (LP) model for allocating limited ingredients across competing food products to maximise total HP output.

The project uses food production from Genshin Impact as a practical case study for resource allocation and mathematical optimisation. The model determines which dishes to produce, and in what quantities, given a finite inventory of ingredients.

The goal is not simply to select the dish with the highest HP. Each dish consumes a different combination of resources, so the optimal production plan depends on resource availability, ingredient scarcity, and the opportunity cost of using each ingredient.

---

## Problem

Suppose we have a fixed inventory of ingredients and multiple dishes that can be produced.

Each dish:

* Produces a known amount of HP
* Requires a specific combination of ingredients
* Competes with other dishes for shared resources

The optimisation problem is:

> How should the available ingredients be allocated across dishes to maximise total HP?

This is a resource allocation problem that can be formulated as a Linear Program.

---

## Optimisation Model

Let:

* \(x_j\) = quantity of dish \(j\) to produce
* \(HP_j\) = HP provided by one unit of dish \(j\)
* \(a_{ij}\) = quantity of ingredient \(i\) required by dish \(j\)
* \(b_i\) = available inventory of ingredient \(i\)

### Objective

Maximise total HP:

$$
\max \sum_j HP_j x_j
$$

### Ingredient constraints

For every ingredient \(i\):

$$
\sum_j a_{ij}x_j \leq b_i
$$

### Non-negativity

$$
x_j \geq 0
$$

The model is solved using Gurobi.

---

## Results



## Data Pipeline

The project separates source data from the optimisation model.

```text
recipes.json
     │
     ▼
build_recipe_matrix.py
     │
     ▼
recipes.csv
     │
     ▼
Optimisation Model
     │
     ├── Objective: Maximise HP
     ├── Constraints: Ingredient inventory
     └── Sensitivity: Shadow prices
```

Recipe definitions are stored in JSON, while the generated ingredient-by-dish matrix is stored as CSV for use by the optimisation model.

---

## Project Structure

```text
Food-Resource-Allocation-LP/
│
├── data/
│   ├── recipes.json
│   ├── recipes.csv
│   └── hp_data.json
│
├── src/
│   └── build_recipe_matrix.py
│
├── notebooks/
│   └── optimisation.ipynb
│
├── README.md
└── LICENSE
```

---

## Technologies

* Python
* Gurobi
* Pandas
* JSON
* Linear Programming
* Jupyter Notebook

---

## Key Optimisation Concepts Demonstrated

This project demonstrates:

* Linear programming formulation
* Resource allocation
* Objective functions
* Capacity constraints
* Decision variables
* Binding and non-binding constraints
* Resource scarcity
* Shadow prices
* Opportunity cost
* Sensitivity analysis
* Data preparation for optimisation
* Separating input data from model logic

---

## Why This Problem Matters Beyond the Game

Although the dataset comes from a game, the underlying problem is common in real-world operations.

The same mathematical structure can be applied to:

* Manufacturing production planning
* Workforce allocation
* Inventory planning
* Supply chain optimisation
* Raw material allocation
* Product mix optimisation
* Capacity planning

For example, instead of ingredients and dishes:

```text
Ingredients → Raw materials
Dishes      → Products
HP          → Profit / revenue / utility
Inventory   → Available supply
```

The optimisation framework remains largely the same.

---

## Future Improvements

Potential extensions include:

* Integer programming to restrict production to whole dishes
* Ingredient purchasing decisions
* Ingredient costs and budget constraints
* Minimum production requirements
* Multiple objectives such as HP and cost
* Scenario analysis under changing inventory levels
* Automated sensitivity analysis
* Visualisation of resource utilisation
* Comparison between the LP and integer solutions

---

## Data Disclaimer

This is an independent, non-commercial optimisation project using Genshin Impact-related recipe and game data for educational and portfolio purposes.

Genshin Impact and its related intellectual property are owned by their respective rights holders. This project is not affiliated with or endorsed by HoYoverse.

---

## License

The source code in this repository is licensed under the MIT License.

See [`LICENSE`](LICENSE) for details.
