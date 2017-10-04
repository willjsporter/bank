# Bank Tech Test

The aim of the project was to simulate a basic ATM/statement system - ie one that could receive deposits, withdrawals and store all of these transactions to be displayed on a statement.

In the end, there were three classes created:
  1) An account class to act as a user's account class. New accounts are initialized with zero balance and all functionality of the project is run through this class.
  The functions available (excluding private helper methods) are deposit, withdraw and statement (which prints the statement of transactions to date to the command line).
  2) A transaction class: this stored all transactions as new objects in a specific format.
  3) A Statement class: this did all the work behind printing a statement from a given bank account. The class is initialized with an ordered list of transactions (via an array) and then these can be printed via print_statement. However, this class need never be accessed outside of the Bank class as Bank's `statement` method utilises the full functionality of the Statement class.

## How to get me!

`git clone https://github.com/willjsporter/bank.git`

## Technologies

Written in Ruby;

Tested in Rspec;

Linting checked with RuboCop;

Coverage checked with SimpleCov;

Complexity assessed with Flog.

##Usage
Assuming we have an instance of Account: user_account = Account.new:

Deposits - user_account.deposit(deposit_amount)
Withdrawals - user_account.withdrawal(withdrawal_amount)
Viewing statements - user_account.statement (no parameters are required for this).

## Running Tests
To run tests, use the `rspec` command from the root directory.
