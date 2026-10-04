# Food Resource Allocation LP

A **Linear Programming (LP)** model for allocating limited ingredients across competing food products to maximise total HP output.

The project uses food production from **Genshin Impact** as a practical case study for **resource allocation and mathematical optimisation**. The model determines which dishes to produce, and in what quantities, given a finite inventory of ingredients.

The goal is not simply to select the dish with the highest HP. Each dish consumes a different combination of resources, so the optimal production plan depends on **resource availability, ingredient scarcity, and the opportunity cost of using each ingredient**.

---

## Problem

Suppose we have a fixed inventory of ingredients and multiple dishes that can be produced.

Each dish:

* Produces a known amount of HP
* Requires a specific combination of ingredients
* Competes with other dishes for shared resources

The optimisation problem is:

> **How should the available ingredients be allocated across dishes to maximise total HP?**

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

The model is solved using **Gurobi**.

---

## Results

The current model contains:

* **34** possible dishes
* **38** ingredient constraints
* **99** non-zero recipe coefficients

The optimal continuous solution produces approximately:

**528,885 HP**

Selected production quantities include:

| Dish                    | Quantity |
| ----------------------- | -------: |
| Mondstadt Hash Brown    |       10 |
| Matsutake Meat Rolls    |       56 |
| Chicken-Mushroom Skewer |      110 |
| Grilled Tiger Fish      |       18 |
| Golden Tempered Jade    |       54 |
| Barbeque Ribs           |       16 |
| Duck Confit             |       12 |
| Radish Veggie Soup      |      160 |
| Soba Noodles            |        5 |
| Tricolor Dango          |       25 |
| Bulle Soufle            |        5 |

The optimiser does **not** simply favour the dishes with the highest individual HP value. It balances the HP contribution of each dish against the ingredients consumed.

---

## Resource Scarcity and Shadow Prices

One of the more useful outputs of the model is the **shadow price** associated with each ingredient constraint.

A shadow price estimates the marginal value of increasing the available quantity of an ingredient, within the range where the current LP basis remains valid.

For example:

| Ingredient | Shadow Price |
| ---------- | -----------: |
| Sugar      |        3,724 |
| Flour      |        1,268 |
| Mint       |        1,268 |
| Salt       |        1,012 |
| Fish       |          808 |
| Fowl       |          808 |
| Rice       |          606 |
| Raw Meat   |          460 |
| Smetana    |          315 |
| Apple      |            0 |
| Potato     |            0 |
| Tomato     |            0 |

This provides a different perspective from simply looking at the production plan.

For example, **Sugar has a high shadow price**, indicating that additional sugar could increase the objective value significantly, subject to the model's sensitivity range.

Conversely, an ingredient with a shadow price of **0** does not currently provide additional value to the objective if its availability is increased. It is not a binding bottleneck in the current solution.

This is where the model moves beyond "which food gives the most HP?" and into **resource allocation analysis**.

---

## Example: Why Isn't Every Good Dish Produced?

A dish having a high HP value does not necessarily mean the optimiser will produce it.

For example, **Veggie Pot Soup** provides useful HP but is not selected in the optimal solution.

The dish requires:

* Cabbage
* Carrot
* Potato
* Smetana

The model must consider what those ingredients could contribute when allocated to other dishes.

This illustrates an important optimisation principle:

> A resource has value not only because of what it produces directly, but because of the alternative opportunities lost when it is allocated elsewhere.

---

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

* **Python**
* **Gurobi**
* **Pandas**
* **JSON**
* **Linear Programming**
* **Jupyter Notebook**

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

The source code in this repository is licensed under the **MIT License**.

See [`LICENSE`](LICENSE) for details.
