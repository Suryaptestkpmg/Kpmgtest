#############################################################
#This script will take nested object as an input and a key and will get back the value associated with that key#
##############################################################

# Taking inputs
[string]$object=Read-Host -Prompt "Please enter nested object";
[string]$key=Read-Host -Prompt "Please enter Key";

#Function to convert json into hashtable
function ConvertTo-Hashtable {
    [CmdletBinding()]
    [OutputType('hashtable')]
    param (
        [Parameter(ValueFromPipeline)]
        $InputObject
    )

    process {
        # Return null if the input is null
        if ($null -eq $InputObject) {
            return $null
        }

        #This function will convert all child objects into hash tables (if applicable)
        if ($InputObject -is [System.Collections.IEnumerable] -and $InputObject -isnot [string]) {
            $collection = @(
                foreach ($object in $InputObject) {
                    ConvertTo-Hashtable -InputObject $object
                }
            )

            # Return the array
            Write-Output -NoEnumerate $collection
        } elseif ($InputObject -is [psobject]) { 
            $hash = @{}
            foreach ($property in $InputObject.PSObject.Properties) {
                $hash[$property.Name] = ConvertTo-Hashtable -InputObject $property.Value
            }
            $hash
        } else {
            # If the object isn't an array, collection, or other object, it's already a hash table
            $InputObject

        }
    }
}

try
{
$hash=$object | ConvertFrom-Json | ConvertTo-HashTable
$keys=$key.Split("/")
$value=$hash
    for($k=0;$k -lt $keys.Length;$k++)
    {
        $value=$value.$($keys[$k])
    }
$value;  
}
catch 
{
    Write-Host "Wrong Input provided"
}


