from scipy.interpolate import interp1d
import pylab
import numpy as np
x = np.linspace(0, 5, 10)
y = np.exp(x) / np.cos(np.pi * x)
f_nearest = interp1d(x, y, kind='nearest')
f_linear  = interp1d(x, y)
f_cubic   = interp1d(x, y, kind='cubic')
x2 = np.linspace(0, 5, 100)
pylab.plot(x, y, 'o', label='data points')
pylab.plot(x2, f_nearest(x2), label='nearest')
pylab.plot(x2, f_linear(x2), label='linear')
pylab.plot(x2, f_cubic(x2), label='cubic')
pylab.legend()
pylab.show()
