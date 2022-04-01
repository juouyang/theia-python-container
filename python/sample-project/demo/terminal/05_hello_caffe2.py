from caffe2.python import workspace
import numpy as np
print ('Creating random data')
data = np.random.rand(3, 2)
print(data)
print('Adding data to workspace ...')
workspace.FeedBlob('mydata', data)
print('Retrieving data from workspace')
mydata = workspace.FetchBlob('mydata')
print(mydata)
