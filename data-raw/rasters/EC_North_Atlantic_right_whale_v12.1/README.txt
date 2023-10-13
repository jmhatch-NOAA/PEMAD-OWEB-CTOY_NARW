Habitat-Based Marine Mammal Density Models for the U.S. Atlantic: 2022 Updates

North Atlantic right whale (Eubalaena glacialis) Model Version 12.1 (2023-05-27)

Duke University Marine Geospatial Ecology Lab (MGEL)

Abstract
--------

In 2016, together with our collaborators, we published density models for 26
cetacean species and 3 guilds inhabiting U.S. waters of the western North
Atlantic and northern Gulf of Mexico (Roberts et al. 2016). After
publication, we began an update to the Atlantic (a.k.a. "East Coast") models
that utilized the same methodology but incorporated additional survey data
not available for use in models published in 2016. During 2017-2021, we
released updated models for many of the East Coast taxa as additional data
accumulated and new collaborators joined the project. Finally, in 2022, we
released a comprehensive set of updated models covering all taxa. This model
contains the 2022 update for North Atlantic right whale.

This update was produced as part of an ongoing cooperative research agreement
with the U.S. Navy, which also funded the production of the initial models
(Roberts et al. 2016). Although this update has not yet been released as part
of a new peer-reviewed publication, we are releasing the updated results
prior to formal publication at the request of NOAA and other stakeholders in
the community. This model utilized the same overall methodology as the models
published in 2016 and was subjected to formal review and revision by the
model collaborators, many of whom are experts the ecology of the marine
mammal species inhabiting this region. We consider this update a replacement
for the model originally published in 2016. 

We are currently preparing a new peer-reviewed journal manuscript that will
cover this model. Meanwhile, you can refer to our recent report to the U.S.
Navy (Roberts et al. 2023) for updated methodological details and summary
information. For details about this specific model, please refer to the
taxon-specific supplementary report that accompanies this README file. If you
have questions, please contact jason.roberts@duke.edu and
tina.yack@duke.edu. 

Important Note
--------------

Consistent with our recent versions of this model, and with other research
indicating that right whales exhibited major demographic and distributional
changes around 2010 or 2011 (e.g. Pace et al. 2017; Davis et al. 2017;
Meyer-Gutbrod et al. 2021), we summarized the results into three eras:

* "2003-2009" - spanned October 2003 - September 2010
* "2003-2019" - spanned October 2003 - September 2020
* "2010-2019" - spanned October 2010 - September 2020

For informational purposes, we included summary rasters and maps of all three
eras in this zip file. For management applications, e.g. estimation of takes
for an Incidential Harrassment Authorization, we recommend the most recent
era ("2009-2019") be used. However, please consult the relevant regulatory
agency (e.g. NOAA Office of Protected Resources) for authoritative
instructions.

Contents of this zip file
-------------------------

Animations/
    *.mp4 - Video animations of selected monthly maps mentioned below.

Rasters/

    *_density*.img - Rasters giving the estimated mean density per grid cell
    for the given month, averaged over all years of the given era. Density is
    expressed as the number of individual animals per 100 square km. To
    convert to individuals per 1 square km, divide the cell values by 100. To
    convert to individuals per grid cell, divide by 100 and multiply by 25,
    the cell area in km. 

    *_standard_error*.img - Rasters giving the estimated standard error of the
    density estimates. These have the same unit as the density rasters. This
    and the other uncertainty statistics below incorporated variance
    resulting from uncertainty in the model's parameter estimates as well as
    variance resulting from temporal variations in dynamic covariates.
    Different regions of the study area were modeled with different
    covariates; see the accompanying taxon report for details. In the northeast,
    several seasonal models were used. The temporal variability incorporated
    into a given sub-model depended on the covariates used. For models that
    utilized contemporaneous dynamic covariates, the variability included
    both seasonal and interannual variability. For models that utilized
    climatological dynamic covariates, it included seasonal variability only.
    For technical information on the method used to estimate uncertainty,
    please see Roberts et al. (2023).

    *_cv*.img - Rasters giving the estimated coefficient of variation of the
    density estimates. These values are unitless and were computed as standard
    error divided by density.

    *_5_percent*.img, *_95_percent*.img - Rasters giving the lower and upper 90%
    confidence interval around the density estimates. These have the same unit
    as the density rasters.

