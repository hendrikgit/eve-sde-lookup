# eve-typeid-lookup
Creates JSON files to lookup typeIDs by name. Uses CCPs STATIC DATA EXPORT (SDE).

The typeID can be used to get pictures from [CCPs image server](https://imageserver.eveonline.com/) for example.

## Resulting files
Running these scrips will create JSON files that look like this:
```json
{"Bantam":582,"Condor":583,"Griffin":584,"Slasher":585,"Probe":586,"Rifter":587,...}
```
By default files for ships, modules and charges will be created but it is easy to add other categories.

## Requirements
* Ruby
* (bash)
* (wget)
* (unzip)

## Usage
First, run the bash script `get-sde.sh` to download the SDE and extract the 3 required YAML files. This script requires wget and unzip.

Or download the SDE data and extract the YAML files a different way.

The YAML files needed for the next step are:
* categoryIDs.yaml
* groupIDs.yaml
* typeIDs.yaml

Next, run the ruby script `create_typeid_lookup_files.rb`. This creates the JSON files in a format as seen above.
