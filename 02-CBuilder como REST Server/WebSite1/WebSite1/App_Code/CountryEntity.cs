using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CountryEntity
/// </summary>
public class CountryEntity
{
    public string country { get; set; }
    public string currency { get; set; }
}

public class CountriesEntity
{
    public CountryEntity[] data;
}