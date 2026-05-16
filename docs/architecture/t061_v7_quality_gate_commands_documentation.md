# T061-V7 — Quality Gate Commands Documentation

## Project Name
Small Business Dashboard Starter

## Milestone
Version 7

## Stage Title
Quality Gate Commands Documentation

---

## 1. Purpose

The purpose of this document is to define the official quality gate commands for the project after introducing unit tests in Version 7.

Before Version 7, most stages used:

- dart format
- flutter analyze
- tree snapshot
- change log
- gate decision

Starting from Version 7, flutter test becomes a required quality gate command.

---

## 2. Official Quality Gate Commands

Every future implementation stage should run:

dart format lib test

flutter analyze

flutter test

tree lib /F > docs/architecture/<stage_name>_lib_tree.txt

tree test /F > docs/architecture/<stage_name>_test_tree.txt

---

## 3. Required Success Result

A stage should only pass when:

flutter analyze: No issues found

flutter test: All tests passed

If either command fails, the stage must not be marked as PASS.

---

## 4. Standard Stage Completion Law

Each stage should follow this sequence:

1. Small creation or modification
2. No direct deletion of legacy code
3. No route changes unless the stage requires it
4. Run dart format lib test
5. Run flutter analyze
6. Run flutter test
7. Save lib tree snapshot
8. Save test tree snapshot
9. Write change log
10. Make gate decision

---

## 5. Why flutter test Is Required

flutter analyze checks code quality, imports, syntax, and static analysis.

flutter test checks behavior.

Both are required because:

- analyze can pass while logic is broken
- tests can detect calculation errors
- tests can detect parsing errors
- tests can detect report generation errors
- tests can detect configuration mistakes

---

## 6. Current Protected Areas

After Version 7 unit tests, the following areas are protected:

- DashboardCalculator
- CsvParsingHelpers
- ExportContentBuilder
- DashboardReportGenerator
- defaultClientConfig

---

## 7. Future Quality Gate Expansion

In later versions, the quality gate may expand to include:

- integration tests
- golden UI tests
- screenshot comparison
- performance checks
- CI/CD checks
- security checks

These are not required in Version 7.

---

## 8. Final Decision

From this stage onward, the official project quality gate is:

dart format lib test
flutter analyze
flutter test
tree snapshot
change log
gate decision

A stage is not complete unless analyze and tests both pass.
