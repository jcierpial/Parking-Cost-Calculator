%% Project 01 by John Cierpial (cerps RUID: 131008500)
clear
clc
fprintf ('Which of the following parking lots did you park in?\n1. Short Term Parking (Lots A and B, and the C Parking Garage)\n2. Daily Parking (Lot P3 Parking Garage)\n3. Daily Parking (Lot P4 Parking Garage)\n4. Economy Long Term Parking (Lot 6)\n');
lotnumber = input ('Selection (1-4): '); %Input for selection of which lot the user parked in
fprintf ('How long did you park in your selected lot?\n');
hours = input('Hours: ');
minutes = input('Minutes: ');
minutes = (hours.*60) + minutes; %Converts hours to minutes and adds that number to the user-defined minutes
price = 0; %Gives the variable some value to start with
%Each if/elseif statement correlates to different scenarios given on the
%parking value chart. 
if (lotnumber == 1)
    c = minutes/1440; %Converts minutes to fractional days
    day = c - (rem(minutes,1440))/1440; %Makes days an integer
    charge1 = day.*33; %Charge per day
    charge2 = ceil(((rem(minutes,1440)))./30).*3; %Charges for minutes after the # of days is subtracted out
    if (charge2 >= 33) %If total is more than $33 for 24 hour period,
        charge2 = 33; %Total is locked to $33
    end
    total = charge1 + charge2; %Adds the two answers together
    fprintf ('Your parking bill is $%.0f\n', total);
elseif (lotnumber == 2) %Following else/if blocks follow same logic as the first one but with different value to accomodate specified rates
    c = minutes/1440;
    day = c - (rem(minutes,1440))/1440;
    charge1 = day.*24;
    charge2 = ceil(((rem(minutes,1440)))./30).*3;
    if (charge2 >= 24)
        charge2 = 24;
    end
    total = charge1 + charge2;
    fprintf ('Your parking bill is $%.0f\n', total);
elseif (lotnumber == 3)
    c = minutes/1440;
    day = c - (rem(minutes,1440))/1440;
    charge1 = day.*27;
    charge2 = ceil(((rem(minutes,1440)))./30).*3;
    if (charge2 >= 27)
        charge2 = 27;
    end
    total = charge1 + charge2;
    fprintf ('Your parking bill is $%.0f\n', total);
elseif (lotnumber == 4 && minutes < 1440)
    price = 18;
    fprintf ('Your parking bill is $%.0f\n', price);
elseif (lotnumber == 4 && minutes >= 1440)
    price = 6.*ceil((minutes./480));
    fprintf ('Your parking bill is $%.0f\n', price);
else
    fprintf ('Something went wrong. Please try running the script again.\n'); %Just in case something goes amiss, the program will give the user some output so they know to run the script again.
end %Ends the if/elseif blocks