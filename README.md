# InvokeCutRoH

_The InvokeCutRoH module is a simple string cutting module for powershell._

## Table of contents

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
    1. [Prerequisites](#prerequisites)
    2. [Installation](#installation)
3. [How to use](#how-to-use)
    1. [How to import](#how-to-import)
    2. [Using the function](#using-the-function)
5. [License](/LICENSE)

## Introduction

I've written this module, to have a similar functionality of the linux cut command in windows. The ```Invoke-Cut``` function does not have the full functionality of the linux cut command but implements, in my opinion, the most basic functionalities.

## Getting started

### Prerequisites

- Powershell installed, works with Windows Powershell (preinstalled on Windows) and Powershell Core
- Operatingsystem: Linux or Windows, not tested on mac
- IDE like VS Code, if you want to contribute or change the code

### Installation

The module is not published to PSGallery so you can only download it from github:

1. Using Git
```Powershell
# Powershell
# Creates a directory in your current directory
md InvokeCutRoH
# Change location to the created directory
cd InvokeCutRoH
# Pull necessary files
git pull "https://github.com/IT-Administrators/InvokeCutRoH.git"

```
2. Using Powershell
```Powershell
# Download zip archive using powershell
Invoke-WebRequest -Uri "https://github.com/IT-Administrators/InvokeCutRoH/archive/refs/heads/main.zip" -OutFile "InvokeCutRoH.zip"
# Than expand archive
Expand-Archive -Path ".\InvokeCutRoH.zip"
```

## How to use

### How to Import

You can import the module in two ways:

1. Import from current directory 
```Powershell
# Import from current directory
Import-Module -Path ".\InvokeCutRoH.psm1" -Force -Verbose
```
2. Copy it to your module directory to get it imported on every session start. This depends also on your executionpolicy.

### Using the function

After the module is imported, the function ```Invoke-Cut``` will be available. 

The following example is just a short demonstration on how to use the function. 

The function accepts a file input as well as a single string. If a file is provided the file is read into a string array and then processed line by line. 

```Powershell
# Create a string which you want to cut from. 
$DemoString = "This is a demonstration string."
# Save result to use it.
$Result = Invoke-Cut -InputContent $DemoString -CutCharacterPos 0
# Show result.
$Result

Output: T
```

For more detailed examples use:
```Powershell
Get-Help Invoke-Cut -Full
```

## License

[MIT](/LICENSE)