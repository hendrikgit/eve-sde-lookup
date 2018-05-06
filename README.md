# eve-sde-lookup
Uses CCPs Static Data Export (SDE) to create JSON files to lookup information by item (ship, module, etc.) name.  
Currently has scripts to generate files with typeIDs and attributes.

The typeID can be used to get pictures from [CCPs image server](https://imageserver.eveonline.com/) for example.

## Resulting files
Running these scrips will create JSON files that look like the following examples.

### typeID
```json
{"Bantam":582,"Condor":583,"Griffin":584,"Slasher":585,"Probe":586,"Rifter":587}
```
Files for ships, modules and charges will be created by default but it is easy to add other categories.

### Attributes
```json
{
  "Bantam": {"High Slots": 3, "Medium Slots": 4, "Low Slots": 2},
  "Condor": {"High Slots": 4, "Medium Slots": 4, "Low Slots": 2}
}
```
A file for ships and their slots is created, adding other categories or attributes can also be done easily.

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

Next, run the ruby script `create_typeid_lookup_files.rb` and/or `create_attribute_files.rb`. This creates the JSON files in a format as seen above.
