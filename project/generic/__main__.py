from importlib import import_module
import os


if __name__=='__main__':
    for f in os.listdir():
        if '__main__' not in f and f[-3:]=='.py':
            main=getattr(import_module(f.replace('.py','')),'main')

    main()