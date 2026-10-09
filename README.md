# Food Resource Allocation LP

A Linear programming model that allocates a limited ingredient inventory across competing dishes to maximise total HP, with shadow-price analysis to show which ingredients are worth procuring.

The project uses the cooking system in Genshin Impact as a case study for resource allocation. The goal is not to pick the single highest-HP dish. Each dish consumes a different mix of shared ingredients, so the best plan depends on scarcity and the opportunity cost of every ingredient.

**Headline results:** 369,166 HP from 13 of 34 recipes, solved to proven optimality (0% gap). Sensitivity analysis identifies 13 binding ingredients, with sugar and flour as the most valuable to procure.

---

## Problem

Given a fixed inventory of ingredients and 34 recipes, where each dish:

* Provides a known amount of HP
* Requires a specific combination of ingredients
* Competes with other dishes for shared resources

> How should the available ingredients be allocated across dishes to maximise total HP?

---

## Optimisation Model

Let:

* $x_j$ = quantity of dish $j$ to produce
* $HP_j$ = HP provided by one unit of dish $j$
* $a_{ij}$ = quantity of ingredient $i$ required by one unit of dish $j$
* $b_i$ = available inventory of ingredient $i$

**Objective:** maximise total HP

$$
\max \sum_j HP_j x_j
$$

**Ingredient constraints:** for every ingredient $i$

$$
\sum_j a_{ij} x_j \leq b_i
$$

**Integrality:** dishes can't be cooked in fractions

$$
x_j \in \mathbb{Z}_{\geq 0}
$$

The model has 34 decision variables (one per recipe) and 38 constraints (one per ingredient), and is solved with Gurobi.

**Two versions of the model are used:**

1. **Integer model** gives the actual production plan.
2. **Continuous LP relaxation** (integrality dropped, $x_j \geq 0$) is used for sensitivity analysis, because shadow prices are only defined for continuous problems. They are therefore approximations for the integer problem.

---

## Results

### Optimal production plan (integer model)

| Metric | Value |
|---|---|
| Maximum total HP | **369,166** |
| Optimality gap | 0.00% |
| Dishes produced | 13 of 34 recipes |
| Total dishes cooked | 306 |
| Solve time | 0.01 s (7 simplex iterations) |

| Dish | Quantity |
|---|---|
| Radish Veggie Soup | 105 |
| Golden Tempered Jade | 54 |
| Chicken-Mushroom Skewer | 46 |
| Barbeque Ribs | 30 |
| Grilled Fish in Mint Sauce | 26 |
| Mondstadt Hash Brown | 10 |
| Tricolor Dango | 10 |
| Soba Noodles | 7 |
| Veggie Pot Soup | 6 |
| Bulle Soufle | 5 |
| Crispy Potato Shrimp Platter | 4 |
| Matsutake Meat Rolls | 2 |
| Northern Apple Stew | 1 |

The optimal plan spreads production across 13 dishes so that scarce ingredients go where they return the most HP.

### Sensitivity analysis (LP relaxation)

The continuous optimum is **370,054.33 HP**, only 888 HP (0.24%) above the integer optimum, so the shadow prices below are a reasonable guide for the integer problem.

Of the 38 ingredients, 13 are binding (positive shadow price) and 25 have slack.

| Ingredient | Shadow price (HP/unit) | Inventory | Valid up to |
|---|---|---|---|
| Sugar | 3,748.00 | 5 | 8.3 |
| Flour | 1,268.00 | 7 | 467.0 |
| Radish | 1,160.25 | 105 | 111.7 |
| Salt | 1,012.00 | 54 | 100.0 |
| Fowl | 808.00 | 100 | 121.0 |
| Fish | 700.25 | 26 | 32.7 |
| Rice | 630.00 | 10 | 36.5 |
| Matsutake | 460.00 | 5 | 109.7 |
| Pepper | 460.00 | 61 | 119.7 |
| Jam | 315.00 | 10 | 23.0 |
| Potato | 315.00 | 35 | 40.0 |
| Mint | 107.75 | 147 | 164.3 |
| Apple | 56.67 | 5 | 9.0 |

