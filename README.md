## SeaTrack
#### Towards Transparent Traceability
Phishing?  No, Fishing

### Scale of the issue
An estimated total of 40% of seafood sold globally is mislabeled.  Certainly, some of these are mistakes.  Mistakes don't explain why nearly all the substitutions involve lower-priced fish masquerading as higher-priced ones.  Sometimes it's from a similar species, often it's not.  Instead of cod you might get catfish[^2].  Sometimes, in the case of Singapore seller in 2019, you might be getting pork in place of your prawn[^1].

These substitutes often come from illegal fisheries that account for 30% of global production[^4]. They undercut legal industry, harming honest players and causing an economic loss of 26 billion dollars annually.[^2]

### Current Challenges
Seafood supply chains are massively complicated.  The status quo of pen and paper simply cannot keep track each of the trillion fish caught every year[^3].  Fraud is often the result of opportunistic middlemen intentionally mislabeling their catches once it's no longer trivial to differentiate species.  Nearly all existing efforts are localized or impenetrable.  Through the US Customs' Automated Commercial Environment vast amounts of data are collected and locked up due to data confidentiality laws[^5].


### Hackathon project overview
So.  Built a decentralized database that keeps track of every single fish, from the moment it's caught to the moment it's sold at metro.  Every sale, we record the transaction on-chain.  Each processing step, we record this on-chain.

Use Filecoin to store the 256TB of data generated yearly[^6].  Each fish is a separate entry accessible via their ID, or the QR code that replaces stickers currently in use.  All supply chain participants have an ID and are given permissions by local legislative bodies.  Fishermen will be allowed to create new instances within the database and populate it with initial information, while processors can divide their fish into multiple fillets.  Since the entire history of the fish is on-chain, analysis is easier.  If the weight of a processed fish is greater than the initial weight, something's clearly not right.

This permission system makes it harder for any individual to falsify information.  It also makes it harder for unreported fish to enter the supply chain because they lack the on-chain representation.  Either government or commercial pressures would push the unrepresented fish become devalued.

Say you're purchasing some fish for dinner.  On the packaging would be a QR code that brings you to this website.   You can see the highlight information, and whether any problems were identified.  If you're a hungry researcher you can access more information on the entire supply chain and specifics for each step.

### Conclusion
I'm reminded of a quotation found in my research.  
> Blockchain, data mining, and AI will not stop UII fishing, will not prevent overfishing and discarding.  But they may help to make global streams of fish and seafood products with the associated flow of money becoming more visible and transparent[^7].

Bad actors will still exist, but it will be easier to track them down and disrupt their operations.  Damage will still be done to local and global ecosystems, but it will be easier to track.  Hopefully, pork won't still be sold in place of prawn.


---

[^1]: https://www.biorxiv.org/content/10.1101/826032v1.full.pdf
[^2]: https://www.theguardian.com/environment/2021/mar/15/revealed-seafood-happening-on-a-vast-global-scale
[^3]: http://www.fishcount.org.uk/published/std/fishcountstudy.pdf
[^4]: https://inspection.canada.ca/about-cfia/transparency/consultations-and-engagement/completed/boat-to-plate-traceability/discussion-paper/eng/1628696092128/1628696092409
[^5]: https://media.fisheries.noaa.gov/2022-03/NOAAStimsonWWFWorkshopReportMarch2022.pdf
[^6]: https://file.app/
[^7]: https://www.salttraceability.org/story-hub/unpacking-the-blockchain-a-seafood-perspective-on-blockchain-technology/
[^8]: https://www.statista.com/outlook/cmo/food/fish-seafood/worldwide