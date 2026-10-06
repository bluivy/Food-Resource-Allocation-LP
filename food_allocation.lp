\ Model Food production plan
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xe839412dcf6dcca0
Maximize
  920 x[Sweet_Madame] + 630 x[Mondstadt_Hash_Brown]
   + 920 x[Matsutake_Meat_Rolls] + 808 x[Chicken-Mushroom_Skewer]
   + 808 x[Grilled_Tiger_Fish] + 1820 x[Golden_Tempered_Jade]
   + 630 x[Universal_Peace] + 630 x[Squirrel_Fish] + 1818 x[Crystal_Shrimp]
   + 920 x[Barbeque_Ribs] + 808 x[Dry-Braised_Salted_Fish]
   + 808 x[Duck_Confit] + 1818 x[Fish_With_Cream_Sauce]
   + 808 x[Grilled_Fish_in_Mint_Sauce] + 920 x[Grilled_Unagi_Fillet]
   + 920 x[Lakkaberry_Madame] + 808 x[Mint_Jelly] + 630 x[Pita_Pocket]
   + 1268 x[Radish_Veggie_Soup] + 808 x[Smoked_Fish_Steak]
   + 1268 x[Soba_Noodles] + 920 x[Tasses_Ragout] + 920 x[Tea-Smoked_Squab]
   + 630 x[Tonkotsu_Ramen] + 630 x[Tricolor_Dango] + 920 x[Tuna_Sushi]
   + 630 x[Veggie_Pot_Soup] + 2726 x[Poisson_Seafood_Soup]
   + 3748 x[Bulle_Soufle] + 1818 x[Flaming_Red_Bolognese]
   + 630 x[Northern_Apple_Stew] + 1376 x[Crispy_Potato_Shrimp_Platter]
   + 1376 x[Tahchin] + 630 x[Fine_Tea,_Full_Moon]
