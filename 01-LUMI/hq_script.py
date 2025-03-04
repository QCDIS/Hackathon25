import random
import sys
import time

print("START")

species = sys.argv[1]
print(f"Processing species {species}")

# Simulate actual computation by a sleep
time.sleep(random.randint(10, 20))

print("DONE")