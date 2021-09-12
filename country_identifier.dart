import 'package:flutter/material.dart';

class NameIdentifier {

  String countryname = 'Canada';
  String initials = 'CA';

  NameIdentifier(String text);

  void getCountry(String countryInitials)
  {
    countryname = countryInitials;
    if (countryInitials == 'United States')
    {
      initials = 'US';
    }

    if (countryInitials == 'Canada')
    {
      initials = 'CA';
    }

    if (countryInitials == 'Italy')
    {
      initials = 'IT';
    }

    if (countryInitials == 'France')
    {
      initials = 'FR';
    }

    if (countryInitials == 'Spain')
    {
      initials = 'SP';
    }

    if (countryInitials == 'Turkey')
    {
      initials = 'TR';
    }

    if (countryInitials == 'Germany')
    {
      initials = 'DE';
    }

    if (countryInitials == 'United Kingdom')
    {
      initials = 'GB';
    }

    if (countryInitials == 'Russia')
    {
      initials = 'RU';
    }

    if (countryInitials == 'Saudi Arabia')
    {
      initials = 'SA';
    }

    if (countryInitials == 'Japan')
    {
      initials = 'JP';
    }

    if (countryInitials == 'Lebanon')
    {
      initials = 'LB';
    }
  }

}