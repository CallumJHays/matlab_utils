# %% Week 1 maths revision
import numpy as np
from numpy.linalg import inv

A = np.array([[2, 5, 6], [-1, 3, 1], [0, 2, 1]])
B = np.array([[1, 3, -2], [-2, 1, 0], [-2, 0, 3]])
C = np.array([[1, -2], [3, 2], [0, -1]])
D = np.array([[2, 1, -2], [3, -1, 0]])

u = np.array([2, -1, 3])
v = np.array([-1, 3, -1])
w = np.array([4, -2, 3])
x = np.array([-3, 1])

# %% i

print("a) not possible")

print("b)", w @ inv(B) @ v + 1 / 2 * u @ (C @ x))

print("c) not possible")

print("d)", x + C.T @ (inv(A) @ v - B @ w))

print("e)", (A.T @ C + B @ D.T) @ x + u)

print("f) not possible. can't inv(c)")

# %% ii

print("a) orthogonal?", u.dot(v) == 0)

# %%
singular = np.array([[1, -2], [-3, 6]])

# %%
