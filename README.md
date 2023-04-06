# SQLCompose.jl

*SQLCompose implementts the compositional construction of SQL queries.*

## Overview

Julia programmers sometimes need to interrogate data with the Structured Query
Language (SQL).  But SQL is notoriously hard to write in a modular fashion.

FunSQL exposes full expressive power of SQL with a compositional semantics.
FunSQL allows you to build queries incrementally from small independent
fragments.  This approach is particularly useful for building applications that
programmatically construct SQL queries.

If you want to learn more about FunSQL, read about [Two Kinds of SQL Query
Builders][tkosqb-url], watch the [JuliaCon 2021 presentation][juliacon2021-url]
([slides][juliacon2021-slides]), explore the [Examples][examples-url], or go
straight to the [Usage Guide][guide-url].

[![FunSQL | JuliaCon 2021][juliacon2021-img]][juliacon2021-url]


## Example

*When was the last time each person born between 1930 and 1940 and living in
Illinois was seen by a healthcare provider?*

<details><summary>Database Schema</summary>

![](./example-schema.drawio.svg)

</details>

<details><summary>Pipeline Diagram</summary>

![](./example-pipeline.drawio.svg)

</details>

<details open><summary>Julia Code</summary>

```julia
From(:person) |>
Where(Fun.between(Get.year_of_birth, 1930, 1940)) |>
Join(From(:location) |> Where(Get.state .== "IL") |> As(:location),
     on = Get.location_id .== Get.location.location_id) |>
LeftJoin(From(:visit_occurrence) |> Group(Get.person_id) |> As(:visit_group),
         on = Get.person_id .== Get.visit_group.person_id) |>
Select(Get.person_id,
       Get.visit_group |> Agg.max(Get.visit_start_date) |> As(:latest_visit_date))
```

</details>

<details><summary>Generated SQL</summary>

```sql
SELECT
  "person_2"."person_id",
  "visit_group_1"."max" AS "latest_visit_date"
FROM (
  SELECT
    "person_1"."person_id",
    "person_1"."location_id"
  FROM "person" AS "person_1"
  WHERE ("person_1"."year_of_birth" BETWEEN 1930 AND 1940)
) AS "person_2"
JOIN (
  SELECT "location_1"."location_id"
  FROM "location" AS "location_1"
  WHERE ("location_1"."state" = 'IL')
) AS "location_2" ON ("person_2"."location_id" = "location_2"."location_id")
LEFT JOIN (
  SELECT
    max("visit_occurrence_1"."visit_start_date") AS "max",
    "visit_occurrence_1"."person_id"
  FROM "visit_occurrence" AS "visit_occurrence_1"
  GROUP BY "visit_occurrence_1"."person_id"
) AS "visit_group_1" ON ("person_2"."person_id" = "visit_group_1"."person_id")
```

</details>

With FunSQL, SQL clauses such as `FROM`, `WHERE`, and `JOIN` are represented by
invocations of `From`, `Where`, and `Join` connected together using the pipe
(`|>`) operator.  Note the absence of a FunSQL counterpart to nested `SELECT`
clauses; when necessary, FunSQL automatically adds nested subqueries and
threads through them column references and aggregate expressions.

Scalar expressions are straightforward: `Fun.between` and `.==` is how FunSQL
represents SQL functions and operators; `Agg.max` is a notation for aggregate
functions; `Get.person_id` is a reference to a column; `Get.location.person_id`
refers to a column fenced by `As(:location)`.

Notably, FunSQL notation does not rely on macros or anonymous functions as they
hinder modular query construction.  FunSQL queries and their intermediate
components are first-class objects that could be constructed independently,
passed around as values, and freely composed together.
