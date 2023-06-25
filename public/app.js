import { mainnet } from 'https://unpkg.com/@filecoin-shipyard/lotus-client-schema?module'
import { BrowserProvider } from 'https://unpkg.com/@filecoin-shipyard/lotus-client-provider-browser?module'
import { LotusRPC } from 'https://unpkg.com/@filecoin-shipyard/lotus-client-rpc?module'

document.addEventListener('DOMContentLoaded', () => {
    const uploadButton = document.getElementById('uploadButton');
    const fileInput = document.getElementById('file');
    const userAddressInput = document.getElementById('userAddress');
    const statusDiv = document.getElementById('status');
  
    let provider;
    let signer;
  
    // Check if MetaMask is installed
    if (typeof window.ethereum !== 'undefined') {
        console.log("Metamask installed")
        provider = new ethers.providers.Web3Provider(window.ethereum);
        signer = provider.getSigner();
        uploadButton.disabled = false;
    }
  
    // Upload button click handler
    uploadButton.addEventListener('click', async () => {
        const file = fileInput.files[0];
        const userAddress = userAddressInput.value;

        if (!file || !userAddress) {
            setStatus('Please select a file and enter your address.', 'error');
            return;
        }
  
        // Convert the file to an ArrayBuffer
        const fileData = await file.arrayBuffer();
        const fileSizeInBytes = fileData.byteLength;

        if (fileSizeInBytes > 1024 * 1024 * 1024) {
            setStatus('File size exceeds the limit of 1GB.', 'error');
            return;
            }
  
        try {
            setStatus('Uploading file to Filecoin...', 'pending');
    
            // Initialize the Lotus client
            const lotus = new LotusRPC('ws://localhost:1234/rpc/v0');
    
            // Upload file to Filecoin
            // TODO: Figure out the local lotus node isn't working.  Something to do with Live Server maybe?
    
            setStatus(`File uploaded to Filecoin (CID: ${filecoinCID}).`, 'pending');
    
            // Send the CID to the SeaTrack contract on Polygon
            const seaTrackContractAddress = '0xa289023f75234053E48266408B52802eb59c6839';
            const seaTrackContractABI = [
                {
                    "inputs": [
                      {
                        "internalType": "contract IWorldID",
                        "name": "_worldId",
                        "type": "address"
                      }
                    ],
                    "stateMutability": "nonpayable",
                    "type": "constructor"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      },
                      {
                        "internalType": "address",
                        "name": "addr",
                        "type": "address"
                      }
                    ],
                    "name": "addAddress",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      },
                      {
                        "internalType": "bytes",
                        "name": "cid",
                        "type": "bytes"
                      }
                    ],
                    "name": "addCID",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      },
                      {
                        "internalType": "bytes",
                        "name": "cid",
                        "type": "bytes"
                      }
                    ],
                    "name": "addCIDApproved",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "uint256",
                        "name": "role",
                        "type": "uint256"
                      },
                      {
                        "internalType": "contract IWorldID",
                        "name": "worldcoin_id",
                        "type": "address"
                      },
                      {
                        "internalType": "bool",
                        "name": "global",
                        "type": "bool"
                      }
                    ],
                    "name": "createAdmin",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "uint256",
                        "name": "role",
                        "type": "uint256"
                      },
                      {
                        "internalType": "contract IWorldID",
                        "name": "worldcoin_id",
                        "type": "address"
                      }
                    ],
                    "name": "createUser",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [],
                    "name": "disableSelf",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      }
                    ],
                    "name": "disableUser",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      },
                      {
                        "internalType": "uint256",
                        "name": "role",
                        "type": "uint256"
                      },
                      {
                        "internalType": "contract IWorldID",
                        "name": "worldcoin_id",
                        "type": "address"
                      }
                    ],
                    "name": "editUser",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      }
                    ],
                    "name": "enableUser",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      },
                      {
                        "internalType": "address",
                        "name": "addr",
                        "type": "address"
                      }
                    ],
                    "name": "isApprovedAddress",
                    "outputs": [
                      {
                        "internalType": "bool",
                        "name": "",
                        "type": "bool"
                      }
                    ],
                    "stateMutability": "view",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "user",
                        "type": "address"
                      },
                      {
                        "internalType": "address",
                        "name": "addr",
                        "type": "address"
                      }
                    ],
                    "name": "removeAddress",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "",
                        "type": "address"
                      }
                    ],
                    "name": "users",
                    "outputs": [
                      {
                        "internalType": "uint256",
                        "name": "role",
                        "type": "uint256"
                      },
                      {
                        "internalType": "bool",
                        "name": "local_admin",
                        "type": "bool"
                      },
                      {
                        "internalType": "bool",
                        "name": "global_admin",
                        "type": "bool"
                      },
                      {
                        "internalType": "contract IWorldID",
                        "name": "worldcoin_id",
                        "type": "address"
                      },
                      {
                        "internalType": "contract IWorldID",
                        "name": "admin",
                        "type": "address"
                      },
                      {
                        "internalType": "bool",
                        "name": "disabled",
                        "type": "bool"
                      },
                      {
                        "internalType": "bool",
                        "name": "verified",
                        "type": "bool"
                      }
                    ],
                    "stateMutability": "view",
                    "type": "function"
                  },
                  {
                    "inputs": [
                      {
                        "internalType": "address",
                        "name": "signal",
                        "type": "address"
                      },
                      {
                        "internalType": "uint256",
                        "name": "root",
                        "type": "uint256"
                      },
                      {
                        "internalType": "uint256",
                        "name": "nullifierHash",
                        "type": "uint256"
                      },
                      {
                        "internalType": "uint256[8]",
                        "name": "proof",
                        "type": "uint256[8]"
                      }
                    ],
                    "name": "verify",
                    "outputs": [],
                    "stateMutability": "nonpayable",
                    "type": "function"
                  },
                  {
                    "inputs": [],
                    "name": "worldId",
                    "outputs": [
                      {
                        "internalType": "contract IWorldID",
                        "name": "",
                        "type": "address"
                      }
                    ],
                    "stateMutability": "view",
                    "type": "function"
                  }
            ];
    
            // Create an instance of the SeaTrack contract
            const seaTrackContract = new ethers.Contract(seaTrackContractAddress, seaTrackContractABI, signer);
    
            // Encode the function parameters
            const encodedParams = ethers.utils.defaultAbiCoder.encode(['address', 'bytes'], [userAddress, filecoinCID]);
    
            setStatus('Sending CID to SeaTrack contract on Polygon...', 'pending');
    
            // Send the transaction to the SeaTrack contract
            const tx = await seaTrackContract.addCIDApproved(userAddress, filecoinCID, { data: encodedParams });
    
            // Wait for the transaction to be mined
            await tx.wait();
    
            setStatus('File uploaded to Filecoin and CID sent to SeaTrack contract on Polygon.', 'success');
        } catch (error) {
            console.error(error);
            setStatus('An error occurred. Please try again.', 'error');
        }
    });
  
    // Helper function to set the status message and styling
    function setStatus(message, status) {
        statusDiv.innerText = message;
        statusDiv.className = status;
    }
});