---
layout: page
permalink: /publications/
title: Publications
description: List of publications in reverse chronological order.
years: [2025, 2024, 2023, 2022, 2021, 2020, 2018, 2017, 2016]
nav: true
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f {{ site.scholar.bibliography }} -q @*[year={{y}}]* %}
{% endfor %}

</div>