*"Valid up to" is the upper RHS limit: the inventory level up to which the shadow price holds.*

### Interpretation

> **Note:** These conclusions apply only to the current inventory levels and recipe set. Shadow prices and valid ranges depend on which constraints are binding in this particular plan. With a different inventory, an ingredient that is a bottleneck here could have slack, and vice versa. They are not universal statements about the value of these ingredients.

* **Sugar is the most valuable ingredient per unit at current inventory, but only for a few units.** Each extra unit is worth 3,748 HP, but the price holds only up to 8.3 units, so the total gain is roughly 3,748 × 3.3 ≈ 12,400 HP.

* **Flour is the better long-term target.** It's worth less per unit than sugar (1,268 HP), but that value holds up to 467 units.

* **Shadow price and valid range must be read together.** A high price over a narrow range can be worth less than a moderate price over a wide one.

* **Radish, Fish and Mint have narrow ranges.** The optimal plan changes quickly if you restock these, at which point the shadow prices need to be recalculated.

* **25 ingredients have a shadow price of zero at current levels.** Bird egg, butter, cabbage, carrot, milk and others have slack, so extra units add no HP right now. This doesn't mean they are useless: if other ingredients are restocked, the optimal plan may shift and start using them.

**Takeaway:** treat these results as a procurement guide for the current state of the inventory. After restocking, re-run the model to get updated shadow prices rather than relying on the old ones.

---

## Data Pipeline

```text
recipes.json
     │
     ▼
build_recipe_matrix.py
     │
     ▼
recipes.csv  (ingredient-by-dish matrix)
     │
     ▼
optimisation.ipynb  ◄── hp_data.json (HP per dish)
     │
     ├── Integer model: production plan
     └── LP relaxation: shadow prices and RHS ranges
```

Recipe definitions are stored as JSON, and the generated ingredient-by-dish matrix is stored as CSV for the optimisation model. Keeping data separate from model logic makes it easy to swap in a new inventory or recipe set.

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
├── requirements.txt
├── README.md
└── LICENSE
```

---

## Getting Started

```bash
git clone https://github.com/<your-username>/Food-Resource-Allocation-LP.git
cd Food-Resource-Allocation-LP
pip install -r requirements.txt
python src/build_recipe_matrix.py
jupyter notebook notebooks/optimisation.ipynb
```

**Gurobi:** the model needs `gurobipy`. The restricted license that ships with `pip install gurobipy` is large enough for this problem (34 variables, 38 constraints). Gurobi also offers free academic licenses for larger work.

---

## Technologies

Python, Gurobi (`gurobipy`), Pandas, Jupyter Notebook

---

## Key Concepts Demonstrated

* Formulating a resource allocation problem as an LP/MIP
* Binding vs non-binding constraints
* Shadow prices and opportunity cost
* Sensitivity analysis and valid RHS ranges
* Data preparation and separating data from model logic

---

## Why This Matters Beyond the Game

The same structure appears throughout operations and supply chain work:

```text
Ingredients → Raw materials
Dishes      → Products
HP          → Profit / revenue / utility
Inventory   → Available supply
```

Applications include production planning, product mix optimisation, workforce allocation, and capacity planning. Shadow prices answer a real procurement question: *which resource is worth buying more of, and how much?*

---

## Limitations and Extensions

* **HP is the only objective.** Real play also values buff dishes, cooldowns and dish usefulness. Weights or minimum-quantity constraints could capture these.
* **No cap per dish.** Production is limited only by ingredients, so a plan can include 100+ of one dish. A maximum per dish would be more realistic.
* **Standard quality only.** Dish quality variants are ignored.
* **Shadow prices are local.** They come from the relaxed problem and hold only within the stated RHS ranges.

---

## Data Disclaimer

This is an independent, non-commercial optimisation project using Genshin Impact-related recipe and game data for educational and portfolio purposes. Genshin Impact and its related intellectual property are owned by their respective rights holders. This project is not affiliated with or endorsed by HoYoverse.

---

## License

The source code in this repository is licensed under the MIT License. See [`LICENSE`](LICENSE) for details.