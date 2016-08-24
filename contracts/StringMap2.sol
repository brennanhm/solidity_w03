library StringMap2 {

  struct sMap {
    mapping (string => IndexValue) data;
    KeyFlag[] keys;
    uint size;
  }
  struct IndexValue { uint keyIndex; string value; }
  struct KeyFlag { string key; bool deleted; }

  function insert(sMap storage self, string key, string value) returns (bool replaced) {
    uint keyIndex = self.data[key].keyIndex;
    self.data[key].value = value;
    if (keyIndex > 0)
      return true;
    else {
      keyIndex = self.keys.length++; // Assign array length to keyIndex and... ++ Increase the size of the array by one
      self.data[key].keyIndex = keyIndex + 1;
      self.keys[keyIndex].key = key;
      self.size++;
      return false;
    }
  }

  function remove(sMap storage self, string key) returns (bool deleted) {
    uint keyIndex = self.data[key].keyIndex;
    if (keyIndex == 0)
      return false;
    delete self.data[key];
    self.keys[keyIndex - 1].deleted = true;
    self.size--;
    return true;
  }

  function contains(sMap storage self, string key) returns (bool exists) {
    return self.data[key].keyIndex > 0;
  }

  // Iteration
  
  function iterate_start(sMap storage self) returns (uint keyIndex) {
    return iterate_next(self, uint(-1));
  }

  function iterate_valid(sMap storage self, uint keyIndex) returns (bool) {
    return keyIndex < self.keys.length;
  }

  function iterate_next(sMap storage self, uint keyIndex) returns (uint r_keyIndex) {
    keyIndex++;
    while (keyIndex < self.keys.length && self.keys[keyIndex].deleted)
      keyIndex++;
    return keyIndex;
  }

  function iterate_get(sMap storage self, uint keyIndex) returns (string key, string value)
  {
    key = self.keys[keyIndex].key;
    value = self.data[key].value;
  }

}
