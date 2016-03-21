import pandas as pd
from sklearn import cross_validation, preprocessing
from sklearn import linear_model, svm, neighbors

myseed = 1234


train_df = pd.read_csv('Original data sets/train.csv')
train_df_labels = train_df.label
train_df = train_df.drop('label', axis=1)

test_df = pd.read_csv('Original data sets/test.csv')

n_samples = train_df.shape[0]

train_df_binar = pd.DataFrame(preprocessing.binarize(train_df, threshold=0), columns=list(test_df))
test_df_binar = pd.DataFrame(preprocessing.binarize(test_df, threshold=0), columns=list(test_df))


# with pd.option_context('display.max_rows', 999):
#     print train_df.iloc[0,:]
#     print "---"
#     print train_df_binar.iloc[0,:]


logreg = linear_model.LogisticRegression()
svc_rbf = svm.SVC(kernel='rbf', gamma=0.7, random_state=myseed)
knn3 = neighbors.KNeighborsClassifier(n_neighbors=3)
models = [logreg, svc_rbf, knn3]

cv_kf5 = cross_validation.KFold(n=n_samples, n_folds=5, shuffle=True, random_state=myseed)
cv_loo = cross_validation.LeaveOneOut(n=n_samples)
cv_lpo10 = cross_validation.LeavePOut(n=n_samples, p=2)
cvs = [cv_kf5, cv_loo, cv_lpo10]

for model in models:
    for validator in cvs:
        scores = cross_validation.cross_val_score(model, train_df_binar, train_df_labels, cv=validator)
        print "Accuracy: %0.5f (+/- %0.2f), cvs: %0.2f" % ( scores.mean(), scores.std() * 2 , len(scores) )
    print "--"
