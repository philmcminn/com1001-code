# This is the preferred way to initialise
# an empty hash:
hash1 = {}

# You can also initialise with some key-value pairs.
# The syntax is:
#   key => value
hash2 = { "key1" => "value1", "key2" => "value2" }

# Here, we're using symbols.
# The syntax:
#   key: value
# is equivalent to writing:
#   :key => value
# But the former is the preferred style
hash3 = { key1: "value1", key2: "value2" }

# Adding or updating a key-value pair is done as follows:
hash1[1000] = 99
hash2["key3"] = "value3"
# or
hash3[:key3] = "value3"
hash3[:key3] = "value4"

# How we get a value for a key:
puts hash2["key1"]

# This is how we return a default value in the case
# that the key is not in the hash
puts hash1.fetch("non-existent-key", "hi!")

# This is how we remove a key
hash3.delete(:key1)
