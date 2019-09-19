import os
import glob
from pathlib import Path
from pprint import pprint

p = Path("assets/sounds")
sounds = {"Captain Holt": [], "Terry Jeffords": [], "Charles Boyle": [], "Jake Peralta": [], "Gina Linetti": [], "Rosa Diaz": [], "Amy Santiago": [], "Hitchcock": [], "Scully": [], "Captain CJ": [], "Doug Judy": []}
characters = list(sounds.keys())

for i in p.glob('**/*.mp3'):
  sound_path = str(i).split("sounds/")[1]

  # make sure not system file
  if not (sound_path[0] == "."):
    
    character, filename = sound_path.split('/')[0], sound_path.split('/')[1]

    try: sounds[character].append(filename)
    except: sounds[character] = [filename]

for char, lst in sounds.items():
  sounds[char].sort()

# print(sounds)
# print(f"static List<String> characters = {[key for key in sounds.keys()]};", end="\n")

# print( "static List<List> sounds = [")
# for char, lst in sounds.items():
#   print(f"\t{lst}", end=",\n")
# print("];")

for char, lst in sounds.items():
  for sound in lst:
    print(f"- assets/sounds/{char}/{sound}")