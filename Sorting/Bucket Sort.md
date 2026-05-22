Formula 
First, find the scaling factor of your dataset based on its maximum and minimum values:

$$\text{Normalized} = \frac{n - 1}{\text{max} - \text{min}}$$

Then, use that scaling factor to find the target bucket index for any element $i$:

$$\text{BucketNo} = \lfloor (i - \text{min}) \times \text{Normalized} \rfloor$$

After Filling the Bucket Need to use insertion sort inside the each bucket and then all combine sort output of all bucket orderly
