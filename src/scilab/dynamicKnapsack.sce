// Introduction
disp("This is the scilab implementation for the dynamic programming algorithm for solving the knapsack problem. The knapsack problem can be briefly summarized as follows. We have a set of objects, that have specific weights and specific associated values. Given a limit W on the maximum weight we can carry, we have to accumulate objects such that their total weight does not exceed W and their total value is maximized.");

// Specifying the input.
disp("We begin by specifying the input. Our input variables are...");
disp("The weight-value matrix,where the first entry in the ith row denotes the weight of object at index i and second entry in the same row denotes the corressponding value (Specified below)");
wv = [12 4;1 1;1 2;2 2;4 10];
disp(wv);
disp("The number of entries is specified below");
N = 5;
disp(N);
disp("And the limit W, the maximum value of weight that we can carry. (Value below)");
W = 15;
disp(W);

//Running the algorithm
disp("We will illustrate the algorithm and then test it on the test case which is the input specified above...");
//Step 1 :Sorting the matrix according to the weights.
disp("Step 1 : We first sort the matrix according to the weights using gsort command in scilab");
[C,I] = gsort(wv(:,1),'r','i');
wv = wv(I,:);
disp("The sorted matrix(according to the weights) now is...")
disp(wv);

// Step 2 : -Notation
disp("We explain a bit of notation for step 2 and further. In our notation m(i,j) would represent the maximum value that can be accumulated using the first i objects from the sorted matrix of weights and values(wv), given a limit of j, while w(i) denotes the weight of the ith object and v(i) denotes its corresponding value. Thus, for the above input case m is 6X16 since i goes from 0 to 5 and j from 0 to 15.Our goal is to find m(N,W) or the maximum value that can be accumulated given we have a weight limit of W and the items that can be carried are all those available(number denoted by N).");

//Step 2 : Set the first row of the m matrix to 0
disp("Step 2 : We set the first row of the m matrix to be 0. This is logical since if we are not allowed to take any objects (i=0), we cannot accumulate any value.");
m = zeros(1,W+1);
disp(m);

//Step 3 : Evaluate the other entries of the matrix recursively.
disp("Step 3: We now use the recurrence relations");
disp("1. m(i,j) = m(i-1,j) if j<i");
disp("2. m(i,j) = max(m(i-1,j),m(i-1,j-w(i))+v(i)) otherwise");
disp("to evaluate the entire m table");

// Resizing m appropriately
m2 = zeros(N,W+1);
m = [m;m2];

//The j + 1 different from the pseudo code since scilab starts indexing from 1
for i=2:1:6
  for j=0:1:15
    if(j>=wv(i-1,1)) then
      m(i,j+1) = max(m(i-1,j+1),m(i-1,j+1-wv(i-1,1))+wv(i-1,2));
    else
      m(i,j+1) = m(i-1,j+1);    
    end
  end
end

disp("The matrix or table obtained by computing the m values is as follows....");
disp(m);

//Step 4: Recognizing the answer
disp("The answer to our problem, as stated before is the value of m(N,W), where N denotes the elements that can be chosen(all possible elems), and W denotes the upper limit of the weight. Value of m(N,W) and the solution to our problem is ...");
disp(m(N,W));