Maps/

    *.png - Maps of density, survey effort, standard error, and CV at 300 dpi.

ArcGIS_Symbology/

    *.lyr - ArcGIS "layer" files for symbolizing the rasters above using the
    a Classified symbology that has the same breaks and colors as our maps. To
    use these, load the raster into ArcGIS and import the symbology from the
    file. The CV rasters should use the CV .lyr file; all others should use the
    Density .lyr file.

Citation
--------

When citing our methodology or results generally, until the new publication is
in press, please cite Roberts et al. (2016, 2023). The complete references
appear at the end of this document.

When citing this model specifically, please use the following reference.
(We are still finalizing the list of coauthors for this model so for now we
have only listed members of Duke MGEL who participated.)

Roberts JJ, Yack TM, Cañadas A, Fujioka E, Halpin PN, et al. (2022) Density
Model for North Atlantic Right Whale (Eubalaena glacialis) for the U.S. East Coast,
Version 12.1, 2023-05-27, and Supplementary Report. Marine Geospatial
Ecology Laboratory, Duke University, Durham, NC

Questions
---------

If you have any questions about this model or its files, please contact Jason
Roberts (jason.roberts@duke.edu).

Model Version History
---------------------

Version 1 (2013-02-20):
  Draft model of spring season only, for NOAA internal meetings.

Version 2 (2013-04-30):
  All four seasons modeled; many improvements implemented, too numerous to list.

Version 3 (2013-05-08):
  Figures regenerated with improved label placement. No changes to models.

Version 4 (2014-05-28):
  Shrunk spring and fall seasons to two months, expanded summer to five.
  Reformulated density model using a Horvitz-Thompson estimator. Eliminated GAM
  for group size (consequence of above). Added group size as a candidate
  covariate in detection functions (benefit of above). Added survey ID as a
  candidate covariate in NOAA NARWSS detection functions. Took more care in
  selecting right-truncation distances. Fitted models with contemporaneous
  predictors, for comparison to climatological. Switched SST and SST fronts
  predictors from NOAA Pathfinder to GHRSST CMC0.2deg L4. Changed SST fronts
  algorithm to use Canny operator instead of Cayula-Cornillon. Switched winds
  predictors from SCOW to CCMP (SCOW only gives climatol. estimates.) Added
  DistToEddy predictors, based on Chelton et al. (2011) eddy database. Added
  cumulative VGPM predictors, summing productivity for 45, 90, and 180 days.
  Added North Atlantic Oscillation (NAO) predictor; included 3 and 6 month lags.
  Transformed predictors more carefully, to better minimize leverage of
  outliers. Implemented hybrid hierarchical-forward / exhaustive  model
  selection procedure. Model selection procedure better avoids concurvity
  between predictors. Allowed GAMs to select between multiple formulations of
  dynamic predictors. Adjusted land mask to eliminate additional estuaries and
  hard-to-predict cells.

Version 5 (2015-01-20):
  Added additional surveys from UNCW and Virginia Aquarium. Changed winter to
  four months (Dec-Mar), spring to two (Apr-May), and summer and fall to three
  (Jun-Aug and Sep-Nov).

Version 5.1 (2015-01-20):
  Updated the documentation. No changes to the model.

Version 5.2 (2015-03-06):
  Updated the documentation. No changes to the model.

Version 5.3 (2015-04-06):
  Updated the documentation. No changes to the model.

Version 5.4 (2015-05-14):
  Updated calculation of CVs. Switched density rasters to logarithmic breaks. No
  changes to the model.

Version 5.5 (2015-10-12):
  Updated the documentation. No changes to the model.

Version 5.6 (2016-04-21):
  Switched calculation of monthly 5% and 95% confidence interval rasters to the
  method used to produce the year-round rasters. (We intended this to happen in
  version 5.4 but I did not implement it properly.) Updated the monthly CV
  rasters to have value 0 where we assumed the species was absent, consistent
  with the year-round CV raster. No changes to the other (non-zero) CV values,
  the mean abundance rasters, or the model itself. Model files released as
  supplementary information to Roberts et al. (2016).

Version 6 (2017-06-01):
  Began update to Roberts et al. (2015) model. Introduced new surveys from
  AMAPPS, NARWSS, UNCW, VAMSC, and the SEUS NARW teams. Updated modeling
  methodology. Switched to a two-season spatial model and adjusted model
  subregions. Changed aerial g(0) estimates to be based on geographic region,
  group size, and presence of calves. Refitted detection functions and spatial
  models from scratch using new and reprocessed covariates.

Version 7 (2017-09-30):
  Switched back to four season model with new season and subregion definitions
  (relative to Roberts et al. 2015). Model released as part of a scheduled
  update to the U.S. Navy Marine Species Density Database (NMSDD).

Version 8 (2019-03-26):
  Updated density predictions for Cape Cod Bay for January-May with estimates
  from Ganley et al. (2019). Adjusted subregion definitions and model
  formulations to eliminate edge effects. Otherwise this version is identical to
  version 7. Model released in collaboration with NOAA Fisheries following the
  April 2019 ALWTRT meeting.

Version 9 (2020-05-06):
  This was a substantial update over version 8. We extended the aggregate
  database of surveys to extend up through early 2019 (vs. through 2016 in
  verison 8). The additional surveys contributed by collaborators included:
  NOAA NEFSC and SEFSC AMAPPS aerial and shipboard from 2016, 2017, and spring
  2019;  NEFSC pre-AMAPPS HB-07-09 cruise; NEFSC NARWSS for 2017 through spring
  2019; southeast U.S. right whale EWS surveys from 2016/17, 2017/18, and
  2018/19; VAMSC Navy surveys for 2016-2017; UNCW Navy surveys 2017; HDR Navy
  surveys for 2018; NYS-DEC/TetraTech NYBWM Years 1 and 2 surveys (2017-2018);
  New England Aquarium NLPSC 2011-2015 and MMS-WEA 2017-2018 aerial surveys. We
  shifted the start date of the model forward to 2003 (vs. 1998 in version 8),
  to make it more recent and to better equalize survey coverage between the
  north and south. We increased the spatial resolution to 5 km.  At NOAA's
  request, we adjusted the study area to extend farther inshore in certain bays
  and estuaries, to facilitate better use of the model in NOAA's right whale
  take reduction decision support tool. We reformulated and refitted all
  detection functions and regional spatial models. We applied new availability
  bias corrections formulated using the Laake et al. (1997) estimator; the
  corrections accounted for survey altitude and speed, regional whale dive
  behavior, and, where possible, whale group size and composition. We summarized
  results into two eras, 2003-2009 and 2010-2018, reflecting the apparant major
  shift in right whale distributions around 2010. For comparison, we also
  summarized results in to a third era that spanned the entire period 2003-2018.
  We documented the overall model in a report to the U.S. Navy (Roberts et al.
  2020) in summer 2020 and released it for public use in collaboration with NOAA
  Fisheries. The Navy Marine Species Density Database (NMSDD) was not updated at
  this time; the Navy will take delivery of the model in Feburary 2022 as
  scheduled.

Version 10 (2020-10-13):
  This was a minor update to version 9, undertaken after NOAA NEFSC (B. Shank)
  reported implausibly high densities in spring months in the vicinity of
  Massachusetts Bay. To correct this problem we introduced additional survey
  data collected by NEFSC in spring of 2019, fixed a model term that caused an
  unrealistic extrapolation into Massachusetts Bay and refitted the "Spring"
  model in the "North of Nantucket Shoals" region. This fixed the problem in
  spring months around Massachusetts Bay, while leaving the rest of the Gulf of
  Maine region essentially the same as version 9. The additional data included
  additional effort and sightings in the "Hatteras Island to Nantucket Shoals"
  region, so we refitted that model as well, resulting in slightly higher
  predictions south of Nantucket. Predictions south of Hatteras Island are the
  same as version 9. For more details about this update, please see Section 3 of
  Roberts et al. (2021).

