import os
import requests
import json

os.system('clear')
print("Welcome to the Hypixel API command line tool!")
print("--------------------------------------------\n")

while True:
    var_key = input("Enter your API key: ")
    if var_key:
        break
    print("API key cannot be empty, please try again.")

while True:
    var_type = input("Enter the type of request (e.g. player): ")
    if var_type:
        break
    print("Type of request cannot be empty, please try again.")

var_url = f"https://api.hypixel.net/{var_type}?key={var_key}"

while True:
    var_argname = input("Enter an argument name, or press Enter to stop adding arguments: ")
    if not var_argname:
        break
    var_argvalue = input(f"Enter the value of {var_argname}: ")
    if var_argvalue:
        var_url += f"&{var_argname}={var_argvalue}"

print("\nRequesting data from:", var_url, "\n")

response = requests.get(var_url)
var_data = json.loads(response.text)

while True:
    var_jq = input("Enter a jq filter string to filter the results, or type '!' to exit: ")
    if var_jq == "!":
        break
    var_filtered = os.popen(f"echo '{json.dumps(var_data)}' | jq '{var_jq}'").read()
    print(f"\n{json.dumps(json.loads(var_filtered), indent=2)}\n")