Subject To
 Apple_inventory: 3 x[Northern_Apple_Stew] <= 5
 Bamboo_Shoot_inventory: 2 x[Tonkotsu_Ramen] <= 54
 Berry_inventory: 2 x[Universal_Peace] + 2 x[Crispy_Potato_Shrimp_Platter]
   <= 812
 Bird_Egg_inventory: x[Tonkotsu_Ramen] + 2 x[Bulle_Soufle]
   + 2 x[Fine_Tea,_Full_Moon] <= 72
 Bulle_inventory: 3 x[Bulle_Soufle] <= 25
 Butter_inventory: x[Northern_Apple_Stew] <= 3
 Cabbage_inventory: 3 x[Veggie_Pot_Soup] <= 239
 Carrot_inventory: 2 x[Universal_Peace] + 2 x[Crystal_Shrimp]
   + 3 x[Veggie_Pot_Soup] <= 33
 Chenyu_Adeptea_inventory: 2 x[Tea-Smoked_Squab] + 3 x[Fine_Tea,_Full_Moon]
   <= 52
 Fish_inventory: x[Grilled_Tiger_Fish] + 4 x[Squirrel_Fish]
   + x[Dry-Braised_Salted_Fish] + 3 x[Fish_With_Cream_Sauce]
   + x[Grilled_Fish_in_Mint_Sauce] + x[Smoked_Fish_Steak] + 3 x[Tuna_Sushi]
   + 4 x[Poisson_Seafood_Soup] + 2 x[Tahchin] <= 26
 Flour_inventory: 2 x[Squirrel_Fish] + 3 x[Pita_Pocket] + x[Soba_Noodles]
   + 3 x[Tonkotsu_Ramen] + 2 x[Flaming_Red_Bolognese]
   + 2 x[Fine_Tea,_Full_Moon] <= 7
 Fowl_inventory: 2 x[Sweet_Madame] + x[Chicken-Mushroom_Skewer]
   + x[Golden_Tempered_Jade] + x[Duck_Confit] + 2 x[Lakkaberry_Madame]
   + 2 x[Tea-Smoked_Squab] + 2 x[Tahchin] <= 100
 Jam_inventory: x[Mondstadt_Hash_Brown] <= 10
 Lakkaberry_inventory: x[Lakkaberry_Madame] <= 72
 Lotus_Head_inventory: 2 x[Universal_Peace] <= 73
 Marcotte_inventory: x[Barbeque_Ribs] + 2 x[Poisson_Seafood_Soup] <= 59
 Matsutake_inventory: 2 x[Matsutake_Meat_Rolls] <= 5
 Milk_inventory: 2 x[Fish_With_Cream_Sauce] + 2 x[Pita_Pocket]
   + 2 x[Tricolor_Dango] + 2 x[Bulle_Soufle] <= 83
 Mint_inventory: x[Fish_With_Cream_Sauce] + x[Grilled_Fish_in_Mint_Sauce]
   + x[Mint_Jelly] + x[Radish_Veggie_Soup] + 2 x[Poisson_Seafood_Soup]
   + 4 x[Crispy_Potato_Shrimp_Platter] <= 147
 Mushroom_inventory: x[Chicken-Mushroom_Skewer] <= 67
 Onion_inventory: 3 x[Tasses_Ragout] <= 28
 Padisarah_inventory: x[Tahchin] <= 5
 Pepper_inventory: x[Grilled_Tiger_Fish] + 2 x[Barbeque_Ribs]
   + x[Northern_Apple_Stew] <= 61
 Pinecone_inventory: 2 x[Mondstadt_Hash_Brown] <= 251
 Potato_inventory: x[Mondstadt_Hash_Brown] + x[Duck_Confit]
   + 2 x[Veggie_Pot_Soup] + 3 x[Crispy_Potato_Shrimp_Platter] <= 35
 Radish_inventory: x[Radish_Veggie_Soup] <= 105
 Raw_Meat_inventory: 2 x[Matsutake_Meat_Rolls] + 2 x[Barbeque_Ribs]
   + 3 x[Pita_Pocket] + 4 x[Tonkotsu_Ramen] + 2 x[Flaming_Red_Bolognese]
   + 3 x[Northern_Apple_Stew] <= 174
 Rice_inventory: 4 x[Universal_Peace] + 3 x[Crystal_Shrimp]
   + x[Tricolor_Dango] + 3 x[Tuna_Sushi] + 4 x[Tahchin] <= 10
 Sakura_Bloom_inventory: 2 x[Tricolor_Dango] <= 168
 Salt_inventory: x[Golden_Tempered_Jade] + x[Dry-Braised_Salted_Fish]
   + x[Smoked_Fish_Steak] + 2 x[Tasses_Ragout] <= 54
 Seagrass_inventory: x[Soba_Noodles] <= 467
 Shrimp_Meat_inventory: 3 x[Crystal_Shrimp]
   + 4 x[Crispy_Potato_Shrimp_Platter] <= 161
 Smetana_inventory: x[Lakkaberry_Madame] + 2 x[Veggie_Pot_Soup] <= 18
 Snapdragon_inventory: 2 x[Tricolor_Dango] <= 109
 Sugar_inventory: x[Squirrel_Fish] + x[Grilled_Unagi_Fillet]
   + x[Mint_Jelly] + x[Bulle_Soufle] + x[Fine_Tea,_Full_Moon] <= 5
 Sweet_Flower_inventory: 2 x[Sweet_Madame] <= 124
 Tomato_inventory: 2 x[Squirrel_Fish] + 2 x[Pita_Pocket]
   + 3 x[Tasses_Ragout] + 2 x[Poisson_Seafood_Soup]
   + x[Flaming_Red_Bolognese] <= 154
 Unagi_Meat_inventory: 3 x[Grilled_Unagi_Fillet] <= 10
Bounds
Generals
 x[Sweet_Madame] x[Mondstadt_Hash_Brown] x[Matsutake_Meat_Rolls]
 x[Chicken-Mushroom_Skewer] x[Grilled_Tiger_Fish] x[Golden_Tempered_Jade]
 x[Universal_Peace] x[Squirrel_Fish] x[Crystal_Shrimp] x[Barbeque_Ribs]
 x[Dry-Braised_Salted_Fish] x[Duck_Confit] x[Fish_With_Cream_Sauce]
 x[Grilled_Fish_in_Mint_Sauce] x[Grilled_Unagi_Fillet] x[Lakkaberry_Madame]
 x[Mint_Jelly] x[Pita_Pocket] x[Radish_Veggie_Soup] x[Smoked_Fish_Steak]
 x[Soba_Noodles] x[Tasses_Ragout] x[Tea-Smoked_Squab] x[Tonkotsu_Ramen]
 x[Tricolor_Dango] x[Tuna_Sushi] x[Veggie_Pot_Soup] x[Poisson_Seafood_Soup]
 x[Bulle_Soufle] x[Flaming_Red_Bolognese] x[Northern_Apple_Stew]
 x[Crispy_Potato_Shrimp_Platter] x[Tahchin] x[Fine_Tea,_Full_Moon]
End
