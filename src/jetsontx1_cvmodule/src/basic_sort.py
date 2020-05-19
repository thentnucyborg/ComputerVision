#########################################################################
# Cyborg 2020, basic_sort.
# Tracking detected people by evaluating the relative distance between
# the BBs
# Could be integrated with behaviourdetection.py.
#	for this to work with behaviourdetection.py you need to add following 
#	lines in the initialization:
#		prev_outputs = []
#		prev_prev_outputs = []
#		threshold = 0.010
#		global randID
#		randID = 1
#	and following lines after the detections for one frame:
#		prev_prev_outputs = prev_outputs
#		prev_outputs = outputs #save previous bounding boxes
# By Ole Martin Brokstad.
#########################################################################
import math
def basic_sort(prev_outputs,prev_prev_outputs,output,threshold,randID):
	minval = 1000000
	area = (output['right']-output['left'])*(output['bottom']-output['top'])
	print area*0.025
	if prev_outputs and prev_prev_outputs == []:
		output['ID'] = randID
		randID += 1
	else:
		for prev_output in prev_outputs:
			a = output['right']-prev_output['right']
			b = output['left']-prev_output['left']
			c = output['top']-prev_output['top']
			d = output['bottom']-prev_output['bottom']
			dist = math.sqrt(a*a + b*b + c*c + d*d)
			if dist < threshold*area:
				if dist < minval:#chooses the closest BB, not the last BB under the threshold
					output['ID'] = prev_output['ID']
					minval = dist
		if 'ID' not in output:
			for prev_prev_output in prev_prev_outputs:
				a = output['right']-prev_prev_output['right']
				b = output['left']-prev_prev_output['left']
				c = output['top']-prev_prev_output['top']
				d = output['bottom']-prev_prev_output['bottom']
				dist = math.sqrt(a*a + b*b + c*c + d*d)
				if dist < threshold*area:
					if dist < minval:#chooses the closest BB, not the last BB under the threshold
						output['ID'] = prev_prev_output['ID']
						minval = dist
		if 'ID' not in output:
			output['ID'] = randID
			randID += 1