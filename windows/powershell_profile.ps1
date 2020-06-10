# this file path at: $PROFILE


Import-Module posh-git
Import-Module oh-my-posh
Set-Theme robbyrussell

Remove-Item  Alias:gcb

function gst { git status }

function gco { 
    param(
        [string[]]
        [Parameter(Position=0, ValueFromRemainingArguments)]	
        $Remaining
    )
    process {
        git checkout  $Remaining
    }
}

function gcb { 
    param(
        [string]
        [Parameter(Position=0, ValueFromRemainingArguments)]	
        $Remaining
    )
    process {
        git checkout  -b $Remaining
    }
}

function gb { 
    param(
        [string[]]
        [Parameter(Position=0, ValueFromRemainingArguments)]	
        $Remaining
    )
    process {
        git branch  $Remaining
    }
}

function code { cd C:\Users\x93008\code\ }

function cdr{ cd C:\Users\x93008\code\MaxhubAirReceiver }
