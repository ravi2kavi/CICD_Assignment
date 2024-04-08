import pandas as pd
from sklearn.linear_model import LogisticRegression
import pickle
import numpy as np
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("data/train.csv")
X = df.drop(columns=['Disease']).to_numpy()
y = df['Disease'].to_numpy()
labels = np.sort(np.unique(y))
y = np.array([np.where(labels == x) for x in y]).flatten()

#model = RandomForestClassifier().fit(X, y)

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

model = GradientBoostingClassifier().fit(X_scaled, y)

with open("model.pkl", 'wb') as f:
    pickle.dump(model, f)
