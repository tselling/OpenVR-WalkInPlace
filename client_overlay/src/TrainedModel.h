
#include <mlpack/core.hpp>

class TrainedModel {
private:

	int hmdYPeakCount = 0;
	int cntrl1YPeakCount = 0;
	int cntrl2YPeakCount = 0;
	int initTrainStep = 0;
	std::vector<float> cntrlPeaks;

	int samplePerSec = 30.0;
	float dT = 1.0 / (float)samplePerSec;

	float lastHMDVelY = 0;
	float lastHMDACCY = 9999;
	float lastCNTRL1VelY = 0;
	float lastCNTRL2VelY = 0;
	float lastCNTRL1ACCY = 9999;
	float lastCNTRL2ACCY = 9999;

	float minHMDY = 9999;
	float minCNTRLY_slow = 9999;
	float minCNTRLY_medium = 9999;
	float minCNTRLY_fast = 9999;

	std::vector<float> maxHMDVariance;
	std::vector<float> maxCNTRLVariance;
	std::vector<float> minHMDVariance;
	std::vector<float> minCNTRLVariance;

	double lastHMDPeak = 0;
	double lastCNTRL1Peak = 0;
	double lastCNTRL2Peak = 0;
	double maxHMDFRQ = 0;
	double maxCNTRLFRQ = 0;
	double currentSampleTime = 0;

	arma::mat hmdModel;
	arma::mat cntrl1Model;
	arma::mat cntrl2Model;
	arma::mat trkr1Model;
	arma::mat trkr2Model;

public:
	void train(arma::mat model, int kV);
	float computeDelta(arma::mat sample, int kV);

	int isHMDPeak(float hmdY, double dT);
	float isCNTRL1Peak(float cntrl1Y, double dT);
	float isCNTRL2Peak(float cntrl2Y, double dT);

	void saveHMDSample(float hmdYVel, double dT);
	void saveCNTRLSample(float cntrl1Y, float cntrl2Y, double dT, int mode);
	void saveTRKRSample(float trkr1Y, float trkr2Y, double dT, int mode);
};