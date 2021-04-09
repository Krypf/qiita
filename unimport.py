#!/usr/bin/env python
# coding: utf-8

# # del test

# In[1]:


import scipy; print('scipy' in dir())
del scipy; print('scipy' in dir())


# In[2]:


from math import e
print(e)

from scipy.constants import e
from scipy.special import gamma
print(e)

print('e' in dir(), 'gamma' in dir())
del e
del gamma
print('e' in dir(), 'gamma' in dir())


# In[3]:


from sympy.abc import *
if 'x' in dir():
    print('x' in dir(), x)
    del x
    print('x' in dir(), 'Done')


# # reload self-made module

# In[4]:


# after restarting kernel
import testmod
# print 0 when imported for the first time
testmod.foo()
del testmod
# bar


# In[5]:


# if you execute
# testmod.foo()
# NameError: name 'testmod' is not defined


# In[6]:


import testmod
testmod.foo()
# bar


# In[7]:


get_ipython().system('python testmod.py')
'''
0
This is a test module named testmod.
x = 0
'''
pass


# In[8]:


from importlib import reload # >= python 3.4
reload(testmod)
# 0


# In[9]:


# 1st foo
from testmod import foo
foo()
# bar
del foo
from testmod import foo
foo()
# bar


# # only saving

# In[10]:


# uncomment 2nd foo and save the file on Jupyter notebook
foo()
#bar


# # plus reload

# In[11]:


from importlib import reload # >= python 3.4
import testmod
reload( testmod )
from testmod import foo
# 0


# In[12]:


# uncomment 2nd foo and save the file on Jupyter notebook 
# then reload
foo()
#bar1


# In[13]:


reload(foo)
# TypeError: reload() argument must be a module 


# In[ ]:





# In[ ]:


get_ipython().system('jupyter --version')
'''
jupyter core     : 4.6.3
jupyter-notebook : 6.1.4
qtconsole        : 4.7.7
ipython          : 7.19.0
ipykernel        : 5.3.4
jupyter client   : 6.1.7
jupyter lab      : not installed
nbconvert        : 6.0.7
ipywidgets       : 7.5.1
nbformat         : 5.0.8
traitlets        : 5.0.5
'''
pass


# In[ ]:


get_ipython().system('python --version')
# Python 3.8.6

