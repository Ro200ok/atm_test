
# ATM Emulator

## Description
An ATM emulator that simulates cash dispensing functionality. The ATM contains banknotes with the following denominations: 100, 200, 500, 1000, 2000, and 5000 RUB.

## Features
- **Supported denominations**: 100, 200, 500, 1000, 2000, and 5000 EUR.
- **Banknote limits**: A limit on the number of each denomination (limits) is maintained and kept up to date.
- **Initialization**: Limits can be configured in the code during application initialization.
- **Cash dispensing algorithm**:
  - Starts with the largest available denomination.
  - If the requested amount cannot be dispensed (due to insufficient funds or incompatible denominations), an error is returned.
- **Dynamic limit updates**: After each successful transaction, the banknote limits are updated to reflect the current state of the ATM.

## How It Works
1. **Initialization**: The repository is created with initial limits via constructor; no mutation from outside after registration. Default limits are defined in `AtmConfig.defaultLimits`. Example:
   ```dart
   injector.registerLazySingleton<LimitsRepository>(
     () => LimitsRepository(AtmConfig.defaultLimits),
   );
   ```

2. **Requesting Cash**:
   - Enter the desired amount to withdraw.
   - The application checks if the amount can be dispensed based on the current limits.
   - If the amount can be dispensed:
     - Returns a list of banknotes and their quantities.
   - If the amount cannot be dispensed:
     - Returns an error message.

3. **Updating Limits**: After each transaction, the limits are dynamically updated.

## Example
### Initial Data
- Limits:
  - 5000 EUR: 10 pcs.
  - 2000 EUR: 20 pcs.
  - 1000 EUR: 50 pcs.
  - 500 EUR: 100 pcs.
  - 200 EUR: 200 pcs.
  - 100 EUR: 500 pcs.
- Requested Amount: 7800 EUR.

### Result
- Dispensed banknotes:
  - 5000 EUR: 1 pc.
  - 2000 EUR: 1 pc.
  - 500 EUR: 1 pc.
  - 200 EUR: 1 pc.
  - 100 EUR: 1 pc.

### Error Case
- Requested Amount: 12345 EUR.
- Result: "Error. Unable to dispense the requested amount."

## Technical Details
- **State Management**: `bloc`
- **Dependency Injection**: `getIt`
- **Localization**: `l10n`
- **Algorithm**: Implements a greedy approach, starting with the largest denomination first.

## Requirements
- Flutter SDK
- Dart version 2.12 or higher



