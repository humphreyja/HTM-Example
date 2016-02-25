# Organic Computing
## Neurons
>Cells are patterns, to validate that the pattern is a match, simply check if the pattern is a subset of its single core set.

* Have a single set(SDR) with 20% of data being 1s the other being 0s
* Have a list of Synapses(SDR) with a strength between 0 and 1 with a threshold or .4
* Have a smaller list of Synapses(SDR) with the same configuration as above but will exist from different regions  

## Math
>Vector with n binary values where each bit represents a neuron

x = SDR
```
x = [b(0), ..., b(n-1)]
```

s = % of ON bits

w = # of ON bits

```
w(x) = s X n = ||x||(1)
```

###### Example
```
x = 00000100000001000000
y = 00000100000000000001

n = 20, s = .1, w = 2
```

Typical ranges for n, s, and w

 n | s |  w
---|---|--
2048 to 65536 | 0.05% to 2% | 40

### Capacity

Unique patterns
```
( n )       n!
(   ) = ----------
( w )    w!(n-w)!
```
###### Example
```
n = 2048
w = 40

total > 10^84
```

## Patterns

Recognizing patterns is done by finding patterns in SDRs.  A SDR is considered to match another SDR by doing an AND between the two sets and seeing if the overlap is large enough to overcome a defined threshold.

###### Example (Ruby)
```ruby
x = Set.new [1,3,5,7,12]
y = Set.new [2,3,5,7,12]
threshold = 3
z = x.intersection y  # >> z = (3,5,7,12)

if z.length >= threshold
  return true
else
  return false
end
```
n = 2048, w = 40
With up to 14 bits of noise (33%), you can classify a quadrillion patterns with an error rate of less than 10^-24
