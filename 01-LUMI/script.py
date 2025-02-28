import numpy as np
import matplotlib.pyplot as plt

# Print output
print("Hello from Python script!")

# Generate data - this could be some heavy calculation
x = np.linspace(0, 4*np.pi, 1000)
y = np.sin(x) + 0.2 * np.random.rand(len(x))

# Save data
np.savetxt("data.txt", np.c_[x, y])

# Plot data
plt.figure()
plt.plot(x, y)
plt.xlabel('X')
plt.ylabel('Y')
plt.savefig('data.png')

# Print output
print("Ready!")