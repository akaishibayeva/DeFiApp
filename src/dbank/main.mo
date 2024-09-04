import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

stable var currentValue: Float = 300;
currentValue := 100; 
Debug.print(debug_show(currentValue));

// let id = 11;

// Debug.print(debug_show(id));

stable var startTime = Time.now();
startTime := Time.now();
Debug.print(debug_show(startTime));

public func topUp(amount: Float) {
  currentValue +=amount;

  Debug.print(debug_show(currentValue));
};

public func withdraw(amount: Float) {

  let tempValue: Float = currentValue - amount;

  if(tempValue >= 0) {
    currentValue -=amount;

  Debug.print(debug_show(currentValue));
  } else {
    Debug.print("Amount is too large: currentValue is less than zero!");

  }
  
};

public query func checkBalance(): async Float {
  return currentValue;

};

public func compond() {

  let currentTime = Time.now();
  let timeElpasedNS = currentTime - startTime;
  let timeElapsedS = timeElpasedNS / 1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
  startTime := currentTime;

};

}
