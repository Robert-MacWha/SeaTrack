# Notes
Nearly 40% of fish sold from resteraunts, markets, and fishmongers are mislabeled[^1].  This problem is worse in Canada and the UK (55%), and much better in the USA (38%).

This is often fraud (since much of the mislabeling comes from people marking lower-grade fish as higher-grade, or different species).  There are even cases of people passing off different animals (often pork) as fish balls.[^1].
> In places pork has been found as a substitute for prawn balls.  That's definitely a good headline issue, shows the problem scale & will probably freak a few people out. 

For Canada, 17.4% of people include fish or shellfish as part of their daily source of proteins[^4].

Illegal, unreported and unregulated (UII) fishing: An estimated 30% of all fishing activities worldwide is made up of UII fishing.  This is most prevent in developing countries, where governments have fewer resources to keep track of fish.  UII is linked to other forms of transportation organized crime.[^3}]

Coastal communities tend to have lower rates of mislabeled fish because of a greater access to local products & a shorter supply chain[^6]
> Clearly some of the problems do come from the middle bits.

### Types of fraud[^2]
#### Substitution
Once a fish is skinned and processed, it's hard to tell the difference between species.  Sellers take advantage of this and sell lower-value species under the guise of higher-value ones.

#### Short-weighting
Process of taking seafood and bumping up the weight by adding additives like breading, glazes, or brines / other soaks.  Much more common, and much less well known.

### Mislabeling
Other qualities about the fish, IE country of origin, can also be falsified.  Generally happes:
- Transshipping—when seafood products are exported through different countries to avoid duties and tariffs
- At-sea transfers—when illegal fishing vessels transfer their catch to cargo vessels carrying legitimately caught seafood
- Falsifying trade documents

> Probably hard to deal with mislabeling happening at the very start or end of the process (I suppose restaurants could give the customers the tags, but we know that won't actually happen).  Is it a big enough problem still if we only solve the middle bits?

### Current Efforts
Government is working on a "Boat to Plate" plan[^3], to make sure that the fish are traceable, both forwards and backwards in the food chain.

> Lots of government-level solutions seem to be implemented / considered.  This could make it harder for a private company to solve - we don't want to compete with the government.  Could this work as a public good / charity?

Shortly after the commitments to traceability started coming out, the pandemic hit.  In the past two years few steps have been taken by countries like Canada, US, Japan, or the EU[^6]

### Status Quo
Practically speaking, fish are tracked using stickers, or "IDs".  For example, a fish will be given a Raw Material Identification "RM-ID" right after it's taken out of the ocean recording who caught it, where it was, what the species is, how much it weights, and other important information.[^5]

The Word Wildlife fund put together a list of six important qualities a tracing system should have:
1. **The Essential Information.** All information regarding a caught fish (measurements and all ‘W- questions’ like who? what? when? how? etc.) to ensure it’s a legal catch.
2. **Full Chain Traceability.** To track the whole chain from sea to table in detail.
3. **Effective Tracking of Product Transformation**. Where and how the product was transformed (if transformed) to verify the legality and sustainability.
4. **Digital Information and Standardized Data Formats.** Electronic data, proper labelling and tracking through standardised data formats.
5. **Verification.** Information must be provided so government or external parties can verify and assess the fish.
6. **Transparency and Public Access to Information**. The system needs to be transparent so everyone, from grandma to Queen Elisabeth, can make conscious decisions based on the supply chain information.

>"Transparency", "Digital Information and Standardized Data", and "Full Chain Traceability" are all points in favor of the blockchain solution.  Public information that's mostly immutable (good in this case) and the entire history is stored on-chain, and cannot be deleted.  Would also potentially provide more transparency on how many fish are lost / leave the system before the final steps.

> In total we're talking about ~256TB of data per year (~2 trillion fish produced, times 128 bytes of total data per fish).  On Filecoin this would cost $600 USD / year, which seems low, but I'll take it[^7]

The USA is already tracking enormous amounts of data through the Customs' Automated Commercial Environment (ACE).  However, data confidentiality laws prevent coherence and interrogability with other public systems[^11].

#### Blockchain
Several trial programs using the blockchain are already underway[^8], namely one run by a co-founder of WWF focused on Patagonian toothfish[^10], and another run in Indonesia for Tuna[^9].  This page also lays out a framework that can be used to determine whether blockchain should be applied to problem, "Do you really need blockchain?"
> In general [this page](https://www.salttraceability.org/story-hub/unpacking-the-blockchain-a-seafood-perspective-on-blockchain-technology/) is a really good resource for explaining this problem, namely looking at the wins to trackability that blockchain provides and existing companies working in this area.

In the NOAA workshop summary on traceability [^11] it stated that "*Technologies, such as blockchain, that are able to link and store records in networks online, are a way to help deal with the massive amounts of data and information that are collected.*"

Blockchain can be used for[^12] :
1. Avoiding a centralized controlling agency, something that cannot really be done given the number of parties with different interests
2. Allow all participants in the market to track the origin and life of the fish
3. Monitoring global trends to identify what species are being caught and information about these species
	1. Could be used to track discrepancies, help catch more fraud
4. Governments could apply obligations for people to use the blockchain to upload their data.  Thus, fish without blockchain identification would be impossible to sell and thus illegal
5. Local sellers would be able to more easily see the prices that catches were bought and sold for, letting them make more informed decisions

##### Commonly Raised Themes
Currently, a few commonly raised themes are[^11] :
1. Standardized and secure electronic data storage is a priority
2. Many countries are adoption separate trackability systems, and there is a need to a singular / interoperable system
3. Ensuring the integrity of in-database data is vital

## Solution
[[Fish Fraud Solution]]

# References
[^1]: The Guardian: Seafood fraud happening on a vast scale: https://www.theguardian.com/environment/2021/mar/15/revealed-seafood-happening-on-a-vast-global-scale
[^2]: Fisheries.gov: Seafood fraud: https://www.fisheries.noaa.gov/national/sustainable-seafood/seafood-fraud
[^3]: Canada.gov:  Boat to plate trackability discussion: https://inspection.canada.ca/about-cfia/transparency/consultations-and-engagement/completed/boat-to-plate-traceability/discussion-paper/eng/1628696092128/1628696092409
[^4]: Canada.gov: Statistics on daily protein sources from 2015 (outdated): https://www150.statcan.gc.ca/n1/pub/11-627-m/11-627-m2018004-eng.htm
[^5]: How traceability works with fishing: https://www.foodunfolded.com/article/where-is-your-fish-from#:~:text=It%20involves%20a%20lot%20of,%2C%20date%2C%20grade%20and%20price.
[^6]: Global News: Canada has a seafood food problem because of mislabeling: https://globalnews.ca/news/8092106/report-half-of-seafood-canada-mislabeled/
[^7]: Filecoin.app - calculator for storage costs per year: https://file.app/
[^8]: Unpacking the use of blockchain for seafood trackability: https://www.salttraceability.org/story-hub/unpacking-the-blockchain-a-seafood-perspective-on-blockchain-technology/
[^9]: Tracking Tuna using the blockchain: https://www.provenance.org/tracking-tuna-on-the-blockchain#:~:text=Six%20years%20later%20on%2022nd,supply%20chain%20transparency%20and%20traceability.
[^10]: OpenSC: https://opensc.org/
[^11]: Seafood Traceability Practitioner's Workshop Summary Report: https://media.fisheries.noaa.gov/2022-03/NOAAStimsonWWFWorkshopReportMarch2022.pdf
[^12]: How emerging data technologies can increase trust and transparency in fisheries: https://academic.oup.com/icesjms/article/77/4/1286/5380566