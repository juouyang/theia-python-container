import torch
import matplotlib.pyplot as plt
myTensor = torch.FloatTensor(7, 7)
myTensor[:, :] = 0   # Assign zeros everywhere in the matrix.
myTensor[3, 3] = 1   # Assign one in position 3, 3
myTensor[:2, :] = 1   # Assign ones on the top 2 rows.
myTensor[-2:, :] = 1    # Assign ones on the bottom 2 rows.
plt.figure()
plt.imshow(myTensor.numpy())
plt.colorbar()
plt.show()
