from pathlib import Path
import pandas as pd
from src.recipe_data import recipes


def load_recipe_data(save_csv=True):
    # every unique ingredient across all recipes
    ingredients = sorted({
        ingredient
        for _, ingredient_dict in recipes
        for ingredient in ingredient_dict
    })

    dishes = [dish for dish, _ in recipes]

    rows = []
    for dish, ingredient_dict in recipes:
        row = {"dish": dish}
        row.update({ing: ingredient_dict.get(ing, 0) for ing in ingredients})
        rows.append(row)

    # rows = ingredients, columns = dishes
    recipe_df = pd.DataFrame(rows).set_index("dish").T

    if save_csv:
        path = Path("../Genshin_HP_Food_Optimizer_LP_Model/data/recipes.csv")
        path.parent.mkdir(parents=True, exist_ok=True)
        recipe_df.to_csv(path)   # index kept, see note below

    return recipe_df, dishes, ingredients