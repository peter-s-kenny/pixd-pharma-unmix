% Set up database tables

    % Insert an instance of the algorithm in a table with unique ID to be linked to the rest of the algorithm in other tables

% DATA PREPROCESSING

        % Display the angular matrix
        pixDAngleShow

        % Creating the mask through k-means clustering and then show the results per angle and as a whole
        mask = pixDMask(rawData,clusterNum,angleBins)
        % Send mask matrix to database including all ML submodels and parameters
        % Q: To what extent can we just treat the data as an image? It is easy to ignore this and press ahead with the current scheme... consider this.

        % show energy dispersive X-ray profile for a chosen sample across range of angles on a plot
        % Show the selected energys as vertical lines
        samples = [1 16 21]; % pures for demonstration
        energies = [10 12 14 16 18]; % Energy in keV
        pixDEnergyGraphs(samplesDemo,energies,mask); %

        % 3d plot showing energy on the x and angle on the z
        pixDEnergyAngleGraphs(samples,energies)

        % Take pure samples and show the profiles as a function of angle for the several energies
        pixDEnergyAngleGraphs(samples)

        % Momentum transfer calculations followed graphing
        X = pixDMomentumTransfer(X)

        % Spline interpolation and then plots
        X = pixDMomentumTransferSplineInterpolation;

        % Smoothing and other signal preprocessing
        X = pixDSpectralPreprocessing(X)

%% DATA REPRODUCTION AND PROJECTION

        % Estimates on error covariance matrix and save to database ('csv')
        Sig = pixDCovEstimates

        % Reproduce with PCA or MLPCA
        X = pixDPCAReproduce(X,MLPCAind,Sig)

        % Outlier detection / Robust PCA.
        pixDOutlierDetection

        % Definition of constraints
        pixDConstraintsDefine

        % Save outlier data, covariance matrices and constraints for this model

% OPTIMISATION AND RESOLUTION

        % ALS algorithm
        pixDAlgorithm

        % Assessment on goodness of model from a fit and prediction point of view
        pixDALSevaluation

        % Assessment of in the data lack of fit is occuring

        % Assessment of rotational ambiguities

        % Save to database

