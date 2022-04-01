import numpy as np
import pandas as pd
import talib
all_ta_label = talib.get_functions()
all_ta_groups = talib.get_function_groups()
table = pd.DataFrame({
    'TA-Lib Groups': list(all_ta_groups.keys()),
    'Index Count': list(map(lambda x: len(x), all_ta_groups.values()))
})
print(table)
