# plus_recon
a facilitator for using ffuf together with anew for forced subdomain recon

remember to allow chmod +x c(:

# Usage
./plus.sh -d target.com

# Operation
sh in this case is nothing innovative, it is more of a facilitator, with the command ffuf -u https://FUZZ.target.com -w worklist | anew target_domain
the idea is that after fuzzing the domain, sh cleans the generated file and leaves only what responded to the domain (:
