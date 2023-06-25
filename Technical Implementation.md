A dataset that contains information on fish, their caught information, and their processing information, as well as all relevant parties.

The bulk of the data is stored in Filecoin, due to low costs.  Verification for this data is stored on-chain, specifically on Polygon due to higher TPS and lower costs.

Core Architecture:
Data is gathered offline over time.  Once 1GiB worth of entires are collected, they are packaged into a single file and uploaded to filecoin with lotus.  Simeltaniously, the CID of the data is uploaded to polygon, serving as verification.