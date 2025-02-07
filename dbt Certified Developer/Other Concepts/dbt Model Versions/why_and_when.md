# Why Use Model Versions?
+ ✅ Prevents Breaking Changes – Old models remain available until teams transition.
+ ✅ Supports Incremental Migrations – Teams can migrate to new versions at their own pace.
+ ✅ Enhances Governance – Version history helps teams track schema changes.
+ ✅ Works Well with dbt Mesh – Different teams can reference different versions safely.

# When to Use Model Versions?
+ ✅ If you need to rename columns or change data types (avoiding breaking changes).
+ ✅ If a model structure changes, but old consumers still depend on the previous version.
+ ✅ If your dbt project supports multiple teams who need time to adapt.
+ ✅ If your organization has strict governance around data schema changes.

## ❌ When NOT to use model versions:

If changes are small and don’t break dependencies, a regular model update is fine.
If the model is only used internally by your team with no external dependencies.
