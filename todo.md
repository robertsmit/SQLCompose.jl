# Todolist

* [x] `filter(p::Pair, q::SelectQuery)`  
    filter(:name => equals_alice, grades_2020())  
    filter([:name, :grade_2020] => complex_filter, grades_2020())  
    filter(:name => !=("Alice"), grades_2020())  

* [ ] `select(responses(), :id, :q1)`  
  select(responses(), "id", "q1", "q2")  
  select(responses(), Not(:q5))  
  select(responses(), Not([:q4, :q5]))  
  select(responses(), :q5, Not(:q5))
  select(responses(), :q5, :)
  select(responses(), 1, :q5, :)
  select(responses(), 1 => "participant", :q1 => "age", :q2 => "nationality")  
  transform(behoud andere kolommen): `select(grades_2020(), :, :grade_2020 => plus_one => :grade_2020)`
* [ ] `index map access: SelectQuery[rows,cols]` df[1:2, :name] df[:, :name]
* [ ] `field map access: SelectQuery.id`
* [ ] having
* [ ] sort  
  sort(wrong_types(), :date)
* [ ] window
* [ ] cte
* [x] cte recurse
* [ ] queryset
* [ ] AND linkedlist
* [ ] groupby
  > groupby(all_grades(), :name)  
  > combine(gdf, :grade => mean)
  > gdf = groupby(df, :group)  
  > combine(gdf, [:X, :Y] .=> mean; renamecols=false)
* [ ] Union / Union all  
  > q1 * q2  
  > unique(q1 * q2) * q3  
  > vcat
* [ ] join  
 `innerjoin(grades_2020(), grades_2021(); on=:name)`  
 `outerjoin(grades_2020(), grades_2021(); on=:name)`  
 `crossjoin(grades_2020(), grades_2021())`  
 `crossjoin(grades_2020(), grades_2021(); makeunique=true)`  
 `leftjoin(grades_2020(), grades_2021(); on=:name)` name is common column and once in result  
 `semijoin(grades_2020(), grades_2021(); on=:name)` result of left where exists in right  
 `antijoin(grades_2020(), grades_2021(); on=:name)` result of left where exists in right  

* [ ] printing indented