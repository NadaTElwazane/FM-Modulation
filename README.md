# Frequency Modulation FM
## Background
Frequency modulation (FM) is a modulation type in which the instantaneous frequency of the carrier is changed according to the message amplitude. The motive behind the frequency modulation was to develop a scheme with inherent ability to combat noise. The noise, being usually modeled as additive, has a negative effect on the amplitude by introducing unavoidable random variations which are superimposed on the desired signal. Unlike the amplitude, frequency has a latent immunity against noise. Since it resides “away” from the amplitude, any changes in the amplitude would be completely irrelevant to the frequency. In other words, there is no direct correlation between the variation in amplitude and frequency, thus making FM a better candidate over AM with respect to noise immunity. However, what FM gains in noise immunity lacks in bandwidth efficiency. Since FM usually occupies larger bandwidth, AM is considered more bandwidth wise. 
## Procedure
- Use Matlab to read the attached audio file, which has a sampling frequency Fs= 48 KHz. Find the spectrum of this signal (the signal in frequency domain).
- Using an ideal Filter, remove all frequencies greater than 4 KHz.
- Obtain the filtered signal in time domain and frequency domain, this is a band limited signal of BW=4 KHz.
- Sound the filtered audio signal (make sure that there is only a small error in the filtered signal)
- Generate the NBFM signal. Use a carrier frequency of 100kHz and a sampling frequency of Fs = 5Fc. Plot the resulting spectrum. 
- Demodulate the NBFM signal using a differentiator and an ED. Assume no noise is introduced. 