Version 11 (2021-02-27):
  This was a minor update to version 10, undertaken in response to a request
  from the Massachusetts Division of Marine Fisheries that we reexamine the
  problem of how best to estimate abundance in Cape Cod Bay for the month of
  December. We prepared a new estimate based on all surveys conducted by the
  Center for Coastal Studies during the month of December from 2003-2020. The
  only predictions that changed during this update were for grid cells of Cape
  Cod Bay in the month of December. For more information about this, please see
  Section 4 of Roberts et al. (2021) and the Appendix of that report.

Version 11.1 (2021-11-22):
  In this update, the density surfaces remain unchanged from version 11, but we
  have added uncertainty surfaces to go with them. Section 5 of Roberts et al.
  (2021) gives complete details of how uncertainty was derived. As discussed
  there, the density surfaces represent means for each month averaged over an
  era, either 2003-2009, 2010-2018, or 2003-2018. The uncertainty surfaces
  estimate how much density is likely to vary from the mean if a random year was
  selected from that era, accounting for the estimated statistical error in
  model parameter estimates and, when possible, the interannual variability in
  the model covariates over the era. The uncertainty surfaces include standard
  error (see Roberts et al. 2021 for the specific definition), the coefficient
  of variation, and the lower (5%) and upper (95%) limits of a 90% confidence
  interval. These are similar to what we provided with the model up through
  version 8, but now account for interannual variability. (Version 8 and prior
  only accounted for the estimated statistical error in model parameter
  estimates.)

Version 12 (2022-02-14):
  This model is a major update over version 11. We incorporated additional
  surveys from all collaborators through 2020. (Due to data limitations, the
  last month predicted by the model is September 2020.) We reformulated and
  refitted all detection functions and spatial models. We updated all
  enviromental covariates to newer products, when available, and added several
  covariates to the set of candidates. Similar to verison 11.1, uncertainty
  outputs account for variance derived from uncertainty in model parameter
  estimates and from temporal variability. In all regions, this includes both
  seasonal and interannual variability, except in August and September north of
  the Great South Channel, where data limitations necessitated the use of
  climatological covariates, for which only seasonal variability is derivable.
  The model was released as part of the final delivery of the U.S. Navy Marine
  Species Density Database (NMSDD) for the Atlantic Fleet Testing and
  Training(AFTT) Phase IV Environmental Impact Statement.

Version 12.1 (2023-05-27):
  Completed the supplementary report documenting the details of this model.
  Corrected the 5 and 95 percent rasters so that they contain the value 0 where
  the taxon was asssumed absent, rather than NoData. Nothing else was changed.

Copyright and License
---------------------

This document and the accompanying files are Copyright (C) 2022 by the Duke
University Marine Geospatial Ecology Laboratory and are licensed under a
Creative Commons Attribution 4.0 International License
(https://creativecommons.org/licenses/by/4.0/).

References
----------

Roberts JJ, Best BD, Mannocci L, Fujioka E, Halpin PN, Palka DL, Garrison LP,
Mullin KD, Cole TVN, Khan CB, McLellan WM, Pabst DA, Lockhart GG (2016)
Habitat-based cetacean density models for the U.S. Atlantic and Gulf of
Mexico. Scientific Reports 6: 22615. doi: 10.1038/srep22615

Roberts JJ, Yack TM, Halpin PN (2023) Marine mammal density models for the
U.S. Navy Atlantic Fleet Training and Testing (AFTT) study area for the Phase
IV Navy Marine Species Density Database (NMSDD). Document version 1.3. Report
prepared for Naval Facilities Engineering Systems Command, Atlantic by the
Duke University Marine Geospatial Ecology Lab, Durham, NC
